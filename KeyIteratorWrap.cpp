//
//  ListKeys.cpp
//  mcberepair
//
//  Created by Christopher Hobbs on 11/5/20.
//

//#include "KeyIteratorWrap.hpp"

#include <cassert>
#include <cstdio>
#include <memory>

#include "db.hpp"
#include "mcbekey.hpp"

#import "ChunkIndex.h"

class KeyIteratorWrap {
    std::shared_ptr<leveldb::Iterator> iterator;
//    std::string path;
public:
    KeyIteratorWrap(char *database_path);
    void start(char *database_path);
    bool isValid();
    void next();
    ChunkIndex chunk();
    bool isOk();
//private:
//    std::string path;
//    void *iteratorPointer;
//    std::unique_ptr iterator;
    
};

//std::unique_ptr<leveldb::Iterator> iterator;

KeyIteratorWrap::KeyIteratorWrap(char *database_path) {
}

void KeyIteratorWrap::start(char *database_path) {
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
//    auto it = std::unique_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};
//    auto it = db().NewIterator(readOptions);
//
//    for(it->SeekToFirst(); it->Valid(); it->Next()) {
//        auto key = it->key();
//        // print an encoded key
//        std::string enckey = mcberepair::encode_key({key.data(), key.size()});
//        printf("%s", enckey.c_str());
//        printf("\t%zu", it->value().size());
//
//        // Identify keys that might represent chunks
//        if(mcberepair::is_chunk_key({key.data(), key.size()})) {
//            // read chunk key
//            auto chunk = mcberepair::parse_chunk_key({key.data(), key.size()});
//            // print chunk information
//            printf("\t%d\t%d\t%d\t%d\t", chunk.x, chunk.z, chunk.dimension,
//                   chunk.tag);
//            if(chunk.subtag != -1) {
//                printf("%d", chunk.subtag);
//            }
//        } else {
//            printf("\t\t\t\t\t");
//        }
//
//        printf("\n");
//    }
    
//    iterator = std::unique_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};
    iterator = std::unique_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};
//    iterator = std::shared_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};
//    std::unique_ptr<leveldb::Iterator> iterator = std::unique_ptr<leveldb::Iterator>{db().NewIterator(readOptions)};
//    leveldb::Iterator *iterator = db().NewIterator(readOptions);
//    iteratorPointer = iterator;

    iterator->SeekToFirst();
    
}

bool KeyIteratorWrap::isValid() {
//   leveldb::Iterator *iterator = static_cast<leveldb::Iterator *>(iteratorPointer);
    return iterator->Valid();
//    return false;
}

void KeyIteratorWrap::next() {
//    leveldb::Iterator *iterator = static_cast<leveldb::Iterator *>(iteratorPointer);
    iterator->Next();
}

ChunkIndex KeyIteratorWrap::chunk() {
//    leveldb::Iterator *iterator = static_cast<leveldb::Iterator *>(iteratorPointer);
    ChunkIndex result = {-1, -1, -1, -1, -1};
    
    auto key = iterator->key();
    if(!mcberepair::is_chunk_key({key.data(), key.size()})) {
        return result;
    }
    auto c = mcberepair::parse_chunk_key({key.data(), key.size()});
    result = {c.x, c.z, c.dimension, c.tag, c.subtag};
    return result;
}
    
bool KeyIteratorWrap::isOk() {
//    leveldb::Iterator *iterator = static_cast<leveldb::Iterator *>(iteratorPointer);
    bool b = iterator->status().ok();
    if (!b) {
        fprintf(stderr, "ERROR: Reading failed: %s\n", iterator->status().ToString().c_str());
    }
    return b;
    return false;
}
    
