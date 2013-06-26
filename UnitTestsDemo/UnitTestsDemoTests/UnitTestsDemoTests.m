//
//  UnitTestsDemoTests.m
//  UnitTestsDemoTests
//
//  Created by Sergey Nezdoliy on 6/25/13.
//  Copyright (c) 2013 personal. All rights reserved.
//

#import "UnitTestsDemoTests.h"
#import "DemoUtils.h"

@implementation UnitTestsDemoTests

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

- (void)testValidateEmailWithValidEmail{
    //GIVEN
    NSString *validEmail = @"test-user01@domain.com";
    //WHEN
    BOOL result = [DemoUtils validateEmail:validEmail];
    //THEN
    STAssertTrue(result, @"Valid with email: %@", validEmail);
}

- (void)testValidateEmailWithEmptyEmail{
    //GIVEN
    NSString *emptyEmail = @"";
    //WHEN
    BOOL result = [DemoUtils validateEmail:emptyEmail];
    //THEN
    STAssertFalse(result, @"Valid with empty email: %@", emptyEmail);
}

- (void)testValidateEmailWithNilEmail{
    //GIVEN
    NSString *emptyEmail = nil;
    //WHEN
    BOOL result = [DemoUtils validateEmail:emptyEmail];
    //THEN
    STAssertFalse(result, @"Valid with nil email: %@", emptyEmail);
}

- (void)testValidateEmailWithInvalidEmail{
    //GIVEN
    NSString *emptyEmail = @"test@";
    //WHEN
    BOOL result = [DemoUtils validateEmail:emptyEmail];
    //THEN
    STAssertFalse(result, @"Valid with invalid email: %@", emptyEmail);
}

@end
