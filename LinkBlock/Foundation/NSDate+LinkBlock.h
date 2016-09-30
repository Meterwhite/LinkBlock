//
//  NSDate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NSDateNew
#define NSDateNew ([NSDate date])
#endif
@interface NSObject(NSDateLinkBlock)
/** <^(NSString* formatStr)>日期转字符串 */
@property (nonatomic,copy,readonly) NSString*        (^dateToStrWithFormat)(NSString* formatStr);
/** <^()> */
@property (nonatomic,copy,readonly) NSTimeInterval   (^dateTimeIntervalSince1970)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*        (^dateTimeIntervalSince1970_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSDateComponents*(^dateComponentsAll)();

#pragma mark - 获取日期项的值
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateYear)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateYear_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateMonth)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateMonth_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateDay)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateDay_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateHour)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateHour_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateMinut)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateMinut_n)();
/** <^()> */
@property (nonatomic,copy,readonly) NSInteger         (^dateSec)();
/** <^()> */
@property (nonatomic,copy,readonly) NSNumber*         (^dateSec_n)();

#pragma mark - 计算年月日时分秒的差
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusYear)(NSDate* date);
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusMonth)(NSDate* date);
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusDay)(NSDate* date);
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusHour)(NSDate* date);
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusMinut)(NSDate* date);
/** <^(NSDate* date)> */
@property (nonatomic,copy,readonly) NSInteger        (^dateMinusSec)(NSDate* date);

#pragma mark - 增/减年月日时分秒
/** <^(NSTimeInterval timeInterval)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
/** <^(NSInteger year)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddYear)(NSInteger year);
/** <^(NSInteger month)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddMonth)(NSInteger month);
/** <^(NSInteger day)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddDay)(NSInteger day);
/** <^(NSInteger hour)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddHour)(NSInteger hour);
/** <^(NSInteger minut)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddMinut)(NSInteger minut);
/** <^(NSInteger sec)> */
@property (nonatomic,copy,readonly) NSDate*          (^dateAddSec)(NSInteger sec);

#pragma mark - 设置年月日时分秒
/** <^(NSInteger year)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetYear)(NSInteger year);
/** <^(NSInteger month)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetMonth)(NSInteger month);
/** <^(NSInteger day)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetDay)(NSInteger day);
/** <^(NSInteger hour)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetHour)(NSInteger hour);
/** <^(NSInteger minut)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetMinut)(NSInteger minut);
/** <^(NSInteger sec)> */
@property (nonatomic,copy,readonly) NSDate*        (^dateSetSec)(NSInteger sec);
/** <^()>获取日期的当天起点时间，相对GMT（格林威尼），24小时制 */
@property (nonatomic,copy,readonly) NSDate*          (^dateDayAtStart)();
/** <^()>获取日期的当天结束时间，相对GMT（格林威尼），24小时制 */
@property (nonatomic,copy,readonly) NSDate*          (^dateDayAtEnd)();
/** <^()>获取当前时区下补充了于GTM（格林威尼）时差后的日期对象 */
@property (nonatomic,copy,readonly) NSDate*          (^dateCurrentZone)();
/** <^()>判断闰年 */
@property (nonatomic,copy,readonly) BOOL             (^dateIsLeapYear)();
/** <^()>判断是否在本日 */
@property (nonatomic,copy,readonly) BOOL             (^dateIsInToday)();
/** <^()>判断是否为本月 */
@property (nonatomic,copy,readonly) BOOL             (^dateIsInMonth)();

@end
