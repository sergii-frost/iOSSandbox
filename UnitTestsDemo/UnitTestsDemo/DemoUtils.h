//
//  DemoUtils.h
//  UnitTestsDemo
//
//  Created by Sergey Nezdoliy on 6/25/13.
//  Copyright (c) 2013 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoUtils : NSObject

/**
 * Allows to validate e-mail
 * @param inputEmail - email to validate
 */
+ (BOOL) validateEmail:(NSString *)inputEmail;

@end
