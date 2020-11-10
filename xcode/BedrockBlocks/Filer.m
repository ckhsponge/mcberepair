//
//  Filer.m
//  mcberepair
//
//  Created by Christopher Hobbs on 10/29/20.
//

#import <Foundation/Foundation.h>
#import "Filer.h"

//@interface Filer : NSObject
//- (void)setUp;
//@end

@implementation Filer

- (NSString *)setUp {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *path = [docsDirectory stringByAppendingPathComponent:@"README.txt"];
//    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/README.md"];

//    NSString *path = [[NSBundle mainBundle] pathForResource:@"README" ofType:@"md"];
    NSBundle *amazingBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [amazingBundle pathForResource:@"creative" ofType:@"" inDirectory:@"worlds"];
    
    
    NSData *data = [NSData dataWithContentsOfFile:path];
//    printf("Path %d %ld %s", [fileManager fileExistsAtPath:path], [data length], [path UTF8String]);
    BOOL isDirectory = FALSE;
    printf("Path %d %s\n", [fileManager fileExistsAtPath:path isDirectory:&isDirectory], [path UTF8String]);
    printf("isDirectory %d\n", isDirectory);
    
//    if(![fileManager fileExistsAtPath:path])
//    {
//        NSData *data = [NSData dataWithContentsOfFile:path];
//        [data writeToFile:filePath atomically:YES];
//    }
    return path;
}

@end
