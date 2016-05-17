//
//  NSDate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSDate+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(NSDateLinkBlock)
- (NSInteger (^)(NSDate *))dateMinusYear
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitYear
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps year];
    };
}
- (void)setDateMinusYear:(NSInteger (^)(NSDate *))dateMinusYear{};

- (NSInteger (^)(NSDate *))dateMinusMonth
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMonth
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps month];
    };
}
- (void)setDateMinusMonth:(NSInteger (^)(NSDate *))dateMinusMonth{};

- (NSInteger (^)(NSDate *))dateMinusDay
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps day];
    };
}
- (void)setDateMinusDay:(NSInteger (^)(NSDate *))dateMinusDay{};

- (NSInteger (^)(NSDate *))dateMinusHour
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps hour];
    };
}
- (void)setDateMinusHour:(NSInteger (^)(NSDate *))dateMinusHour{};

- (NSInteger (^)(NSDate *))dateMinusMinut
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMinute
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps minute];
    };
}
- (void)setDateMinusMinut:(NSInteger (^)(NSDate *))dateMinusMinut{};

- (NSInteger (^)(NSDate *))dateMinusSec
{
    return ^(NSDate* date){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitSecond
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps second];
    };
}
- (void)setDateMinusSec:(NSInteger (^)(NSDate *))dateMinusSec{};

- (NSString *(^)(NSString *))dateToStrWithFormate
{
    return ^(NSString* formateStr){
        LinkError_REF_AUTO(NSString, NSDate);
        if(!formateStr || ![formateStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formateStr;
        return [fmt stringFromDate:_self];
    };
}
- (void)setDateToStrWithFormate:(NSString *(^)(NSString *))dateToStrWithFormate{};

- (NSDate *(^)(NSTimeInterval))dateAddTimeInterval
{
    return ^(NSTimeInterval timeInterval){
        LinkError_REF_AUTO(NSDate, NSDate);
        return [_self dateByAddingTimeInterval:timeInterval];
    };
}
- (void)setDateAddTimeInterval:(NSDate *(^)(NSTimeInterval))dateAddTimeInterval{};

- (NSDate *(^)(NSInteger))dateAddSec
{
    return ^(NSInteger sec){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.second=sec;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddSec:(NSDate *(^)(NSInteger))dateAddSec{};

- (NSDate *(^)(NSInteger))dateAddMinut
{
    return ^(NSInteger minute){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.minute=minute;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddMinut:(NSDate *(^)(NSInteger))dateAddMinut{};

- (NSDate *(^)(NSInteger))dateAddHour
{
    return ^(NSInteger hour){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.hour=hour;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddHour:(NSDate *(^)(NSInteger))dateAddHour{};

- (NSDate *(^)(NSInteger))dateAddDay
{
    return ^(NSInteger day){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.day=day;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddDay:(NSDate *(^)(NSInteger))dateAddDay{};

- (NSDate *(^)(NSInteger))dateAddMonth
{
    return ^(NSInteger month){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.month=month;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddMonth:(NSDate *(^)(NSInteger))dateAddMonth{};

- (NSDate *(^)(NSInteger))dateAddYear
{
    return ^(NSInteger year){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.year=year;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddYear:(NSDate *(^)(NSInteger))dateAddYear{};

- (NSString *(^)())dateYear
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps year]];
    };
}
- (void)setDateYear:(NSString *(^)())dateYear{};
- (NSString *(^)())dateMonth
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMonthCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps month]];
    };
}
- (void)setDateMonth:(NSString *(^)())dateMonth{};
- (NSString *(^)())dateDay
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSDayCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps day]];
    };
}
- (void)setDateDay:(NSString *(^)())dateDay{};
- (NSString *(^)())dateHour
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSHourCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps hour]];
    };
}
- (void)setDateHour:(NSString *(^)())dateHour{};
- (NSString *(^)())dateMinut
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMinuteCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps minute]];
    };
}
- (void)setDateMinut:(NSString *(^)())dateMinut{};
- (NSString *(^)())dateSec
{
    return ^(){
        LinkError_REF_AUTO(NSString, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSSecondCalendarUnit fromDate:_self];
        return [NSString stringWithFormat:@"%ld" , (long)[comps second]];
    };
}
- (void)setDateSec:(NSString *(^)())dateSec{};

- (NSDate *(^)())dateAtZero
{
    return ^(){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=0;
        comps.minute=0;
        comps.second=0;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateAtZero:(NSDate *(^)())dateAtZero{};

- (NSDate *(^)())dateCurrentZone
{
    return ^(){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSTimeZone* zone = [NSTimeZone systemTimeZone];
        NSInteger offset = [zone secondsFromGMTForDate:_self];
        return [_self dateByAddingTimeInterval:offset];
    };
}
- (void)setDateCurrentZone:(NSDate *(^)())dateCurrentZone{};

- (NSDate *(^)(NSInteger))dateSetYear
{
    return ^(NSInteger year){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        comps.year=year;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetYear:(NSDate *(^)(NSInteger))dateSetYear{};

- (NSDate *(^)(NSInteger))dateSetMonth
{
    return ^(NSInteger month){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        comps.month=month;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetMonth:(NSDate *(^)(NSInteger))dateSetMonth{};

- (NSDate *(^)(NSInteger))dateSetDay
{
    return ^(NSInteger day){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        comps.day=day;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetDay:(NSDate *(^)(NSInteger))dateSetDay{};

- (NSDate *(^)(NSInteger))dateSetHour
{
    return ^(NSInteger hour){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.hour=hour;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetHour:(NSDate *(^)(NSInteger))dateSetHour{};

- (NSDate *(^)(NSInteger))dateSetMinut
{
    return ^(NSInteger minute){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.minute=minute;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetMinut:(NSDate *(^)(NSInteger))dateSetMinut{};

- (NSDate *(^)(NSInteger))dateSetSec
{
    return ^(NSInteger sec){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.second=sec;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetSec:(NSDate *(^)(NSInteger))dateSetSec{};

- (BOOL (^)())dateIsLeapYear
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return NO;
        }
        NSInteger year = [_self.dateYear() intValue];
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return YES;
        }else {
            return NO;
        }
        return NO;
    };
}
- (void)setDateIsLeapYear:(BOOL (^)())dateIsLeapYear{};
@end
