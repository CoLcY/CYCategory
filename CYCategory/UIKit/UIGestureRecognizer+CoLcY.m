//
//  UIGestureRecognizer+CoLcY.m
//  Playmate
//
//  Created by CoLcY on 15/10/19.
//  Copyright (c) 2015年 CoLcY. All rights reserved.
//

#import "UIGestureRecognizer+CoLcY.h"
#import <objc/runtime.h>

@implementation UIGestureRecognizer (CoLcY)
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, (__bridge const void *)(@"indexPath"), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)indexPath
{
    NSIndexPath  *indexPath = objc_getAssociatedObject(self, (__bridge const void *)(@"indexPath"));
    return indexPath;
}
@end
