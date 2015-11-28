//
//  ViewController.m
//  EnergyKeyValueTest
//
//  Created by Sergii Nezdolii on 27/11/15.
//  Copyright (c) 2015 FrostDigital. All rights reserved.
//

#import "ViewController.h"
#import "EnergyKeyValueView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet EnergyKeyValueView *testView;
@property (weak, nonatomic) IBOutlet UILabel *avgLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateValues:self];
}

- (IBAction)updateValues:(id)sender {
    CGFloat avg = arc4random_uniform(100);
    CGFloat value = arc4random_uniform(100);
    self.avgLabel.text = [NSString stringWithFormat:@"%.01f", avg];
    self.valueLabel.text = [NSString stringWithFormat:@"%.01f", value];
    [self.testView updateWithAvg:@(avg) value:@(value) animated:YES];
}

@end
