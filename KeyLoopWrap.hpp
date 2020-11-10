//
//  KeyLoopWrap.hpp
//  mcberepair
//
//  Created by Christopher Hobbs on 11/8/20.
//

#ifndef KeyLoopWrap_hpp
#define KeyLoopWrap_hpp

#include <stdio.h>
#import "ChunkIndex.h"

void loop_all_keys(char *database_path, void *context, void (*fp)(void *, ChunkIndex));

#endif /* KeyLoopWrap_hpp */
