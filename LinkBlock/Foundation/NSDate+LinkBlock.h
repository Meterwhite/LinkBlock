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
@property (nonatomic,copy) NSString*        (^dateToStrWithFormate)(NSString* formateStr);

#pragma mark - 计算年月日时分秒的差
/** 计算年之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusYear)(NSDate* date);
/** 计算月之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusMonth)(NSDate* date);
/** 计算日之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusDay)(NSDate* date);
/** 计算时之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusHour)(NSDate* date);
/** 计算分之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusMinut)(NSDate* date);
/** 计算秒之间的差 */
@property (nonatomic,copy) NSInteger        (^dateMinusSec)(NSDate* date);

#pragma mark - 增/减年月日时分秒
@property (nonatomic,copy) NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
@property (nonatomic,copy) NSDate*          (^dateAddYear)(NSInteger year);
@property (nonatomic,copy) NSDate*          (^dateAddMonth)(NSInteger month);
@property (nonatomic,copy) NSDate*          (^dateAddDay)(NSInteger day);
@property (nonatomic,copy) NSDate*          (^dateAddHour)(NSInteger hour);
@property (nonatomic,copy) NSDate*          (^dateAddMinut)(NSInteger minut);
@property (nonatomic,copy) NSDate*          (^dateAddSec)(NSInteger sec);
#pragma mark - 获取日期的值，整数的字符串
@property (nonatomic,copy) NSString*        (^dateYear)();
@property (nonatomic,copy) NSString*        (^dateMonth)();
@property (nonatomic,copy) NSString*        (^dateDay)();
@property (nonatomic,copy) NSString*        (^dateHour)();
@property (nonatomic,copy) NSString*        (^dateMinut)();
@property (nonatomic,copy) NSString*        (^dateSec)();
#pragma mark - 设置年月日时分秒
@property (nonatomic,copy) NSDate*        (^dateSetYear)(NSInteger year);
@property (nonatomic,copy) NSDate*        (^dateSetMonth)(NSInteger month);
@property (nonatomic,copy) NSDate*        (^dateSetDay)(NSInteger day);
@property (nonatomic,copy) NSDate*        (^dateSetHour)(NSInteger hour);
@property (nonatomic,copy) NSDate*        (^dateSetMinut)(NSInteger minut);
@property (nonatomic,copy) NSDate*        (^dateSetSec)(NSInteger sec);
/** 获取日期的当天0点时间，相对GMT（格林威尼） */
@property (nonatomic,copy) NSDate*          (^dateAtZero)();
/** 获取当前时区，补充了于GTM（格林威尼）时差后的日期对象 */
@property (nonatomic,copy) NSDate*          (^dateCurrentZone)();
/** 判断闰年 */
@property (nonatomic,copy) BOOL             (^dateIsLeapYear)();
@end
