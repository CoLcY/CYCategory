//
//  UIImageView+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CoLcY)
+ (UIImageView *)imageView;
+ (UIImageView *)imageViewWithFrame:(CGRect)frame;
+ (UIImageView *)imageViewWithImage:(UIImage *)image;
+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image;
+ (UIImageView *)imageViewWitImageName:(NSString *)imageName;
+ (UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;
- (void)setImageWithName:(NSString *)imageName;
- (void)setScaleToFit;
- (void)circle;
- (void)circleWithWhiteBorder;
@end
