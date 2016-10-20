//
//  UIScrollView+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIScrollView+CoLcY.h"

@implementation UIScrollView (CoLcY)
+(UIScrollView *)noIndicatorViewWithFrame:(CGRect)frame {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    return scrollView;
}
@end
