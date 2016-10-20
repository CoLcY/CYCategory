//
//  UILabel+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CoLcY)

+ (UILabel *)label;
+ (UILabel *)labelWithFrame:(CGRect)frame;
+ (UILabel *)clearLabel;
+ (UILabel *)clearLabelWithFrame:(CGRect)frame;
+ (UILabel *)clearLabelWithFrame:(CGRect)frame fontSize:(CGFloat)fontSize;
+ (UILabel *)labelWithColor:(UIColor *)color;
- (void)setFontSize:(CGFloat)fontSize;//system font
- (void)setBoldFontSize:(CGFloat)fontSize;//system font
- (void)setSizeToFitText;//lineNumber = 0， lineBreakMode = NSLineBreakByCharWrapping;
- (void)sizeToFitWidthWithText:(NSString *)text;//height be sure and to fit width
- (void)sizeToFitHeightWithText:(NSString *)text;//width be sure and to fit height
- (CGSize)sizeWithText:(NSString *)text maxWidth:(float)max;
- (void)circle;
- (void)circleWithWhiteBorder;
@end
