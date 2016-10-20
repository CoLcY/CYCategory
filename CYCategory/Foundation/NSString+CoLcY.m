//
//  NSString+CoLcY.m
//  BenNiao
//
//  Created by CoLcY on 16/3/11.
//  Copyright © 2016年 CoLcY. All rights reserved.
//

#import "NSString+CoLcY.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (CoLcY)
-(BOOL)isEmailString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)isTelString
{
    //手机号以13，15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}

-(BOOL)isUserIDString
{
    NSString *userIDRegex = @"[1-9]\\d{4,}";
    NSPredicate *userIDTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userIDRegex];
    
    return [userIDTest evaluateWithObject:self];
}

-(BOOL)isCarNO
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}


-(NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result );
    
    NSString *md5 = [NSString stringWithFormat:
                     @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                     result[0], result[1], result[2], result[3],
                     result[4], result[5], result[6], result[7],
                     result[8], result[9], result[10], result[11],
                     result[12], result[13], result[14], result[15]];
    return [md5 lowercaseString];
    
}

-(NSString *)emailToUsername
{
    return [[self stringByReplacingOccurrencesOfString:@"@" withString:@""] stringByReplacingOccurrencesOfString:@"." withString:@""];
    //    return [self stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@."]];
}

-(NSString *)trimming
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//0：不符合 1：用户ID 2：Email 3：Phone
-(UsernameType)typeOfUsername
{
    if ([self length] < 5) {
        return UsernameTypeIllegal;
    }
    else
    {
        //        NSString *usernameRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5,19}"; //用户名为大写字母小写字母或下划线,并以字母开头,长度为6-20
        //        NSPredicate *usernameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",usernameRegex];
        //        if ([usernameTest evaluateWithObject:self]) {
        //            type=1;
        //            return type;
        //        }
        //        else
        //        {
        //            NSString *userIDRegex = @"[1-9]\\d{4,}";
        //            NSPredicate *userIDTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userIDRegex];
        //            if ([userIDTest evaluateWithObject:self]) {
        //                type=2;
        //                return type;
        //            }
        //        }
        if ([self isEmailString]) {
            return UsernameTypeEmail;
        }
        else if ([self isTelString]){
            return UsernameTypePhone;
        }
        else if ([self isUserIDString]){
            return UsernameTypeUserID;
        }
        else
        {
            return UsernameTypeIllegal;
        }
    }
}


+(BOOL)isNullOrEmpty:(NSString*)str
{
    if(str == nil)
        return true;
    
    return [str isEqualToString:@""];
}

+(NSString*)unescapes:(NSString*)str
{
    return [NSString unescapes:str def:nil];
}

+(NSString*)unescapes:(id)str def:(NSString*)def
{
    if(str && str!= [NSNull null])
        return [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    else
        return def;
}

-(NSInteger)lastIndexOf:(NSString *)searchstring
{
    
    NSRange start=[self rangeOfString:searchstring options:NSBackwardsSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return self.length - start.location - searchstring.length;
}

-(NSInteger)lastIndexOfI:(NSString *)searchstring
{
    
    NSRange start=[self rangeOfString:searchstring options:NSBackwardsSearch+NSCaseInsensitiveSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}

-(NSInteger)indexOf:(NSString *)searchstring
{
    NSRange start=[self rangeOfString:searchstring];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}


-(NSInteger)indexOfI:(NSString *)searchstring
{
    NSRange start=[self rangeOfString:searchstring options:NSCaseInsensitiveSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}

-(NSInteger)indexOf:(NSString *)searchstring start:(int)start
{
    NSRange start2=[self rangeOfString:searchstring options:NSCaseInsensitiveSearch range:NSMakeRange(start, self.length-start) ];
    
    if (start2.location == NSNotFound)
        return -1;
    else
        return start2.location;
}

-(NSString *)subString:(NSInteger)start
{
    NSRange srange=NSMakeRange(start,[self length]-start);
    
    return [self substringWithRange:srange];
}


-(NSString *)subString:(NSInteger)start length:(NSInteger)length
{
    NSRange srange=NSMakeRange(start,length);
    
    return [self substringWithRange:srange];
}

-(NSString *)replace:(NSString *)what with:(NSString *)with
{
    return [self stringByReplacingOccurrencesOfString:what withString:with];
}

-(NSString *)replaceI:(NSString *)what with:(NSString *)with
{
    NSRange range = NSMakeRange(0, [self length]);
    return [self stringByReplacingOccurrencesOfString:what withString:with options:NSCaseInsensitiveSearch range:range];
}

-(NSString *)remove:(NSString *)what
{
    return [self stringByReplacingOccurrencesOfString:what withString:@""];
}

-(NSString *)removeI:(NSString *)what
{
    NSRange range = NSMakeRange(0, [self length]);
    return [self stringByReplacingOccurrencesOfString:what withString:@"" options:NSCaseInsensitiveSearch range:range];
}

-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)lTrim
{
    
    if ([self length]==0) return self;
    NSInteger i=0;
    
    while (i<[self length])
    {
        unichar thechar = [self characterAtIndex:i];
        if (thechar==' ' || thechar=='\n')
        {
            i++;
        }
        else
        {
            break;
        }
        
    }
    
    return [self subString:i];
}

-(NSString *)rTrim
{
    
    NSInteger i=[self length]-1;
    if (i==-1) return self;
    
    while (i>0)
    {
        unichar thechar = [self characterAtIndex:i];
        if (thechar==' ' || thechar=='\n')
        {
            i--;
        }
        else
        {
            break;
        }
        
    }
    
    return [self subString:0 length:i+1];
}

-(NSArray *)split:(NSString *)withwhat
{
    NSArray *chunks = [self componentsSeparatedByString: withwhat];
    return chunks;
}

-(NSString*)padRight:(NSInteger)totallength
{
    if ([self length]>=totallength) return self;
    return [self stringByPaddingToLength:totallength withString: @" " startingAtIndex:0];
}

-(NSString *)padLeft:(NSInteger)totallength
{
    if ([self length]>=totallength) return self;
    
    NSString *emptyString = @"";
    NSString *padString = [emptyString stringByPaddingToLength:totallength-[self length] withString:@" " startingAtIndex:0];
    return [padString stringByAppendingString:self];
}

-(BOOL)startsWith:(NSString*)subString
{
    return [self indexOf:subString]==0;
}


-(BOOL)endsWith:(NSString*)subString
{
    NSInteger idx = [self lastIndexOf:subString];
    return idx==0;
}

-(id)jsonValue
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

-(NSDate*)dateValue
{
    return [self dateValueByFormat:@"yyyy-MM-dd HH:mm:ss"];
}

-(NSDate*)dateValueByFormat:(NSString*)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: dateFormat];
    
    
    return  [dateFormatter dateFromString:self];
}

-(CGFloat) heightOfText:(UIFont*)font
{
    return [self sizeWithAttributes:@{ NSFontAttributeName : font}].height;
}

-(CGFloat) heightOfText:(UIFont*)font inSize:(CGSize)size
{
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName: font}
                                     context:nil];
    
    return rect.size.height;
}


@end
