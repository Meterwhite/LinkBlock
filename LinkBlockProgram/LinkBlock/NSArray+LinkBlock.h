//
//  NSArray+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(LinkBlock)
/** 数组对象中是否包含某个字符串对象 */
@property (nonatomic,copy) BOOL             (^blockContainerStr)(NSString*);
/** 是否包含某个对象 */
@property (nonatomic,copy) BOOL             (^blockContainer)(id obj);
/** 某个范围内的数据 */
@property (nonatomic,copy) NSArray*         (^blockObjsFromIndexTo)(NSInteger index1, NSInteger index2);
/** 某个范围内的数据 */
@property (nonatomic,copy) BOOL             (^blockIsIndexInRange)(NSUInteger index);
/** 数组转字典，键为NSNumber类型 */
@property (nonatomic,copy) NSDictionary*    (^blockArrToDictByNumberKey)();
/** 数组转字典，键为NSString类型 */
@property (nonatomic,copy) NSDictionary*    (^blockArrToDictByStringKey)();

@property (nonatomic,copy) NSMutableArray*  (^blockMutableCopy)();
@end
