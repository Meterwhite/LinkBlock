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
#pragma mark - Foundation Mirror/镜像

LBDeclare NSNumber*        (^dateTimeIntervalSince1970As)(void);
LBDeclare NSDateComponents*(^dateComponentsAll)(void);

#pragma mark - Foundation Speed/速度
LBDeclare NSInteger         (^dateYear)(void);
LBDeclare NSNumber*         (^dateYearAs)(void);
LBDeclare NSInteger         (^dateMonth)(void);
LBDeclare NSNumber*         (^dateMonthAs)(void);
LBDeclare NSInteger         (^dateDay)(void);
LBDeclare NSNumber*         (^dateDayAs)(void);
LBDeclare NSInteger         (^dateHour)(void);
LBDeclare NSNumber*         (^dateHourAs)(void);
LBDeclare NSInteger         (^dateMinut)(void);
LBDeclare NSNumber*         (^dateMinutAs)(void);
LBDeclare NSInteger         (^dateSec)(void);
LBDeclare NSNumber*         (^dateSecAs)(void);
/// 计算时间差
/** self-date */
LBDeclare NSInteger        (^dateMinusYear)(NSDate* date);
LBDeclare NSInteger        (^dateMinusMonth)(NSDate* date);
LBDeclare NSInteger        (^dateMinusDay)(NSDate* date);
LBDeclare NSInteger        (^dateMinusHour)(NSDate* date);
LBDeclare NSInteger        (^dateMinusMinut)(NSDate* date);
LBDeclare NSInteger        (^dateMinusSec)(NSDate* date);
/// 修改时间
LBDeclare NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
LBDeclare NSDate*          (^dateAddYear)(NSInteger year);
LBDeclare NSDate*          (^dateAddMonth)(NSInteger month);
LBDeclare NSDate*          (^dateAddDay)(NSInteger day);
LBDeclare NSDate*          (^dateAddHour)(NSInteger hour);
LBDeclare NSDate*          (^dateAddMinut)(NSInteger minut);
LBDeclare NSDate*          (^dateAddSec)(NSInteger sec);

LBDeclare NSDate*        (^dateSetYear)(NSInteger year);
LBDeclare NSDate*        (^dateSetMonth)(NSInteger month);
LBDeclare NSDate*        (^dateSetDay)(NSInteger day);
LBDeclare NSDate*        (^dateSetHour)(NSInteger hour);
LBDeclare NSDate*        (^dateSetMinut)(NSInteger minut);
LBDeclare NSDate*        (^dateSetSec)(NSInteger sec);


#pragma mark - Foundation Extend/多择

#pragma mark - Weak coding/弱类型编码
/** 日期转字符串 formatStr:yyyy-MM-dd */
LBDeclare NSString*        (^dateToStrWithFormat)(NSString* formatStr);

#pragma mark - LinkBlock
/** 中文星座描述 */
LBDeclare NSString*        (^dateToStrAstrologyzh_CN)(void);
/** 获取日期的当天起点时间，相对GMT（格林威尼），24小时制 */
LBDeclare NSDate*          (^dateDayAtStart)(void);
/** 获取日期的当天结束时间，相对GMT（格林威尼），24小时制 */
LBDeclare NSDate*          (^dateDayAtEnd)(void);
/** 获取当前时区下补充了于GTM（格林威尼）时差后的日期对象 */
LBDeclare NSDate*          (^dateCurrentZone)(void);
/** 判断闰年 */
LBDeclare BOOL             (^dateIsLeapYear)(void);
LBDeclare NSNumber*        (^dateIsLeapYearAs)(void);
/** 判断是否在本日 */
LBDeclare BOOL             (^dateIsInToday)(void);
LBDeclare NSNumber*        (^dateIsInTodayAs)(void);
/** 判断是否为本月 */
LBDeclare BOOL             (^dateIsInMonth)(void);
LBDeclare NSNumber*        (^dateIsInMonthAs)(void);






@end
