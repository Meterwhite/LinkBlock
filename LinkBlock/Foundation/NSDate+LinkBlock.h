//
//  NSDate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef NSDateNew
#define NSDateNew ([NSDate date])
#endif
@interface NSObject(NSDateLinkBlock)
/** <^(NSString* formatStr)>日期转字符串 formatStr:yyyy-MM-dd */
LBDeclare NSString*        (^dateToStrWithFormat)(NSString* formatStr);
/** <^()> */
LBDeclare NSTimeInterval   (^dateTimeIntervalSince1970)(void);
LBDeclare NSNumber*        (^dateTimeIntervalSince1970ING)(void);
/** <^()> */
LBDeclare NSDateComponents*(^dateComponentsAll)(void);

#pragma mark - 获取日期项的值
/** <^()> */
LBDeclare NSInteger         (^dateYear)(void);
LBDeclare NSNumber*         (^dateYearING)(void);
/** <^()> */
LBDeclare NSInteger         (^dateMonth)(void);
LBDeclare NSNumber*         (^dateMonthING)(void);
/** <^()> */
LBDeclare NSInteger         (^dateDay)(void);
LBDeclare NSNumber*         (^dateDayING)(void);
/** <^()> */
LBDeclare NSInteger         (^dateHour)(void);
LBDeclare NSNumber*         (^dateHourING)(void);
/** <^()> */
LBDeclare NSInteger         (^dateMinut)(void);
LBDeclare NSNumber*         (^dateMinutING)(void);
/** <^()> */
LBDeclare NSInteger         (^dateSec)(void);
LBDeclare NSNumber*         (^dateSecING)(void);

#pragma mark - 计算年月日时分秒的差
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusYear)(NSDate* date);
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusMonth)(NSDate* date);
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusDay)(NSDate* date);
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusHour)(NSDate* date);
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusMinut)(NSDate* date);
/** <^(NSDate* date)> */
LBDeclare NSInteger        (^dateMinusSec)(NSDate* date);

#pragma mark - 增/减年月日时分秒
/** <^(NSTimeInterval timeInterval)> */
LBDeclare NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
/** <^(NSInteger year)> */
LBDeclare NSDate*          (^dateAddYear)(NSInteger year);
/** <^(NSInteger month)> */
LBDeclare NSDate*          (^dateAddMonth)(NSInteger month);
/** <^(NSInteger day)> */
LBDeclare NSDate*          (^dateAddDay)(NSInteger day);
/** <^(NSInteger hour)> */
LBDeclare NSDate*          (^dateAddHour)(NSInteger hour);
/** <^(NSInteger minut)> */
LBDeclare NSDate*          (^dateAddMinut)(NSInteger minut);
/** <^(NSInteger sec)> */
LBDeclare NSDate*          (^dateAddSec)(NSInteger sec);

#pragma mark - 设置年月日时分秒
/** <^(NSInteger year)> */
LBDeclare NSDate*        (^dateSetYear)(NSInteger year);
/** <^(NSInteger month)> */
LBDeclare NSDate*        (^dateSetMonth)(NSInteger month);
/** <^(NSInteger day)> */
LBDeclare NSDate*        (^dateSetDay)(NSInteger day);
/** <^(NSInteger hour)> */
LBDeclare NSDate*        (^dateSetHour)(NSInteger hour);
/** <^(NSInteger minut)> */
LBDeclare NSDate*        (^dateSetMinut)(NSInteger minut);
/** <^(NSInteger sec)> */
LBDeclare NSDate*        (^dateSetSec)(NSInteger sec);
#pragma mark - 其它
/** <^()>获取日期的当天起点时间，相对GMT（格林威尼），24小时制 */
LBDeclare NSDate*          (^dateDayAtStart)(void);
/** <^()>获取日期的当天结束时间，相对GMT（格林威尼），24小时制 */
LBDeclare NSDate*          (^dateDayAtEnd)(void);
/** <^()>获取当前时区下补充了于GTM（格林威尼）时差后的日期对象 */
LBDeclare NSDate*          (^dateCurrentZone)(void);
/** <^()>判断闰年 */
LBDeclare BOOL             (^dateIsLeapYear)(void);
LBDeclare NSNumber*        (^dateIsLeapYearING)(void);
/** <^()>判断是否在本日 */
LBDeclare BOOL             (^dateIsInToday)(void);
LBDeclare NSNumber*        (^dateIsInTodayING)(void);
/** <^()>判断是否为本月 */
LBDeclare BOOL             (^dateIsInMonth)(void);
LBDeclare NSNumber*        (^dateIsInMonthING)(void);
/** <^()>星座 */
LBDeclare NSString*        (^dateAstrology)(void);
@end
