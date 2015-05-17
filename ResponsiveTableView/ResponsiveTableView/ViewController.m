//
//  ViewController.m
//  ResponsiveTableView
//
//  Created by Sergii Nezdolii on 08/05/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import "ViewController.h"
#import "NRSimplePlist.h"
#import "Book.h"
#import "BookTableViewCell.h"
#import "JDStatusBarNotification.h"

@interface ViewController ()
@property NSMutableArray *books;
@end

@implementation ViewController
{
    BookMarkedAsReadCallback bookMarkedAsReadCallback;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.books = [NSMutableArray array];
    NSArray *authors = [NRSimplePlist valuePlist:@"Books" withKey:@"Authors"];
    NSArray *titles = [NRSimplePlist valuePlist:@"Books" withKey:@"Titles"];
    for (NSInteger i = 0; i < authors.count; i++)
    {
        [self.books addObject:[Book newBookWithAuthor:authors[i] andTitle:titles[i % titles.count] markedAsRead:NO]];
    }
    __weak typeof(self) weakSelf = self;
    bookMarkedAsReadCallback = ^void(BookTableViewCell *cell, BOOL markedAsRead)
    {
        NSIndexPath *bookIndexpath = [weakSelf.tableView indexPathForCell:cell];
        if (bookIndexpath) {
            ((Book*)weakSelf.books[bookIndexpath.row]).markedAsRead = markedAsRead;
        }
        NSString *status = [NSString stringWithFormat:@"%@ marked as %@", cell.authorLabel.text, markedAsRead ? @"READ" : @"UNREAD"];
        [JDStatusBarNotification showWithStatus:status
                                   dismissAfter:1
                                      styleName:JDStatusBarStyleMatrix];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.books.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookTablewViewCell"];
    if (!cell)
    {
        cell = [BookTableViewCell new];
    }
    
    Book *book = self.books[indexPath.row];
    cell.authorLabel.text = book.author;
    cell.titleLabel.text = book.title;
    cell.readSwitch.on = book.markedAsRead;
    [cell setBookMarkedAsReadCallback:bookMarkedAsReadCallback];
    
    return cell;
}

@end
