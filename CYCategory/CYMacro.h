
//  CoLcYMacro.h
//  CoLcY Library
//
//  Created by CoLcY on 14-4-16.
//  Copyright (c) 2014年 CoLcY. All rights reserved.
//

//version:0.0.1

#ifndef CoLcY_Library_CoLcYMacro_h
#define CoLcY_Library_CoLcYMacro_h

//Device
#define CoLcY_isPad             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CoLcY_isPhone           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define CoLcY_isPhone480        ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define CoLcY_isPhone568        ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define CoLcY_isPhone6Plus       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define CoLcY_isRetina          (([[UIScreen mainScreen] scale] > 1) ? YES : NO)

//Version
#define CoLcY_SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define CoLcY_SYSTEM_VERSION_NUMBER                       ([[[UIDevice currentDevice] systemVersion] floatValue])
#define CoLcY_iOS_7                                       (CoLcY_SYSTEM_VERSION_NUMBER >= 7.0) ? YES : NO

//Date
#define CoLcY_MiniteInterval      60
#define CoLcY_HourInterval        3600
#define CoLcY_DayInterval         86400
#define CoLcY_WeekInterval        604800
#define CoLcY_MonthInterval       2592000
#define CoLcY_YearInterval        315360000
#define CoLcY_DaysInterval(days)  (86400*(days))

//Math
//Random Number Int
#define CoLcY_RandomInt(min,max)                          (arc4random()%(max-min+1)+min)
#define CoLcY_RandomIntOnlyEqualMin(min,max)              (arc4random()%(max-min)+min)
#define CoLcY_RandomIntOnlyEqualMax(min,max)              (arc4random()%(max-min+1)+(min+1))
#define CoLcY_RandomIntBetweenMinAndMax(min,max)          (arc4random()%(max-min)+(min+1))

#define CoLcY_DegreesToRadians(angle)                     ((angle) * M_PI / 180.0)

//UIScreen
#define CoLcY_UIScreen_MainScreen_Bounds                          [[UIScreen mainScreen] bounds]
#define CoLcY_UIScreen_MainScreen_Bounds_Size                     [[UIScreen mainScreen] bounds].size
#define CoLcY_UIScreen_MainScreen_Bounds_Size_Width               [[UIScreen mainScreen] bounds].size.width
#define CoLcY_UIScreen_MainScreen_Bounds_Size_Height              [[UIScreen mainScreen] bounds].size.height


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#endif
