//
//  ViewController.m
//  ImageGenerator
//
//  Created by Sergiy Nezdoliy on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)saveImageToFile:(UIImage *)image;
-(UIImage *)imageFromText:(NSString *)text;
@end

@implementation ViewController

@synthesize textField = _textField;
@synthesize generateButton = _generateButton;
@synthesize resultImageView = _resultImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)generateButtonPressed: (id)sender{
    UIImage *generatedImage = [self imageFromText:_textField.text];
    CGRect frame = _resultImageView.frame;
    frame.size = generatedImage.size;
    _resultImageView.frame = frame;
    [_resultImageView setImage:generatedImage];
    [self saveImageToFile:generatedImage];
}

//Another cut method. Does not work for text.
-(UIImage *)generateImage{
    NSString *breakTitle = _textField.text;
    CGSize textSize = [breakTitle sizeWithFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    float width=textSize.width, height=textSize.height;

    CGSize imageSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(imageSize,NO,0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetAlpha(context,1.0);
    CGRect rect;
    rect.size = imageSize;
    rect.origin.x = 0;
    rect.origin.y = 0;
    CGContextFillRect(context, rect);
    CGContextSetLineWidth(context, 1.0);
    //due to some reasons it does not work.
    [breakTitle drawAtPoint:CGPointMake(0.0, 0.0) withFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
    // Create new image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // Tidy up
    UIGraphicsEndImageContext();
    return newImage;
}

-(UIImage *)imageFromText:(NSString *)text {
    // set the font type and size
    UIFont *font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];  
    CGSize size  = [text sizeWithFont:font];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL){
        UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    } else {
        // iOS is < 4.0 
        UIGraphicsBeginImageContext(size);
    }
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger 
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake(0.0, 0.0) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();    
    return image;
}

-(void)saveImageToFile:(UIImage *)image{
    // Create paths to output images
    NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.jpg"];
    
    // Write a UIImage to JPEG with minimum compression (best quality)
    // The value 'image' must be a UIImage object
    // The value '1.0' represents image compression quality as value from 0.0 to 1.0
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:jpgPath atomically:YES];
    
    // Write image to PNG
    [UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];
    
    // Let's check to see if files were successfully written...
    
    // Create file manager
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // Write out the contents of home directory to console
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
}


@end
