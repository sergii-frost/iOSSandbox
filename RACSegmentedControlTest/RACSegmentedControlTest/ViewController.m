//
//  ViewController.m
//  RACSegmentedControlTest
//
//  Created by Sergii Nezdolii on 29/09/15.
//  Copyright © 2015 FrostDigital. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"


typedef NS_ENUM(NSInteger, SegmentedControlValue) {
    SegmentedControlValueFirst = 0,
    SegmentedControlValueSecond
};

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) RACCommand *firstCommand;
@property (strong, nonatomic) RACCommand *secondCommand;
@property (assign, nonatomic) SegmentedControlValue value;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBindings];
}

- (void)initBindings {
    RACSignal *firstSegmentDeselected = [RACObserve(self, value) filter:^BOOL(NSNumber *selected) {
        return [selected integerValue] != SegmentedControlValueFirst;
    }];
    self.firstCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]]
            takeUntil:firstSegmentDeselected]
            doNext:^(id x) {
                NSLog(@"First Signal: %@",[NSDate date].description);
            }
        ];
    }];
    
    RACSignal *secondSegmentDeselected = [RACObserve(self, value) filter:^BOOL(NSNumber *selected) {
        return [selected integerValue] != SegmentedControlValueSecond;
    }];
    self.secondCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]]
                 takeUntil:secondSegmentDeselected]
                doNext:^(id x) {
                    NSLog(@"Second Signal: %@",[NSDate date].description);
                }
                ];
    }];
    @weakify(self);
    [[self.segmentedControl rac_newSelectedSegmentIndexChannelWithNilValue:@(SegmentedControlValueFirst)] subscribeNext:^(NSNumber *selected) {
        @strongify(self);
        NSInteger selectedInt = [selected integerValue];
        self.value = selectedInt;
        switch (selectedInt) {
            case SegmentedControlValueFirst:
                self.startButton.rac_command = self.firstCommand;
                [self.startButton.rac_command execute:nil];
                break;
            case SegmentedControlValueSecond:
                self.startButton.rac_command = self.secondCommand;
                [self.startButton.rac_command execute:nil];
                break;
            default:
                break;
        }
    }];
    self.startButton.rac_command = self.firstCommand;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
