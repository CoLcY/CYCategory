//
//  NSObject+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CoLcY)

#pragma mark -
#pragma mark AssociatedObject
-(void)setAssociatedObject:(id)object forKey:(const void *)key withAssociationPolicy:(int)policy;

-(void)setAssignAssociatedObject:(id)object forKey:(const void *)key;

-(void)setRetainNonatomicAssociatedObject:(id)object forKey:(const void *)key;

-(void)setCopyNonatomicAssociatedObject:(id)object forKey:(const void *)key;

-(void)setRetainAssociatedObject:(id)object forKey:(const void *)key;

-(void)setCopyAssociatedObject:(id)object forKey:(const void *)key;

-(id)associatedObjectForKey:(const void *)key;

-(void)removeAllAssociatedObjects;

#pragma mark -
#pragma mark AssociatedObject----Class
+(void)setAssociatedObject:(id)object forKey:(const void *)key withAssociationPolicy:(int)policy;

+(void)setAssignAssociatedObject:(id)object forKey:(const void *)key;

+(void)setRetainNonatomicAssociatedObject:(id)object forKey:(const void *)key;

+(void)setCopyNonatomicAssociatedObject:(id)object forKey:(const void *)key;

+(void)setRetainAssociatedObject:(id)object forKey:(const void *)key;

+(void)setCopyAssociatedObject:(id)object forKey:(const void *)key;

+(id)associatedObjectForKey:(const void *)key;

+(void)removeAllAssociatedObjects;

@end
