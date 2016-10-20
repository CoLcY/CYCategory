//
//  UIView+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIView+CoLcY.h"
#import "CYMacro.h"

@implementation UIView (CoLcY)
+ (UIView *)view {
    return [[UIView alloc] init];
}

+ (UIView *)viewWithFrame:(CGRect)frame {
    return [[UIView alloc] initWithFrame:frame];
}

+ (UIView *)clearView {
    UIView *view = [UIView view];
    [view setClearColor];
    return view;
}

+ (UIView *)clearViewWithFrame:(CGRect)frame {
    UIView *view = [UIView viewWithFrame:frame];
    [view setClearColor];
    return view;
}

+ (UIView *)viewWithColor:(UIColor *)color {
    UIView *view = [UIView view];
    [view setColor:color];
    return view;
}

+ (UIView *)viewWithColor:(UIColor *)color frame:(CGRect)frame {
    UIView *view = [UIView viewWithColor:color];
    view.frame = frame;
    return view;
}

- (void)setClearColor {
    self.backgroundColor = [UIColor clearColor];
}

- (void)setColor:(UIColor *)color {
    self.backgroundColor = color;
}


+ (UIView *)onePixelHeightViewWithWidth:(CGFloat)width {
    CGFloat onePixel = (CoLcY_isRetina)?0.5:1;
    UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, width, onePixel)];
    return view;
}

+ (UIView *)onePixelWidthViewWithHeight:(CGFloat)height {
    CGFloat onePixel = (CoLcY_isRetina)?0.5:1;
    UIView *view = [UIView viewWithFrame:CGRectMake(0, 0, onePixel, height)];
    return view;
}

- (UITapGestureRecognizer *)addTapGestureWithTarget:(id)target action:(SEL)action {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    return tap;
}

- (UIPanGestureRecognizer *)addPanGestureWithTarget:(id)target action:(SEL)action {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:pan];
    return pan;
}

- (UISwipeGestureRecognizer *)addSwipeGestureWithTarget:(id)target action:(SEL)action {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:swipe];
    return swipe;
}


#pragma mark -
#pragma mark frame

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint) point {
    self.frame = CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height);
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize) size {
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)tail {
    return self.y + self.height;
}

- (void)setTail:(CGFloat)tail {
    self.frame = CGRectMake(self.x, tail - self.height, self.width, self.height);
}

- (CGFloat)bottom {
    return self.tail;
}

- (void)setBottom:(CGFloat)bottom {
    [self setTail:bottom];
}

- (CGFloat)right {
    return self.x + self.width;
}

- (void)setRight:(CGFloat)right {
    self.frame = CGRectMake(right - self.width, self.y, self.width, self.height);
}

#pragma mark -
#pragma mark autoresizingMask

- (void)frameSetInSuperViewForFull {
    self.autoresizingMask  =  UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleWidth;
}

- (void)frameSetInSuperViewForLeftTop {
    self.autoresizingMask  =  UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleLeftMargin;
}

- (void)frameSetInSuperViewForBottom {
    self.autoresizingMask  = UIViewAutoresizingFlexibleBottomMargin;
}

- (void)frameSetInSuperViewForCenter {
    self.autoresizingMask  = UIViewAutoresizingNone;
}

- (void)frameSetInSuperViewForLeftBottmHeightRight {
    self.autoresizingMask  = UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleRightMargin;
}

- (void)frameSetInSuperViewForRightBottmHeightTop {
    self.autoresizingMask  = UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleRightMargin;
}

#pragma mark -
#pragma mark base animation
- (void)fadeShowAnimation {
    [self fadeShowAnimationComplete:nil];
}

- (void)fadeShowAnimationComplete:(void(^)(void))complete {
    [self fadeShowAnimationDuration:0.3f complete:complete];
}

- (void)fadeShowAnimationDuration:(NSTimeInterval)duration complete:(void (^)(void))complete {
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished){
        if (complete) complete();
    }];
}

- (void)fadeHideAnimation {
    [self fadeHideAnimationComplete:nil];
}

- (void)fadeHideAnimationComplete:(void(^)(void))complete {
    [self fadeHideAnimationDuration:0.3f complete:complete];
}

- (void)fadeHideAnimationDuration:(NSTimeInterval)duration complete:(void (^)(void))complete {
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished){
        self.hidden = YES;
        self.alpha = 1;
        if (complete) complete();
    }];
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
