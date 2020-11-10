//
//  KeyLoopWrap.cpp
//  mcberepair
//
//  Created by Christopher Hobbs on 11/8/20.
//

#include <cassert>
#include <cstdio>
#include <memory>

#include "db.hpp"
#include "mcbekey.hpp"

#include "KeyLoopWrap.hpp"
#include "ChunkIndex.h"

void loop_all_keys(char *database_path, void *target, void (*got_key_function)(void *, ChunkIndex)) {
    
    std::string path = std::string(database_path) + "/db";
    mcberepair::DB db{path.c_str()};
    
//        database = new mcberepair::DB(path.c_str());
    
    if(!db) {
        fprintf(stderr, "ERROR: Opening '%s' failed.\n", path.c_str());
        exit(1);
    }
    
    // create a reusable memory space for decompression so it allocates less
    leveldb::ReadOptions readOptions;
    leveldb::DecompressAllocator decompress_allocator;
    readOptions.decompress_allocator = &decompress_allocator;
    readOptions.verify_checksums = true;
    readOptions.fill_cache = false;
    
    // create an iterator for the database
    auto it = std::unique_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};

    for(it->SeekToFirst(); it->Valid(); it->Next()) {
        auto key = it->key();
        // print an encoded key
        std::string enckey = mcberepair::encode_key({key.data(), key.size()});
//        printf("%s", enckey.c_str());
//        printf("\t%zu", it->value().size());

        // Identify keys that might represent chunks
        if(mcberepair::is_chunk_key({key.data(), key.size()})) {
            // read chunk key
            auto chunk = mcberepair::parse_chunk_key({key.data(), key.size()});
            // print chunk information
//            printf("\t%d\t%d\t%d\t%d\t", chunk.x, chunk.z, chunk.dimension, chunk.tag);
//            if(chunk.subtag != -1) {
//                printf("%d", chunk.subtag);
//            }
            ChunkIndex chunkO;
            chunkO.dimension = chunk.dimension;
            chunkO.x = chunk.x;
            chunkO.z = chunk.z;
            chunkO.tag = chunk.tag;
            chunkO.subtag = chunk.subtag;
            got_key_function(target, chunkO);
        } else {
//            printf("\t\t\t\t\t");
        }

//        printf("\n");
    }
}
