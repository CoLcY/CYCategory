//
//  UIColor+CoLcY.h
//  CoLcY Library
//
//  Created by CoLcY on 14-5-19.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ColorWithRGB(_red,_green,_blue,_alpha) [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:_alpha]
#define ColorWithWhite(_white,_alpha)   [UIColor colorWithWhite:_white alpha:_alpha]
#define ColorWithWebColor(_int)         [UIColor colorWithHex:_int]


@interface UIColor (CoLcY)
+(UIColor *)colorWithHex:(int)hex;
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;
+(UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(float)alpha;
@end
