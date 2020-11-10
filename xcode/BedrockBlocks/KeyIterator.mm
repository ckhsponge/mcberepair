//
//  KeyIteratorM.m
//  mcberepair
//
//  Created by Christopher Hobbs on 11/5/20.
//

#import <Foundation/Foundation.h>

#import "KeyIterator.h"
#import "KeyIteratorWrap.hpp"

@implementation KeyIterator
{
    KeyIteratorWrap *keyIteratorWrap;
}

-(id)initWithPath:(NSString *) path {
    char *pathC = strdup([path UTF8String]);
    keyIteratorWrap = new KeyIteratorWrap(pathC);
    keyIteratorWrap->start(pathC);
    while(keyIteratorWrap->isValid()) {
        ChunkIndex chunk = keyIteratorWrap->chunk();
        NSLog(@"%d,%d,%d,%d,%d",chunk.dimension, chunk.x, chunk.z, chunk.tag, chunk.subtag);
        keyIteratorWrap->next();
    }
    return self;
}

-(bool) isValid {
    return keyIteratorWrap->isValid();
}

-(void) next {
    keyIteratorWrap->next();
}

-(ChunkIndex) chunk {
//    Chunk c = {-1, -1, -1, -1, -1};
    ChunkIndex c = keyIteratorWrap->chunk();
    return c;
}

-(bool) isOk {
    return keyIteratorWrap->isOk();
}
@end

