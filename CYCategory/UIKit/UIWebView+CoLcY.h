//
//  UIWebView+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^ShouldStartLoadBlock)(UIWebView *, NSURLRequest *, UIWebViewNavigationType);
typedef void(^DidStartLoadBlock)(UIWebView *);
typedef void(^DidFinishLoadBlock)(UIWebView *);
typedef void(^DidFinishWithErrorBlock)(UIWebView *,NSError *);

@interface UIWebView (CoLcY)

- (void)handleWithShouldStart:(ShouldStartLoadBlock)shouldStart
                     didStart:(DidStartLoadBlock)didStart
                    didFinish:(DidFinishLoadBlock)didFinish
                  finishError:(DidFinishWithErrorBlock)finishError;

@end
