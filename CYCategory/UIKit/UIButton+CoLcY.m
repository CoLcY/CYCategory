//
//  UIButton+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIButton+CoLcY.h"
#import <objc/runtime.h>
@implementation UIButton (CoLcY)

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, (__bridge const void *)(@"indexPath"), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)indexPath
{
    NSIndexPath  *indexPath = objc_getAssociatedObject(self, (__bridge const void *)(@"indexPath"));
    return indexPath;
}
#pragma mark -
#pragma mark Factory Method
+ (UIButton *)customButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    return button;
}

+ (UIButton *)customButtonWithFrame:(CGRect)frame
{
    UIButton *button = [UIButton customButton];
    button.frame = frame;
    return button;
}

#pragma mark -
#pragma mark ButtonImage
- (void)setNormalImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateSelected];
}

- (void)setDisabledImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateDisabled];
}

- (void)setAllImage:(UIImage *)image
{
    [self setNormalImage:image];
    [self setHighlightedImage:image];
    [self setSelectedImage:image];
}

#pragma mark -
#pragma mark ButtonBackgroundImage

- (void)setNormalBackgroundImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setHighlightedBackgroundImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (void)setSelectedBackgroundImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

- (void)setDisabledBackgroundImage:(UIImage *)image
{
    [self setBackgroundImage:image forState:UIControlStateDisabled];
}

- (void)setAllBackgroundImage:(UIImage *)image
{
    [self setNormalBackgroundImage:image];
    [self setHighlightedBackgroundImage:image];
    [self setSelectedBackgroundImage:image];
}

#pragma mark -
#pragma mark ButtonImageName
- (void)setNormalImageName:(NSString *)imageName
{
    [self setNormalImage:[UIImage imageNamed:imageName]];
}

- (void)setHighlightedImageName:(NSString *)imageName
{
    [self setHighlightedImage:[UIImage imageNamed:imageName]];
}

- (void)setSelectedImageName:(NSString *)imageName
{
    [self setSelectedImage:[UIImage imageNamed:imageName]];
}

- (void)setDisabledImageName:(NSString *)imageName
{
    [self setDisabledImage:[UIImage imageNamed:imageName]];
}

- (void)setAllImageName:(NSString *)imageName
{
    [self setAllImage:[UIImage imageNamed:imageName]];
}

#pragma mark -
#pragma mark ButtonBackgroundImageName
- (void)setNormalBackgroundImageName:(NSString *)imageName
{
    [self setNormalBackgroundImage:[UIImage imageNamed:imageName]];
}

- (void)setHighlightedBackgroundImageName:(NSString *)imageName
{
    [self setHighlightedBackgroundImage:[UIImage imageNamed:imageName]];
}

- (void)setSelectedBackgroundImageName:(NSString *)imageName
{
    [self setSelectedBackgroundImage:[UIImage imageNamed:imageName]];
}

- (void)setDisabledBackgroundImageName:(NSString *)imageName
{
    [self setDisabledBackgroundImage:[UIImage imageNamed:imageName]];
}

- (void)setAllBackgroundImageName:(NSString *)imageName
{
    [self setAllBackgroundImage:[UIImage imageNamed:imageName]];
}

#pragma mark -
#pragma mark ButtonTitle
- (void)setNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setHighlightedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (void)setSelectedTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateSelected];
}

- (void)setDisabledTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateDisabled];
}

- (void)setAllTitle:(NSString *)title
{
    [self setNormalTitle:title];
    [self setHighlightedTitle:title];
    [self setSelectedTitle:title];
}

#pragma mark -
#pragma mark ButtonFont
- (void)setTitleFont:(UIFont *)font
{
    [self.titleLabel setFont:font];
}

- (void)setTitleFontSize:(CGFloat)fontSize
{
    [self.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
}

- (void)setTitleBoldFontSize:(CGFloat)fontSize
{
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
}

#pragma mark -
#pragma mark ButtonFontColor
- (void)setNormalTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (void)setHighlightedTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}

- (void)setSelectedTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (void)setDisabledTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateDisabled];
}

- (void)setAllTitleColor:(UIColor *)color
{
    [self setNormalTitleColor:color];
    [self setHighlightedTitleColor:color];
    [self setSelectedTitleColor:color];
}

@end
