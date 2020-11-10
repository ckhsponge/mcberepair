//
//  Header.h
//  mcberepair
//
//  Created by Christopher Hobbs on 11/5/20.
//

#ifndef Header_h
#define Header_h

#import "ChunkIndex.h"

@interface KeyIterator : NSObject
-(id)initWithPath:(NSString *) path;
-(bool) isValid;
-(void) next;
-(struct ChunkIndex) chunk;
-(bool) isOk;
@end

#endif /* Header_h */
