//
//  NSDate+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSDateLinkBlock)

@property (nonatomic,copy) NSString*        (^dateToStrWithFormate)(NSString* formateStr);

#pragma mark - 计算日期差值
@property (nonatomic,copy) NSInteger        (^dateMinusYear)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusMonth)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusDay)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusHour)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusMinut)(NSDate* date);
@property (nonatomic,copy) NSInteger        (^dateMinusSec)(NSDate* date);

#pragma mark - 日期相加
@property (nonatomic,copy) NSDate*          (^dateAddTimeInterval)(NSTimeInterval timeInterval);
/** 365 */
@property (nonatomic,copy) NSDate*          (^dateAddYear)(NSInteger year);
/** 30 */
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
/** 获取日期的当天0点时间 */
@property (nonatomic,copy) NSDate*          (^dateAtZero)();
/** 获取补充了于格林威尼时差后的对象 */
@property (nonatomic,copy) NSDate*          (^dateCurrentZone)();
@end
