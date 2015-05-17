//
//  BookCellTableViewCell.h
//  ResponsiveTableView
//
//  Created by Sergii Nezdolii on 17/05/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookTableViewCell;
typedef void(^BookMarkedAsReadCallback)(BookTableViewCell *cell, BOOL markedAsRead);

@interface BookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *readSwitch;
@property (nonatomic, copy) BookMarkedAsReadCallback bookMarkedAsReadCallback;

@end