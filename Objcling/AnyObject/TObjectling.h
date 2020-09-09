//
//  TlingObj.h
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "Tling.h"

@class TStringling, TNumberling;

NS_ASSUME_NONNULL_BEGIN

@interface TObjectling : Tling
#pragma mark - 增

/// string,array,number,dictionary,set
/// ✅提升为可变
@property (readonly) TObjectling *(^more)(id obj);

@property (readonly) TObjectling *(^appendto)(id obj);

/// ✅
@property (readonly) TObjectling *(^moreN)(id obj1, ...) ;

@property (readonly) TObjectling *(^moreAt)(id obj1, NSUInteger idx);

@property (readonly) TObjectling *(^appendtoAt)(id obj1, NSUInteger idx);


#pragma mark - 删
@property (readonly) TObjectling *(^less)(id obj);

@property (readonly) TObjectling *(^lessN)(id obj1, ...) ;

@property (readonly) TObjectling *(^lessAt)(NSUInteger idx);

@property (readonly) TObjectling *(^deleteFrom)(id objs);

/// 数组，字典，字符串
@property (readonly) TObjectling *clean;


#pragma mark - 改
@property (readonly) TObjectling *(^instead)(id neww, id old);

@property (readonly) TObjectling *(^insteadAt)(id neww, NSUInteger idx);

@property (readonly) TObjectling *(^kvcSet)(id v, NSString *k);

@property (readonly) TObjectling *(^kvcToggle)(NSString *k);

#pragma mark - 查

#define floop(from, to, ...) sub_floop(__VA_ARGS__)
/// floop(from, to[, TargetType, CODE]) 链上的for循环
@property (readonly) TObjectling *(^floop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);

@property (readonly) TObjectling *(^floopIN)(NSInteger from, NSInteger to, TlingILoopIN block);

@property (readonly) TObjectling *(^outer)(id _Nullable * _Nullable ptr);

@property (readonly) TObjectling *(^kvcOuter)(id v, NSString *k);

@property (readonly) TObjectling *(^kvcGet)(NSString *k);
#pragma mark - 转换
@property (readonly) TStringling *asString;

@property (readonly) TNumberling *asNumber;

@property (readonly) TNumberling *length;

@property (readonly) TNumberling *count;

@property (readonly) TNumberling *(^euqal)(id obj);
/// !a
@property (readonly) TNumberling *(^notEuqal)(id obj);
/// a && b && c
@property (readonly) TNumberling *(^equalEach)(id obj, ...);
/// !a && !b && !c
@property (readonly) TNumberling *(^equalNoOne)(id obj, ...);
/// a || b || c
@property (readonly) TNumberling *(^equalAnyone)(id obj, ...);

#pragma mark - 控制
#define continuee(...) sub_continuee(__VA_ARGS__)
/// /// continuee([TargetType,] CODE)
@property (readonly) TObjectling *(^continuee)(id CODE_OBJ_x);

@property (readonly) TObjectling *(^continueeIN)(TlingConditionIN block);

#pragma mark - 其他

/// ✅
@property (readonly) TObjectling *log;

@property (readonly) TObjectling *delog;

@property (readonly) TObjectling *copied;

@property (readonly) TObjectling *mCopied;

@end


/// 类型延伸
@interface TObjectling (Generic)
@property (readonly) TObjectling *(^branchIN)(TlingTObjectlingbranchIN block);
@end

NS_ASSUME_NONNULL_END
