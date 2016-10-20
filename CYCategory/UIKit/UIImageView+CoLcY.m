//
//  UIImageView+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIImageView+CoLcY.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (CoLcY)
+ (UIImageView *)imageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame {
    UIImageView *imageView = [UIImageView imageView];
    imageView.frame = frame;
    return imageView;
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image {
    UIImageView *imageView = [UIImageView imageView];
    imageView.image = image;
    return imageView;
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image {
    UIImageView *imageView = [UIImageView imageViewWithFrame:frame];
    imageView.image = image;
    return imageView;
}

+ (UIImageView *)imageViewWitImageName:(NSString *)imageName {
    return [UIImageView imageViewWithImage:[UIImage imageNamed:imageName]];
}

+ (UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    UIImageView *imageView = [UIImageView imageViewWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}
- (void)setImageWithName:(NSString *)imageName {
    self.image = [UIImage imageNamed:imageName];
}

- (void)setScaleToFit {
    self.contentMode = UIViewContentModeScaleToFill;
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
