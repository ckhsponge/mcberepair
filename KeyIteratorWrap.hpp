//
//  ListKeys.hpp
//  mcberepair
//
//  Created by Christopher Hobbs on 11/5/20.
//

#ifndef KeyIterator_hpp
#define KeyIterator_hpp

//#include <stdio.h>
//#include <cassert>
//#include <cstdio>
//#include <memory>
//
//#include "db.hpp"
//#include "mcbekey.hpp"

#import "ChunkIndex.h"

class KeyIteratorWrap {
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
//    std::unique_ptr<leveldb::Iterator> iterator;
    
};

#endif /* KeyIterator_hpp */
