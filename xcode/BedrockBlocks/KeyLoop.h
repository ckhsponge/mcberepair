//
//  Header.h
//  mcberepair
//
//  Created by Christopher Hobbs on 11/8/20.
//

#ifndef KeyLoop_h
#define KeyLoop_h

#import "ChunkIndex.h"

@interface KeyLoop : NSObject
-(id)initWithPath:(NSString *) path;
-(bool) go;
-(void) addChunk:(ChunkIndex) chunk;
@end

#endif /* KeyLoop_h */


