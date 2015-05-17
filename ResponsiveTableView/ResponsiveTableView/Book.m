//
//  Book.m
//  ResponsiveTableView
//
//  Created by Sergii Nezdolii on 17/05/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import "Book.h"

@implementation Book
+(instancetype)newBookWithAuthor:(NSString *)author andTitle:(NSString *)title markedAsRead:(BOOL)markedAsRead
{
    Book *instance = [Book new];
    instance.author = author;
    instance.title = title;
    instance.markedAsRead = markedAsRead;
    
    return instance;
}


@end
