//
//  UIControl+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(id obj);

@interface UIControl (CoLcY)
-(void)addActionBlock:(ActionBlock)block forControlEvents:(UIControlEvents)event;
-(void)removeActionBlockForControlEvents:(UIControlEvents)event;

-(void)setIndexPath:(NSIndexPath *)indexPath;
-(NSIndexPath *)indexPath;
@end
