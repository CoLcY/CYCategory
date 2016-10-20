//
//  UIAlertView+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertButtonCliked)(UIAlertView *alertView,NSInteger buttonIndex);

@interface UIAlertView (CoLcY)

+ (UIAlertView *)alertWithMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle clikedAction:(AlertButtonCliked)clikedAction;

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle clikedAction:(AlertButtonCliked)clikedAction;

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitle:(NSString *)otherTitle clikedAction:(AlertButtonCliked)clikedAction;

- (void)handleWithClikedAction:(AlertButtonCliked)clikedAction;

@end
