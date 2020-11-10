//
//  BedrockBlocksTests.m
//  BedrockBlocksTests
//
//  Created by Christopher Hobbs on 10/27/20.
//

#import <XCTest/XCTest.h>
#import <BedrockBlocks/BedrockBlocks.h>
//#import <BedrockBlocks/listit.hpp>

@interface BedrockBlocksTests : XCTestCase

@end

@implementation BedrockBlocksTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    XCTAssertEqual(4, 4);
//    char name[10] = "Karen";
//    char *args[2] = { name, name };
//    int result = listkeys(2, args);
//    XCTAssertEqual(result, 1);
//
//    NSString *pathString = [[[Filer alloc] init] setUp];
//
//    char execer[10] = "mcbe";
//    char command[10] = "listkeys";
//    char *path = strdup([pathString UTF8String]);
//    char *args3[3] = { execer, command, path };
//    result = listkeys(3, args3);
//    XCTAssertEqual(result, 0);
//}

//- (void)testIterator {
//    NSString *pathString = [[[Filer alloc] init] setUp];
//    KeyIterator *iterator = [[KeyIterator alloc] initWithPath:pathString];
//    while([iterator isValid]) {
//        Chunk chunk = [iterator chunk];
//        NSLog(@"%d,%d,%d,%d,%d",chunk.x, chunk.z, chunk.dimentsion, chunk.tag, chunk.subtag);
//        [iterator next];
//    }
//    XCTAssertTrue([iterator isOk]);
//}

-(void) testLoop {
    NSString *pathString = [[[Filer alloc] init] setUp];
    [[[KeyLoop alloc] initWithPath:pathString] go];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
