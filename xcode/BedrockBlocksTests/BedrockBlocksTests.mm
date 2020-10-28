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

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual(4, 4);
    char name[10] = "Karen";
    char *color[2] = { name, name };
    int result = listkeys(2, color);
    XCTAssertEqual(result, 1);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
