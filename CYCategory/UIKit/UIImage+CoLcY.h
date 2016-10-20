//
//  UIImage+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImageBlock)(UIImage *image, NSData *imageData);

@interface UIImage (CoLcY)
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWith;//1 birder with = 1 pixel

+ (UIImage *)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

+ (UIImage *)imageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWith cornerRadius:(CGFloat)cornerRadius;

+ (UIImage *)circularImageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner;

+ (UIImage *)imageWithColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWith cornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner;

+ (void)xk_imageIDScaleWithImage:(UIImage *)image block:(ImageBlock)block;
+ (void)xk_imageScaleWithImage:(UIImage *)image block:(ImageBlock)block;
+ (void)xk_imageScaleWithOriginalImage:(UIImage *)image block:(ImageBlock)block;
+ (UIImage *)imageScaleWithImage:(UIImage *)image size:(CGSize)size quality:(CGFloat)quality;
+ (UIImage *)imageScaleWithImage:(UIImage *)image width:(float)width quality:(CGFloat)quality;
+ (UIImage *)imageScaleWithImage:(UIImage *)image size:(CGSize)size;
+ (UIImage *)imageScaleWithImage:(UIImage *)image quality:(CGFloat)quality;
@end
