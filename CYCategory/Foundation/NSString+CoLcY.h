//
//  NSString+CoLcY.h
//  BenNiao
//
//  Created by CoLcY on 16/3/11.
//  Copyright © 2016年 CoLcY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//登陆用户名类型
typedef enum UsernameType
{
    UsernameTypeIllegal = 0,
    UsernameTypeUserID = 1,
    UsernameTypeEmail = 2,
    UsernameTypePhone = 3
} UsernameType;

@interface NSString (CoLcY)
-(BOOL)isEmailString;
-(BOOL)isTelString;
-(BOOL)isUserIDString;
-(BOOL)isCarNO;
-(NSString *)md5String;
-(NSString *)emailToUsername;
-(NSString *)trimming;
-(UsernameType)typeOfUsername; //0：不符合 1：用户ID 2：Email 3：Phone



+(BOOL)isNullOrEmpty:(NSString*)str;
+(NSString*)unescapes:(NSString*)str;
+(NSString*)unescapes:(NSString*)str def:(NSString*)def;

-(NSInteger)lastIndexOf:(NSString *)searchstring;
-(NSInteger)lastIndexOfI:(NSString *)searchstring;

-(NSInteger)indexOf:(NSString *)searchstring;
-(NSInteger)indexOfI:(NSString *)searchstring;
-(NSInteger)indexOf:(NSString *)searchstring start:(int)start;

-(NSString*)padLeft:(NSInteger)totallength;
-(NSString*)padRight:(NSInteger)totallength;

-(NSString*)remove:(NSString *)what;
-(NSString*)removeI:(NSString *)what;

-(NSString*)replace:(NSString *)what with:(NSString *)with;
-(NSString*)replaceI:(NSString *)what with:(NSString *)with;

-(NSString*)subString:(NSInteger)start;
-(NSString*)subString:(NSInteger)start length:(NSInteger)length;

-(NSString*)trim;
-(NSString*)lTrim;
-(NSString*)rTrim;

-(NSArray*)split:(NSString *)withwhat;

-(BOOL)startsWith:(NSString*)subString;
-(BOOL)endsWith:(NSString*)subString;

-(id)jsonValue;
-(NSDate*)dateValue;
-(NSDate*)dateValueByFormat:(NSString*)dateFormat;


-(CGFloat) heightOfText:(UIFont*)font;
-(CGFloat) heightOfText:(UIFont*)font inSize:(CGSize)size;
@end
