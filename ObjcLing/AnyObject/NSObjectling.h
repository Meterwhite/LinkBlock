//
//  TLingObj.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "LingDefines.h"
#import "TLing.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectling<__covariant TYPEx> : TLing
#pragma mark - 增

/// string,array,number,dictionary,set
/// ✅提升为可变
@property (readonly) NSObjectling *(^more)(id obj);
@property (readonly) NSObjectling *(^appendto)(id obj);

/// ✅
@property (readonly) NSObjectling *(^moreN)(id obj1, ...) ;
@property (readonly) NSObjectling *(^moreAt)(id obj1, NSUInteger idx);
@property (readonly) NSObjectling *(^appendtoAt)(id obj1, NSUInteger idx);

#pragma mark - 删
@property (readonly) NSObjectling *(^less)(id obj);
@property (readonly) NSObjectling *(^lessN)(id obj1, ...) ;
@property (readonly) NSObjectling *(^lessAt)(NSUInteger idx);
@property (readonly) NSObjectling *(^deleteFrom)(id obj);

#pragma mark - 改
@property (readonly) NSObjectling *(^instead)(id neww, id old);
@property (readonly) NSObjectling *(^insteadAt)(id neww, NSUInteger idx);
@property (readonly) NSObjectling *(^kvcSet)(id v, NSString *k);
@property (readonly) NSObjectling *(^kvcToggle)(NSString *k);

//@property (readonly) NSObjectling *(^exchange)(TLingConditionIN block);

#pragma mark - 查

#define iloop(from, to, ...) sub_iloop(__VA_ARGS__)
/// iloop(from, to[, TYPEx, CODE])
@property (readonly) NSObjectling *(^iloop)(NSInteger from, NSInteger to, id CODE_OBJ_x_INT_i);
@property (readonly) NSObjectling *(^iloopIN)(NSInteger from, NSInteger to, TLingILoopIN block);
@property (readonly) NSObjectling *(^outer)(id _Nullable * _Nullable ptr);
@property (readonly) NSObjectling *(^kvcOuter)(id v, NSString *k);
@property (readonly) NSObjectling *(^kvcGet)(NSString *k);

#pragma mark - 控制
#define continuee(...) sub_continuee(__VA_ARGS__)
/// /// continuee([TYPEx,] CODE)
@property (readonly) NSObjectling *(^continuee)(id CODE_OBJ_x);
@property (readonly) NSObjectling *(^continueeIN)(TLingConditionIN block);

#pragma mark - 其他

/// ✅
@property (readonly) NSObjectling *log;
@property (readonly) NSObjectling *delog;
@property (readonly) NSObjectling *copied;
@property (readonly) NSObjectling *mCopied;
@property (readonly) NSObjectling *asString;
@property (readonly) NSObjectling *asNumber;


@end

@interface NSObjectling<__covariant TYPEx> (Generic)
@property (readonly) NSObjectling *(^branchIN)(TLingNSObjectlingbranchIN block);
@end

NS_ASSUME_NONNULL_END
