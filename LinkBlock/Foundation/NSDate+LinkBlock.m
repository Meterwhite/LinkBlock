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

- (NSString *(^)(NSString *))dateToStrWithFormat
{
    return ^(NSString* formatStr){
        LinkError_REF_AUTO(NSString, NSDate);
        if(!formatStr || ![formatStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formatStr;
        return [fmt stringFromDate:_self];
    };
}
- (void)setDateToStrWithFormat:(NSString *(^)(NSString *))dateToStrWithFormat{};

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

- (NSInteger (^)())dateYear
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit fromDate:_self];
        return [comps year];
    };
}
- (void)setDateYear:(NSInteger (^)())dateYear{};
- (NSInteger (^)())dateMonth
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMonthCalendarUnit fromDate:_self];
        return [comps month];
    };
}
- (void)setDateMonth:(NSInteger (^)())dateMonth{};
- (NSInteger (^)())dateDay
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSDayCalendarUnit fromDate:_self];
        return [comps day];
    };
}
- (void)setDateDay:(NSInteger (^)())dateDay{};
- (NSInteger (^)())dateHour
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSHourCalendarUnit fromDate:_self];
        return [comps hour];
    };
}
- (void)setDateHour:(NSInteger (^)())dateHour{};
- (NSInteger (^)())dateMinut
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMinuteCalendarUnit fromDate:_self];
        return [comps minute];
    };
}
- (void)setDateMinut:(NSInteger (^)())dateMinut{};
- (NSInteger (^)())dateSec
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return (NSInteger)0;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSSecondCalendarUnit fromDate:_self];
        return [comps second];
    };
}
- (void)setDateSec:(NSInteger (^)())dateSec{};

- (NSDate *(^)())dateDayAtStart
{
    return ^(){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=0;
        comps.minute=0;
        comps.second=0;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}
- (void)setDateDayAtStart:(NSDate *(^)())dateDayAtStart{};

- (NSDate *(^)())dateDayAtEnd
{
    return ^(){
        LinkError_REF_AUTO(NSDate, NSDate);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=23;
        comps.minute=59;
        comps.second=59;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}
- (void)setDateDayAtEnd:(NSDate *(^)())dateDayAtEnd{};

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
        NSInteger year = _self.dateYear();
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return YES;
        }else {
            return NO;
        }
        return NO;
    };
}
- (void)setDateIsLeapYear:(BOOL (^)())dateIsLeapYear{};

- (BOOL (^)())dateIsInToday
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return NO;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month] && [comps day]==[compsNow day]){
            return YES;
        }
        return NO;
    };
}
- (void)setDateIsInToday:(BOOL (^)())dateIsInToday{};

- (BOOL (^)())dateIsInMonth
{
    return ^(){
        LinkError_VAL_IF(NSDate){
            return NO;
        }
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month]){
            return YES;
        }
        return NO;
    };
}
- (void)setDateIsInMonth:(BOOL (^)())dateIsInMonth{};

- (NSTimeInterval (^)())dateTimeIntervalSince1970
{
    return ^(){
        
        LinkError_VAL_IF(NSDate){
            return (NSTimeInterval)0.0;
        }
        return [_self timeIntervalSince1970];
    };
}
- (void)setDateTimeIntervalSince1970:(NSTimeInterval (^)())dateTimeIntervalSince1970{};

- (NSDateComponents *(^)())dateComponentsAll
{
    return ^(){
        LinkError_REF_AUTO(NSDateComponents, NSDate);
        return [[NSCalendar currentCalendar] components:NSUIntegerMax fromDate:_self];
    };
}
- (void)setDateComponentsAll:(NSDateComponents *(^)())dateComponentsAll{};
@end
