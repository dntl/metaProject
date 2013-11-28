//
//  metaProjectTests.m
//  metaProjectTests
//
//  Created by dimakey on 13.07.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "metaProjectTests.h"

@implementation metaProjectTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testIfExist
{
    NSString *infoPlistPath = [NSBundle.mainBundle pathForResource:@"debugInfo" ofType:@"plist"];
    NSDictionary *dbInfo = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
    
    STAssertNotNil(dbInfo,@"Main info dictionary must be not nil!");
}

@end
