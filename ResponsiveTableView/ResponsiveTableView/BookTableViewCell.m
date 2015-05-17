//
//  BookCellTableViewCell.m
//  ResponsiveTableView
//
//  Created by Sergii Nezdolii on 17/05/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import "BookTableViewCell.h"

@implementation BookTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)markedAsReadChanged:(id)sender
{
    if (_bookMarkedAsReadCallback) {
        _bookMarkedAsReadCallback(self, _readSwitch.on);
    }
}

@end
