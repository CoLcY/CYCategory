//
//  UIView+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CoLcY)
//default
+ (UIView *)view;
+ (UIView *)viewWithFrame:(CGRect)frame;
+ (UIView *)clearView;
+ (UIView *)clearViewWithFrame:(CGRect)frame;
+ (UIView *)viewWithColor:(UIColor *)color frame:(CGRect)frame;
+ (UIView *)viewWithColor:(UIColor *)color;
- (void)setClearColor;//background color
- (void)setColor:(UIColor *)color;

//1 pixel line
+ (UIView *)onePixelWidthViewWithHeight:(CGFloat)height;
+ (UIView *)onePixelHeightViewWithWidth:(CGFloat)width;

//gesture recongizer
- (UITapGestureRecognizer *)addTapGestureWithTarget:(id)target action:(SEL)action;
- (UIPanGestureRecognizer *)addPanGestureWithTarget:(id)target action:(SEL)action;
- (UISwipeGestureRecognizer *)addSwipeGestureWithTarget:(id)target action:(SEL)action;

//frame
- (CGPoint)origin;
- (void)setOrigin:(CGPoint) point;
- (CGSize)size;
- (void)setSize:(CGSize) size;
- (CGFloat)x;
- (void)setX:(CGFloat)x;
- (CGFloat)y;
- (void)setY:(CGFloat)y;
- (CGFloat)height;
- (void)setHeight:(CGFloat)height;
- (CGFloat)width;
- (void)setWidth:(CGFloat)width;
- (CGFloat)tail;
- (void)setTail:(CGFloat)tail;
- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;
- (CGFloat)right;
- (void)setRight:(CGFloat)right;

//autoresizing mask
- (void)frameSetInSuperViewForFull;
- (void)frameSetInSuperViewForLeftTop;
- (void)frameSetInSuperViewForBottom;
- (void)frameSetInSuperViewForCenter;
- (void)frameSetInSuperViewForLeftBottmHeightRight;
- (void)frameSetInSuperViewForRightBottmHeightTop;

//base  animation
- (void)fadeShowAnimation;
- (void)fadeShowAnimationComplete:(void(^)(void))complete;
- (void)fadeShowAnimationDuration:(NSTimeInterval)duration complete:(void(^)(void))complete;
- (void)fadeHideAnimation;
- (void)fadeHideAnimationComplete:(void(^)(void))complete;
- (void)fadeHideAnimationDuration:(NSTimeInterval)duration complete:(void(^)(void))complete;

- (void)circle;
- (void)circleWithWhiteBorder;
@end
