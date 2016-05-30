//
//  NSDate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NSDateNew ([NSDate date])
@interface NSObject(NSDateLinkBlock)
/** 日期转字符串 */
@property (nonatomic,copy) NSString*        (^dateToStrWithFormat)(NSString* formatStr);
@property (nonatomic,copy) NSTimeInterval   (^dateTimeIntervalSince1970)();
@property (nonatomic,copy) NSDateComponents*(^dateComponentsAll)();

#pragma mark - 获取日期项的值
@property (nonatomic,copy) NSInteger         (^dateYear)();
@property (nonatomic,copy) NSInteger         (^dateMonth)();
@property (nonatomic,copy) NSInteger         (^dateDay)();
@property (nonatomic,copy) NSInteger         (^dateHour)();
@property (nonatomic,copy) NSInteger         (^dateMinut)();
@property (nonatomic,copy) NSInteger         (^dateSec)();

#pragma mark - 计算年月日时分秒的差
@property (nonatomic,copy) NSInteger        (^dateMinusYear)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusMonth)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusDay)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusHour)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusMinut)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusSec)(NSDate* date);

#pragma mark - 增/减年月日时分秒
@property (nonatomic,copy) NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
@property (nonatomic,copy) NSDate*          (^dateAddYear)(NSInteger year);
@property (nonatomic,copy) NSDate*          (^dateAddMonth)(NSInteger month);
@property (nonatomic,copy) NSDate*          (^dateAddDay)(NSInteger day);
@property (nonatomic,copy) NSDate*          (^dateAddHour)(NSInteger hour);
@property (nonatomic,copy) NSDate*          (^dateAddMinut)(NSInteger minut);
@property (nonatomic,copy) NSDate*          (^dateAddSec)(NSInteger sec);

#pragma mark - 设置年月日时分秒
@property (nonatomic,copy) NSDate*        (^dateSetYear)(NSInteger year);
@property (nonatomic,copy) NSDate*        (^dateSetMonth)(NSInteger month);
@property (nonatomic,copy) NSDate*        (^dateSetDay)(NSInteger day);
@property (nonatomic,copy) NSDate*        (^dateSetHour)(NSInteger hour);
@property (nonatomic,copy) NSDate*        (^dateSetMinut)(NSInteger minut);
@property (nonatomic,copy) NSDate*        (^dateSetSec)(NSInteger sec);
/** 获取日期的当天起点时间，相对GMT（格林威尼），24小时制 */
@property (nonatomic,copy) NSDate*          (^dateDayAtStart)();
/** 获取日期的当天结束时间，相对GMT（格林威尼），24小时制 */
@property (nonatomic,copy) NSDate*          (^dateDayAtEnd)();
/** 获取当前时区下补充了于GTM（格林威尼）时差后的日期对象 */
@property (nonatomic,copy) NSDate*          (^dateCurrentZone)();
/** 判断闰年 */
@property (nonatomic,copy) BOOL             (^dateIsLeapYear)();
/** 判断是否在本日 */
@property (nonatomic,copy) BOOL             (^dateIsInToday)();
/** 判断是否为本月 */
@property (nonatomic,copy) BOOL             (^dateIsInMonth)();

@end
