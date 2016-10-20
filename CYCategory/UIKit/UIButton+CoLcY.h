//
//  UIButton+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CoLcY)
- (void)setIndexPath:(NSIndexPath *)indexPath;
-(NSIndexPath *)indexPath;

+ (UIButton *)customButton;
+ (UIButton *)customButtonWithFrame:(CGRect)frame;

- (void)setNormalImage:(UIImage *)image;
- (void)setHighlightedImage:(UIImage *)image;
- (void)setSelectedImage:(UIImage *)image;
- (void)setDisabledImage:(UIImage *)image;
- (void)setAllImage:(UIImage *)image;// except disabled

- (void)setNormalBackgroundImage:(UIImage *)image;
- (void)setHighlightedBackgroundImage:(UIImage *)image;
- (void)setSelectedBackgroundImage:(UIImage *)image;
- (void)setDisabledBackgroundImage:(UIImage *)image;
- (void)setAllBackgroundImage:(UIImage *)image;

- (void)setNormalImageName:(NSString *)imageName;
- (void)setHighlightedImageName:(NSString *)imageName;
- (void)setSelectedImageName:(NSString *)imageName;
- (void)setDisabledImageName:(NSString *)imageName;
- (void)setAllImageName:(NSString *)imageName;

- (void)setNormalBackgroundImageName:(NSString *)imageName;
- (void)setHighlightedBackgroundImageName:(NSString *)imageName;
- (void)setSelectedBackgroundImageName:(NSString *)imageName;
- (void)setDisabledBackgroundImageName:(NSString *)imageName;
- (void)setAllBackgroundImageName:(NSString *)imageName;

- (void)setNormalTitle:(NSString *)title;
- (void)setHighlightedTitle:(NSString *)title;
- (void)setSelectedTitle:(NSString *)title;
- (void)setDisabledTitle:(NSString *)title;
- (void)setAllTitle:(NSString *)title;

- (void)setTitleFont:(UIFont *)font;
- (void)setTitleFontSize:(CGFloat)fontSize;
- (void)setTitleBoldFontSize:(CGFloat)fontSize;

- (void)setNormalTitleColor:(UIColor *)color;
- (void)setHighlightedTitleColor:(UIColor *)color;
- (void)setSelectedTitleColor:(UIColor *)color;
- (void)setDisabledTitleColor:(UIColor *)color;
- (void)setAllTitleColor:(UIColor *)color;
@end
