#include <cassert>
#include <cstdio>
#include <iostream>
#include <memory>

#include "leveldb/cache.h"
#include "leveldb/db.h"
#include "leveldb/decompress_allocator.h"
#include "leveldb/env.h"
#include "leveldb/filter_policy.h"
#include "leveldb/zlib_compressor.h"

#include "mcbekey.hpp"

int main(int argc, char *argv[]) {
    if(argc < 2) {
        printf("Usage: %s <minecraft_world_dir> < list.txt\n", argv[0]);
        return EXIT_FAILURE;
    }

    class NullLogger : public leveldb::Logger {
       public:
        void Logv(const char *, va_list) override {}
    };

    leveldb::Options options;

    // create a bloom filter to quickly tell if a key is in the database or not
    auto filter_policy = std::unique_ptr<const leveldb::FilterPolicy>{leveldb::NewBloomFilterPolicy(10)};
    options.filter_policy = filter_policy.get();

    // create a 40 mb cache (we use this on ~1gb devices)
    auto block_cache = std::unique_ptr<leveldb::Cache>{ leveldb::NewLRUCache(40 * 1024 * 1024) };
    options.block_cache = block_cache.get();

    // create a 4mb write buffer, to improve compression and touch the disk less
    options.write_buffer_size = 4 * 1024 * 1024;

    // disable internal logging. The default logger will still print out things
    // to a file
    auto logger = std::make_unique<NullLogger>();
    options.info_log = logger.get();

    // use the new raw-zip compressor to write (and read)
    auto zlib_raw_compressor = std::make_unique<leveldb::ZlibCompressorRaw>(-1);
    options.compressors[0] = zlib_raw_compressor.get();

    // also setup the old, slower compressor for backwards compatibility. This
    // will only be used to read old compressed blocks.
    auto zlib_compressor = std::make_unique<leveldb::ZlibCompressor>();
    options.compressors[1] = zlib_compressor.get();

    leveldb::Status status;

    std::string path = std::string(argv[1]) + "/db";

    leveldb::DB *pdb = nullptr;
    status = leveldb::DB::Open(options, path.c_str(), &pdb);
    auto db = std::unique_ptr<leveldb::DB>(pdb);

    if(!status.ok()) {
        fprintf(stderr, "ERROR: Opening '%s' failed.\n", path.c_str());
        return EXIT_FAILURE;
    }
    std::string line;
    while(std::getline(std::cin, line)) {
        printf("Deleting key '%s'...\n", line.c_str());
        status = db->Delete(leveldb::WriteOptions(), decode_key(line));
        if(!status.ok()) {
            fprintf(stderr, "ERROR: Writing '%s' failed: %s\n", path.c_str(),
                    status.ToString().c_str());
            return EXIT_FAILURE;
        }
    }

    return EXIT_SUCCESS;
}
