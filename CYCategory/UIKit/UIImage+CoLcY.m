//
//  UIImage+CoLcY.m
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import "UIImage+CoLcY.h"

@implementation UIImage (CoLcY)
static CGFloat edgeSizeFromCornerRadius(CGFloat cornerRadius)
{
    return cornerRadius * 2 + 1;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 5, 5);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRect:rect];
    roundedRect.lineWidth = 0;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [roundedRect fill];
    [roundedRect stroke];
    [roundedRect addClip];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

+ (UIImage *)imageWithColor:(UIColor *)color
                borderColor:(UIColor *)borderColor
                 borderWith:(CGFloat)borderWith
{
    CGRect rect = CGRectMake(0,0, 10, 10);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);
    CGContextSetLineWidth(context, borderWith);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRect:rect];
    CGContextSetFillColorWithColor(context, borderColor.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    rect = CGRectMake(borderWith/2,borderWith/2, 10-borderWith, 10-borderWith);
    roundedRect = [UIBezierPath bezierPathWithRect:rect];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(borderWith, borderWith, borderWith, borderWith)];
}

+ (UIImage *)imageWithColor:(UIColor *)color
               cornerRadius:(CGFloat)cornerRadius {
    CGFloat minEdgeSize = edgeSizeFromCornerRadius(cornerRadius);
    CGRect rect = CGRectMake(0, 0, minEdgeSize, minEdgeSize);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    roundedRect.lineWidth = 0;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [roundedRect fill];
    [roundedRect stroke];
    [roundedRect addClip];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}


+ (UIImage *)imageWithColor:(UIColor *)color
                borderColor:(UIColor *)borderColor
                 borderWith:(CGFloat)borderWith
               cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = CGRectMake(0,0, cornerRadius*2, cornerRadius*2);
    CGRect rect2 = CGRectMake(borderWith/2,borderWith/2, cornerRadius*2-borderWith, cornerRadius*2-borderWith);
    
    CGRect rect1 = CGRectMake(0,0, cornerRadius*2, cornerRadius*2);
    
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    UIGraphicsBeginImageContextWithOptions(rect1.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);
    CGContextSetLineWidth(context, borderWith);
    CGContextSetFillColorWithColor(context, borderColor.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:cornerRadius];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}


+ (UIImage *) circularImageWithColor:(UIColor *)color
                                size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:rect];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [color setStroke];
    [circle addClip];
    [circle fill];
    [circle stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (CGPathRef)createRoundedPath:(CGRect)rect
                       corners:(UIRectCorner)corners
                  cornerRadius:(CGFloat)cornerRadius
{
    UIBezierPath *thePath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                  byRoundingCorners:corners
                                                        cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    return thePath.CGPath;
}

+ (UIImage *)imageWithColor:(UIColor *)color
                borderColor:(UIColor *)borderColor
                 borderWith:(CGFloat)borderWith
               cornerRadius:(CGFloat)cornerRadius
                    rectCorner:(UIRectCorner)rectCorner
{
    CGRect rect = CGRectMake(0,0, cornerRadius*2, cornerRadius*2);
    CGRect rect1 = CGRectMake(borderWith/2,borderWith/2, cornerRadius*2-borderWith, cornerRadius*2-borderWith);
    
    
    UIBezierPath *roundedRect = [UIBezierPath
                                 bezierPathWithCGPath:[UIImage createRoundedPath:rect
                                                                         corners:rectCorner
                                                                    cornerRadius:cornerRadius]];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(context, YES);
    CGContextSetLineWidth(context, borderWith);
    
    CGContextSetFillColorWithColor(context, borderColor.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    roundedRect = [UIBezierPath
                   bezierPathWithCGPath:[UIImage createRoundedPath:rect1
                                                           corners:rectCorner
                                                      cornerRadius:cornerRadius]];
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, roundedRect.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}

+ (UIImage *)imageWithColor:(UIColor *)color
               cornerRadius:(CGFloat)cornerRadius
                    rectCorner:(UIRectCorner)rectCorner
{
    CGFloat minEdgeSize = edgeSizeFromCornerRadius(cornerRadius);
    CGRect rect = CGRectMake(0, 0, minEdgeSize, minEdgeSize);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithCGPath:[UIImage createRoundedPath:rect corners:rectCorner cornerRadius:cornerRadius]];
    roundedRect.lineWidth = 0;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    [color setFill];
    [roundedRect fill];
    [roundedRect stroke];
    [roundedRect addClip];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}

+ (void)xk_imageIDScaleWithImage:(UIImage *)image block:(ImageBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *newImageData = [self imageDataScaleWithImage:image size:CGSizeMake(400, 400) quality:0.6];
        UIImage *newImage = [self imageScaleWithImage:image size:CGSizeMake(400, 400) quality:0.6];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(newImage, newImageData);
        });
    });
}

+ (void)xk_imageScaleWithImage:(UIImage *)image block:(ImageBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *newImageData = [self imageDataScaleWithImage:image size:CGSizeMake(200, 200) quality:0.6];
        UIImage *newImage = [self imageScaleWithImage:image size:CGSizeMake(200, 200) quality:0.6];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(newImage, newImageData);
        });
    });
}
+ (void)xk_imageScaleWithOriginalImage:(UIImage *)image block:(ImageBlock)block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *newImageData = [self imageDataScaleWithImage:image width:320 quality:0.6];
        UIImage *newImage = [self imageScaleWithImage:image width:320 quality:0.6];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(newImage,newImageData);
        });
    });
}

+ (NSData *)imageDataScaleWithImage:(UIImage *)image size:(CGSize)size quality:(CGFloat)quality
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0,size.width,size.height)];
    UIImage* sizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *data = UIImageJPEGRepresentation(sizedImage,quality);
    return data;
}
+ (UIImage *)imageScaleWithImage:(UIImage *)image size:(CGSize)size quality:(CGFloat)quality
{
    NSData *data = [self imageDataScaleWithImage:image size:size quality:quality];
    UIImage *scaledImage = [UIImage imageWithData:data];
    return scaledImage;
}

+ (NSData *)imageDataScaleWithImage:(UIImage *)image width:(float)width quality:(CGFloat)quality
{
    CGSize originalSize = image.size;
    CGSize size = CGSizeMake(width, width);
    size.height = (width * originalSize.height) / originalSize.width;
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0,size.width,size.height)];
    UIImage* sizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *data = UIImageJPEGRepresentation(sizedImage,quality);
    return data;
    
    
    //    //保存图片
    //    NSLog(@"%@",NSHomeDirectory());
    //    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //    NSString *documentsDirectory=[paths objectAtIndex:0];
    //    NSString *name = [NSString stringWithFormat:@"%f.jpg",[[NSDate date] timeIntervalSince1970]];
    //    NSString *savedImagePath=[documentsDirectory stringByAppendingPathComponent:name];
    //    [data writeToFile:savedImagePath atomically:YES];
    //    NSLog(@"-----内部-----%d",[data length] / 1024);
    //    return [[UIImage alloc] initWithContentsOfFile:savedImagePath];
}

+ (UIImage *)imageScaleWithImage:(UIImage *)image width:(float)width quality:(CGFloat)quality
{
    NSData *data = [self imageDataScaleWithImage:image width:width quality:quality];
    UIImage *scaledImage = [UIImage imageWithData:data];
    return scaledImage;
}

+ (UIImage *)imageScaleWithImage:(UIImage *)image size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0,size.width,size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)imageScaleWithImage:(UIImage *)image quality:(CGFloat)quality
{
    NSData *data = UIImageJPEGRepresentation(image,quality);
    UIImage *scaledImage = [UIImage imageWithData:data];
    return scaledImage;
}
@end
