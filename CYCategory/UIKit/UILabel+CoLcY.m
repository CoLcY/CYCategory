//
//  UILabel+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UILabel+CoLcY.h"
#import "UIView+CoLcY.h"

@implementation UILabel (CoLcY)
+ (UILabel *)label {
    return [[UILabel alloc] init];
}

+ (UILabel *)labelWithFrame:(CGRect)frame {
    return [[UILabel alloc] initWithFrame:frame];
}

+ (UILabel *)clearLabel {
    UILabel *label = [UILabel label];
    [label setClearColor];
    return label;
}

+ (UILabel *)clearLabelWithFrame:(CGRect)frame {
    UILabel *label = [UILabel labelWithFrame:frame];
    [label setClearColor];
    return label;
}

+ (UILabel *)clearLabelWithFrame:(CGRect)frame fontSize:(CGFloat)fontSize {
    UILabel *label = [UILabel clearLabelWithFrame:frame];
    [label setFontSize:fontSize];
    return label;
}

+ (UILabel *)labelWithColor:(UIColor *)color {
    UILabel *label = [UILabel label];
    [label setColor:color];
    return label;
}

- (void)setFontSize:(CGFloat)fontSize {
    [self setFont:[UIFont systemFontOfSize:fontSize]];
}

- (void)setBoldFontSize:(CGFloat)fontSize {
    [self setFont:[UIFont boldSystemFontOfSize:fontSize]];
}

- (void)setSizeToFitText {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
}

- (void)sizeToFitWidthWithText:(NSString *)text {
    [self setSizeToFitText];
    CGSize size = [self sizeWithText:text];
    self.width =size.width + 2;
}

- (void)sizeToFitHeightWithText:(NSString *)text {
    [self setSizeToFitText];
    CGSize size = [self sizeWithText:text];
    self.width =size.width + 2;
}

- (CGSize)sizeWithText:(NSString *)text {
    CGSize stringSize;
//    if (CoLcY_iOS_7) {
//        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,nil];
//        stringSize =[text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
//    }else
//    {
//        if ([text respondsToSelector:@selector(sizeWithFont:constrainedToSize:lineBreakMode:)]) {
//            stringSize  = [text sizeWithFont:self.font constrainedToSize:CGSizeMake(MAXFLOAT, self.height) lineBreakMode:self.lineBreakMode];
//        }
//    }
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,nil];
    stringSize =[text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return stringSize;
}

- (CGSize)sizeWithText:(NSString *)text maxWidth:(float)max
{
    CGSize stringSize;
//    if (CoLcY_iOS_7) {
//        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,nil];
//        stringSize =[text boundingRectWithSize:CGSizeMake(max, self.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
//    }else
//    {
//        if ([text respondsToSelector:@selector(sizeWithFont:constrainedToSize:lineBreakMode:)]) {
//            stringSize  = [text sizeWithFont:self.font constrainedToSize:CGSizeMake(max, self.height) lineBreakMode:self.lineBreakMode];
//        }
//    }
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName,nil];
    stringSize =[text boundingRectWithSize:CGSizeMake(max, self.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return stringSize;
}
- (void)circle
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:self.frame.size.width / 2];
}
- (void)circleWithWhiteBorder
{
    [self circle];
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
}
@end
