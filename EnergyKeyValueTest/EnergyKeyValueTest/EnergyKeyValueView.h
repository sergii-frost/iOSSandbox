//
//  EnergyKeyValueView.h
//  
//
//  Created by Sergii Nezdolii on 27/11/15.
//
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EnergyKeyValueView : UIView

@property (strong, nonatomic) IBInspectable UIColor *markerColor;
@property (strong, nonatomic) IBInspectable UIColor *emptyColor;
@property (strong, nonatomic) IBInspectable UIColor *shadowColor;
@property (strong, nonatomic) IBInspectable UIColor *fillColor;
@property (assign, nonatomic) IBInspectable CGFloat meterWidth;

- (void)updateWithAvg:(NSNumber *)avg value:(NSNumber *)value animated:(BOOL)animated;

@end
