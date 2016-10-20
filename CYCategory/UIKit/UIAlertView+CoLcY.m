//
//  UIAlertView+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIAlertView+CoLcY.h"
#import "NSObject+CoLcY.h"

@interface UIAlertViewDelegateHandle : NSObject<UIAlertViewDelegate>

@property (nonatomic, copy) AlertButtonCliked alertButtonCliked;

- (id)initWithCliked:(AlertButtonCliked)cliked;
@end

@implementation UIAlertViewDelegateHandle

- (id)initWithCliked:(AlertButtonCliked)cliked {
    if (self = [super init]) {
        self.alertButtonCliked = cliked;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(self.alertButtonCliked) self.alertButtonCliked(alertView,buttonIndex);
}

@end


@implementation UIAlertView (CoLcY)
+ (UIAlertView *)alertWithMessage:(NSString *)message cancelTitle:(NSString *)cancelTitle clikedAction:(AlertButtonCliked)clikedAction {
    return  [UIAlertView alertWithTitle:nil message:message cancelTitle:cancelTitle otherTitle:nil clikedAction:clikedAction];
}

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle clikedAction:(AlertButtonCliked)clikedAction {
    return  [UIAlertView alertWithTitle:title message:message cancelTitle:cancelTitle otherTitle:nil clikedAction:clikedAction];
}

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle otherTitle:(NSString *)otherTitle clikedAction:(AlertButtonCliked)clikedAction {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    [alert handleWithClikedAction:clikedAction];
    return alert;
}

- (void)handleWithClikedAction:(AlertButtonCliked)clikedAction
{
    UIAlertViewDelegateHandle *handle = [[UIAlertViewDelegateHandle alloc] initWithCliked:clikedAction];
    self.delegate = handle;
    [self setRetainNonatomicAssociatedObject:handle forKey:@"UIAlertViewDelegateHandle"];
}

@end
