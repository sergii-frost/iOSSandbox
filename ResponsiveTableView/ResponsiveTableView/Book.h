//
//  Book.h
//  ResponsiveTableView
//
//  Created by Sergii Nezdolii on 17/05/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property NSString *author;
@property NSString *title;
@property BOOL markedAsRead;

+(instancetype)newBookWithAuthor:(NSString *)author andTitle:(NSString *)title markedAsRead:(BOOL)markedAsRead;

@end
