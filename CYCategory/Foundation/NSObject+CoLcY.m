//
//  NSObject+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "NSObject+CoLcY.h"
#import <objc/runtime.h>


//enum {
//    OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
//    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
//                                            *   The association is not made atomically. */
//    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
//                                            *   The association is not made atomically. */
//    OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
//                                            *   The association is made atomically. */
//    OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
//                                            *   The association is made atomically. */
//};

@implementation NSObject (CoLcY)
#pragma mark -
#pragma mark AssociatedObject
-(void)setAssociatedObject:(id)object forKey:(const void *)key withAssociationPolicy:(objc_AssociationPolicy)policy
{
    objc_setAssociatedObject(self, key, object, policy);
}

-(void)setAssignAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_ASSIGN);
}

-(void)setRetainNonatomicAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setCopyNonatomicAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)setRetainAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

-(void)setCopyAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}

-(id)associatedObjectForKey:(const void *)key
{
    return objc_getAssociatedObject(self, key);
}

-(void)removeAllAssociatedObjects
{
    objc_removeAssociatedObjects(self);
}

#pragma mark -
#pragma mark AssociatedObject----Class
+(void)setAssociatedObject:(id)object forKey:(const void *)key withAssociationPolicy:(objc_AssociationPolicy)policy
{
    objc_setAssociatedObject(self, key, object, policy);
}

+(void)setAssignAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_ASSIGN);
}

+(void)setRetainNonatomicAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void)setCopyNonatomicAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+(void)setRetainAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

+(void)setCopyAssociatedObject:(id)object forKey:(const void *)key
{
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_COPY);
}

+(id)associatedObjectForKey:(const void *)key
{
    return objc_getAssociatedObject(self, key);
}

+(void)removeAllAssociatedObjects
{
    objc_removeAssociatedObjects(self);
}
@end
