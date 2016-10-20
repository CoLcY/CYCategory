//
//  UIWebView+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIWebView+CoLcY.h"
#import "NSObject+CoLcY.h"

@interface UIWebViewDelegateHandle : NSObject<UIWebViewDelegate>

@property (nonatomic, copy) ShouldStartLoadBlock shouldStartLoadBlock;
@property (nonatomic, copy) DidStartLoadBlock didStartLoadBlock;
@property (nonatomic, copy) DidFinishLoadBlock didFinishLoadBlock;
@property (nonatomic, copy) DidFinishWithErrorBlock didFinishWithErrorBlock;

- (id)initWithShouStart:(ShouldStartLoadBlock)shouldStart didStart:(DidStartLoadBlock)didStart didFinish:(DidFinishLoadBlock)didFinish finishError:(DidFinishWithErrorBlock)finishError;
@end

@implementation UIWebViewDelegateHandle

- (id)initWithShouStart:(ShouldStartLoadBlock)shouldStart didStart:(DidStartLoadBlock)didStart didFinish:(DidFinishLoadBlock)didFinish finishError:(DidFinishWithErrorBlock)finishError {
    if (self = [super init]) {
        self.shouldStartLoadBlock = shouldStart;
        self.didStartLoadBlock = didStart;
        self.didFinishLoadBlock = didFinish;
        self.didFinishWithErrorBlock = finishError;
    }
    return self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    __weak UIWebView *wWeb = webView;
    ShouldStartLoadBlock block = self.shouldStartLoadBlock;
    if (block) return  block(wWeb,request,navigationType);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    __weak UIWebView *wWeb = webView;
    DidStartLoadBlock block = self.didStartLoadBlock;
    if (block) block(wWeb);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    __weak UIWebView *wWeb = webView;
    DidFinishLoadBlock block = self.didFinishLoadBlock;
    if (block) block(wWeb);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    __weak UIWebView *wWeb = webView;
    DidFinishWithErrorBlock block = self.didFinishWithErrorBlock;
    if (block) block(wWeb,error);
}

@end


@implementation UIWebView (CoLcY)
- (void)handleWithShouldStart:(ShouldStartLoadBlock)shouldStart
                     didStart:(DidStartLoadBlock)didStart
                    didFinish:(DidFinishLoadBlock)didFinish
                  finishError:(DidFinishWithErrorBlock)finishError
{
    UIWebViewDelegateHandle *handle = [[UIWebViewDelegateHandle alloc] initWithShouStart:shouldStart didStart:didStart didFinish:didFinish finishError:finishError];
    self.delegate = handle;
    [self setRetainNonatomicAssociatedObject:handle forKey:@"UIWebViewDelegateHandle"];
}
@end
