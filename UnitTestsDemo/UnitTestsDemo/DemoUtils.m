//
//  DemoUtils.m
//  UnitTestsDemo
//
//  Created by Sergey Nezdoliy on 6/25/13.
//  Copyright (c) 2013 personal. All rights reserved.
//

#import "DemoUtils.h"

@implementation DemoUtils

+ (BOOL) validateEmail:(NSString *)inputEmail{
    BOOL isEmailValid = NO;

    if (inputEmail) {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        isEmailValid = [emailTest evaluateWithObject:inputEmail];
    }
    
    return isEmailValid;
}

@end
