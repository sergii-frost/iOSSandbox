//
//  ViewController.h
//  ImageGenerator
//
//  Created by Sergiy Nezdoliy on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIButton *generateButton;
@property (nonatomic, weak) IBOutlet UIImageView *resultImageView;

-(UIImage *)generateImage;
-(IBAction)generateButtonPressed: (id)sender;

@end
