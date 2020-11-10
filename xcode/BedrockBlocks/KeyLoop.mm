//
//  KeyLoop.m
//  mcberepair
//
//  Created by Christopher Hobbs on 11/8/20.
//

#import <Foundation/Foundation.h>

#import "KeyLoop.h"
#import "KeyLoopWrap.hpp"

void got_chunk(void *keyLoopVP, ChunkIndex chunk) {
//    printf("String: %s\n",s);
    KeyLoop *keyLoop = (__bridge id) keyLoopVP;
    [keyLoop addChunk: chunk];
}

@implementation KeyLoop
{
    NSString *path;
}

-(id)initWithPath:(NSString *) pathIn {
    path = pathIn;

    return self;
}

-(bool) go {
//    char *s = strdup("banans");
    void *vp = (__bridge void *) self;
    
    void (*fp)(void *, ChunkIndex) = &got_chunk;
//    fp(vp, s);
    
    char *pathC = strdup([path UTF8String]);
    loop_all_keys(pathC, vp, fp);
    
    return true;
}

-(void) addChunk:(ChunkIndex) chunk {
    NSLog(@"addChunk %d %d %d %d %d\n", chunk.dimension, chunk.x, chunk.z, chunk.tag, chunk.subtag);
}

@end
