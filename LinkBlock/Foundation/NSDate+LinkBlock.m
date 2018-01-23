//
//  NSDate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDateLinkBlock)
- (NSInteger (^)(NSDate *))dateMinusYear
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusYear,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps year];
    };
}

- (NSInteger (^)(NSDate *))dateMinusMonth
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusMonth,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps month];
    };
}

- (NSInteger (^)(NSDate *))dateMinusDay
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusDay,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps day];
    };
}

- (NSInteger (^)(NSDate *))dateMinusHour
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusHour,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitHour
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps hour];
    };
}

- (NSInteger (^)(NSDate *))dateMinusMinut
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusMinut,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps minute];
    };
}

- (NSInteger (^)(NSDate *))dateMinusSec
{
    return ^NSInteger(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinusSec,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond
                                                                  fromDate:_self
                                                                    toDate:date
                                                                   options:0];
        return [comps second];
    };
}

- (NSString *(^)(NSString *))dateToStrWithFormat
{
    return ^id(NSString* formatStr){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateToStrWithFormat,formatStr)
        if(NSEqualNil(formatStr) || ![formatStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formatStr;
        return [fmt stringFromDate:_self];
    };
}

- (NSDate *(^)(NSTimeInterval))dateAddTimeInterval
{
    return ^id(NSTimeInterval timeInterval){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddTimeInterval,timeInterval)
        return [_self dateByAddingTimeInterval:timeInterval];
    };
}

- (NSDate *(^)(NSInteger))dateAddSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddSec,sec)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.second=sec;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddMinut,minute)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.minute=minute;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddHour,hour)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.hour=hour;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddDay,day)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.day=day;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddMonth,month)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.month=month;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSDate *(^)(NSInteger))dateAddYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAddYear,year)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.year=year;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}

- (NSInteger (^)(void))dateYear
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateYear)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        return [comps year];
    };
}

- (NSNumber* (^)(void))dateYear_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateYear_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        return @([comps year]);
    };
}

- (NSInteger (^)(void))dateMonth
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        return [comps month];
    };
}

- (NSNumber* (^)(void))dateMonth_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateMonth_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        return @([comps month]);
    };
}

- (NSInteger (^)(void))dateDay
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateDay)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        return [comps day];
    };
}

- (NSNumber* (^)(void))dateDay_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateDay_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        return @([comps day]);
    };
}

- (NSInteger (^)(void))dateHour
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateHour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        return [comps hour];
    };
}

- (NSNumber* (^)(void))dateHour_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateHour_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        return @([comps hour]);
    };
}

- (NSInteger (^)(void))dateMinut
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateMinut)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMinute fromDate:_self];
        return [comps minute];
    };
}

- (NSNumber* (^)(void))dateMinut_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateMinut_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMinute fromDate:_self];
        return @([comps minute]);
    };
}

- (NSInteger (^)(void))dateSec
{
    return ^NSInteger(){
        LinkHandle_VAL_IFNOT(NSDate){
            return 0;
        }
        LinkGroupHandle_VAL(dateSec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitSecond fromDate:_self];
        return [comps second];
    };
}

- (NSNumber* (^)(void))dateSec_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSec_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitSecond fromDate:_self];
        return @([comps second]);
    };
}

- (NSDate *(^)(void))dateDayAtStart
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateDayAtStart)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=0;
        comps.minute=0;
        comps.second=0;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}

- (NSDate *(^)(void))dateDayAtEnd
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateDayAtEnd)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=23;
        comps.minute=59;
        comps.second=59;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}

- (NSDate *(^)(void))dateCurrentZone
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateCurrentZone)
        NSTimeZone* zone = [NSTimeZone systemTimeZone];
        NSInteger offset = [zone secondsFromGMTForDate:_self];
        return [_self dateByAddingTimeInterval:offset];
    };
}

- (NSDate *(^)(NSInteger))dateSetYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetYear,year)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        comps.year=year;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetMonth,month)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        comps.month=month;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetDay,day)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        comps.day=day;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetHour,hour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.hour=hour;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetMinut,minute)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.minute=minute;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (NSDate *(^)(NSInteger))dateSetSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateSetSec,sec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.second=sec;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}

- (BOOL (^)(void))dateIsLeapYear
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsLeapYear)
        NSInteger year = _self.dateYear();
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return YES;
        }else {
            return NO;
        }
        return NO;
    };
}

- (NSNumber* (^)(void))dateIsLeapYear_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateIsLeapYear_n)
        NSInteger year = _self.dateYear();
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return @YES;
        }else {
            return @NO;
        }
        return @NO;
    };
}

- (BOOL (^)(void))dateIsInToday
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInToday)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month] && [comps day]==[compsNow day]){
            return YES;
        }
        return NO;
    };
}

- (NSNumber* (^)(void))dateIsInToday_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateIsInToday_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month] && [comps day]==[compsNow day]){
            return @YES;
        }
        return @NO;
    };
}

- (BOOL (^)(void))dateIsInMonth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month]){
            return YES;
        }
        return NO;
    };
}

- (NSNumber* (^)(void))dateIsInMonth_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateIsInMonth_n)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month]){
            return @YES;
        }
        return @NO;
    };
}

- (NSTimeInterval (^)(void))dateTimeIntervalSince1970
{
    return ^NSTimeInterval(){
        
        LinkHandle_VAL_IFNOT(NSDate){
            return 0.0;
        }
        LinkGroupHandle_VAL(dateTimeIntervalSince1970)
        return [_self timeIntervalSince1970];
    };
}

- (NSNumber* (^)(void))dateTimeIntervalSince1970_n
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateTimeIntervalSince1970_n)
        return @([_self timeIntervalSince1970]);
    };
}

- (NSDateComponents *(^)(void))dateComponentsAll
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateComponentsAll)
        return [[NSCalendar currentCalendar] components:NSUIntegerMax fromDate:_self];
    };
}

- (NSString *(^)(void))dateAstrology
{
    return ^id(){
        LinkHandle_REF(NSDate)
        LinkGroupHandle_REF(dateAstrology)
        NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
        NSString *astroFormat = @"102123444543";
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:_self];
        
        NSInteger month = [components month];
        NSInteger day = [components day];
        
        return [NSString stringWithFormat:@"%@座",[astroString substringWithRange:NSMakeRange(month * 2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19)) * 2,2)]];
    };
}
@end
