//
//  UIControl+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIControl+CoLcY.h"
#import <objc/runtime.h>

@interface ActionBlockHandle : NSObject <NSCopying>
@property (nonatomic, copy) ActionBlock actionBlock;
@property (nonatomic) UIControlEvents controlEvent;

@end

@implementation ActionBlockHandle

- (id)initWithActionBlock:(ActionBlock)actionBlock controlEvents:(UIControlEvents)controlEvent
{
	if ((self = [super init]))
    {
		self.actionBlock = actionBlock;
		self.controlEvent = controlEvent;
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	return [[ActionBlockHandle alloc] initWithActionBlock:self.actionBlock controlEvents:self.controlEvent];
}

- (void)CoLcYCategoryActionBlock:(id)sender
{
    if (_actionBlock)
    {
        _actionBlock(sender);
    }
}
@end


@implementation UIControl (CoLcY)

#pragma mark -
#pragma mark Inner
-(void)setActionBlockHandleDictionary:(NSMutableDictionary *)actionBlockDictionary
{
    objc_setAssociatedObject(self, (__bridge const void *)(@"actionBlockHandleDictionary"), actionBlockDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableDictionary *)actionBlockHandleDictionary
{
    return objc_getAssociatedObject(self, (__bridge const void *)(@"actionBlockHandleDictionary"));
}

#pragma mark -
#pragma mark out
-(void)addActionBlock:(ActionBlock)block forControlEvents:(UIControlEvents)event
{
    if (!block)
    {
        return;
    }
    [self removeActionBlockForControlEvents:event];
    ActionBlockHandle *handle = [[ActionBlockHandle alloc] initWithActionBlock:block controlEvents:event];
    [self addTarget:handle action:@selector(CoLcYCategoryActionBlock:) forControlEvents:event];
    [[self actionBlockHandleDictionary] setObject:handle forKey:@(event)];
}

-(void)removeActionBlockForControlEvents:(UIControlEvents)event
{
    NSMutableDictionary *actionBlockHandleDictionary = [self actionBlockHandleDictionary];
    if (!actionBlockHandleDictionary)
    {
        actionBlockHandleDictionary = [NSMutableDictionary dictionary];
        [self setActionBlockHandleDictionary:actionBlockHandleDictionary];
    }
    else
    {
        ActionBlockHandle *actionBlockHandle = [actionBlockHandleDictionary objectForKey:@(event)];
        if (actionBlockHandle)
        {
            [self removeTarget:actionBlockHandle action:@selector(CoLcYCategoryActionBlock:) forControlEvents:event];
            [actionBlockHandleDictionary removeObjectForKey:@(event)];
        }
    }
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, (__bridge const void *)(@"indexPath"), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)indexPath
{
    NSIndexPath  *indexPath = objc_getAssociatedObject(self, (__bridge const void *)(@"indexPath"));
    return indexPath;
}

@end
