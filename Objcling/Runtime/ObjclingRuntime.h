//
//  ObjclingRuntime.h
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSDecimalNumber *ocling_get_decimal(id x);

NSSet *ocling_mutable_class_map(void);

/// 是否是可变对象
bool ocling_is_mutableobject(id x);

/// 按需的可变拷贝
id ocling_mutablecopy_ifneed(id x);

/// 对象键对应的类型
const char * _Nullable ocling_encForKey(id x, NSString *k);

NSNumber *_Nullable ocling_to_number(id x);

NSString *_Nullable ocling_to_string(id x);

@interface ObjclingRuntime : NSObject


@end

/// 类型编码 辅助对象；该类的设计将可变信息存与本身，不变信息存于原型对象，并切原型对象可被被高速缓存查询；每一种类型编码只解析一次；极大提升判断效率；
@interface ObjclingTypeEnc : NSObject

- (instancetype)initWithEnc:(const char *)enc;

@property (nonatomic,readonly) const char* enc;

/// IMP,SEL,Class,int,string,pointer,NSObject...(PS:数字类型以C为准)
@property (nonatomic,readonly) NSString *typeName;

/// id对象的类型
@property (nonatomic,readonly) Class clazz;

/// 对象遵守的协议
@property (nonatomic,readonly) NSArray<Protocol *> *protocols;

@property (nonatomic,readonly) bool isVoid;

/// 即id对象
@property (nonatomic,readonly) bool isObject;
@property (nonatomic,readonly) bool isClass;
@property (nonatomic,readonly) bool isIMP;
@property (nonatomic,readonly) bool isSEL;
/// T *
@property (nonatomic,readonly) bool isPointer;
/// char *
@property (nonatomic,readonly) bool isCString;

#pragma mark - 数字

/// 是否是C数字
@property (nonatomic,readonly) bool isCNumber;

/// 浮点数类型
@property (nonatomic,readonly) bool isFloatKind;
@property (nonatomic,readonly) bool isDouble;
@property (nonatomic,readonly) bool isFloat;

/// 整数类型
@property (nonatomic,readonly) bool isIntKind;
@property (nonatomic,readonly) bool isUnsignedLong;
@property (nonatomic,readonly) bool isUnsignedLongLong;
@property (nonatomic,readonly) bool isLong;
@property (nonatomic,readonly) bool isLongLong;
@property (nonatomic,readonly) bool isInt;
@property (nonatomic,readonly) bool isUnsignedInt;

@property (nonatomic,readonly) bool isShort;
@property (nonatomic,readonly) bool isBOOL;
@property (nonatomic,readonly) bool isBool;
@property (nonatomic,readonly) bool isChar;
@property (nonatomic,readonly) bool isUnsignedChar;
@property (nonatomic,readonly) bool isUnsignedShort;

#pragma mark - 结构体
/// 结构体类型
@property (nonatomic,readonly) bool isStruct;
@property (nonatomic,readonly) bool isCGRect;
@property (nonatomic,readonly) bool isCGPoint;
@property (nonatomic,readonly) bool isCGSize;
@property (nonatomic,readonly) bool isNSRange;
@property (nonatomic,readonly) bool isUIEdgeInsets;
@property (nonatomic,readonly) bool isCGVector;
@property (nonatomic,readonly) bool isUIOffset;
@property (nonatomic,readonly) bool isCATransform3D;
@property (nonatomic,readonly) bool isCGAffineTransform;
@property (nonatomic,readonly) bool isNSDirectionalEdgeInsets;

#pragma mark - 语法辅助 固定式
- (void)switchedForCaseVoid:(void(^)(void))caseVoid
                     caseId:(void(^)(void))caseId
                  caseClass:(void(^)(void))caseClass
                    caseIMP:(void(^)(void))caseIMP
                    caseSEL:(void(^)(void))caseSEL
                 caseDouble:(void(^)(void))caseDouble
                  caseFloat:(void(^)(void))caseFloat
                casePointer:(void(^)(void))casePointer
                caseCString:(void(^)(void))caseCString
           caseUnsignedLong:(void(^)(void))caseUnsignedLong
       caseUnsignedLongLong:(void(^)(void))caseUnsignedLongLong
                   caseLong:(void(^)(void))caseLong
               caseLongLong:(void(^)(void))caseLongLong
                    caseInt:(void(^)(void))caseInt
            caseUnsignedInt:(void(^)(void))caseUnsignedInt
          caseBOOLShortChar:(void(^)(void))caseBOOLShortChar
                 caseCGRect:(void(^)(void))caseCGRect
                caseNSRange:(void(^)(void))caseNSRange
                 caseCGSize:(void(^)(void))caseCGSize
                caseCGPoint:(void(^)(void))caseCGPoint
               caseCGVector:(void(^)(void))caseCGVector
           caseUIEdgeInsets:(void(^)(void))caseUIEdgeInsets
               caseUIOffset:(void(^)(void))caseUIOffset
          caseCATransform3D:(void(^)(void))caseCATransform3D
      caseCGAffineTransform:(void(^)(void))caseCGAffineTransform
caseNSDirectionalEdgeInsets:(void(^)(void))caseNSDirectionalEdgeInsets
                    defaule:(void(^)(void))defaule;

#pragma mark - 语法辅助 活动式
@property (nullable,nonatomic,copy) void(^casedVoid)(void);
@property (nullable,nonatomic,copy) void(^casedId)(void);
@property (nullable,nonatomic,copy) void(^casedClass)(void);
@property (nullable,nonatomic,copy) void(^casedIMP)(void);
@property (nullable,nonatomic,copy) void(^casedSEL)(void);
@property (nullable,nonatomic,copy) void(^casedDouble)(void);
@property (nullable,nonatomic,copy) void(^casedFloat)(void);
@property (nullable,nonatomic,copy) void(^casedPointer)(void);
@property (nullable,nonatomic,copy) void(^casedCString)(void);
@property (nullable,nonatomic,copy) void(^casedUnsignedLong)(void);
@property (nullable,nonatomic,copy) void(^casedUnsignedLongLong)(void);
@property (nullable,nonatomic,copy) void(^casedLong)(void);
@property (nullable,nonatomic,copy) void(^casedLongLong)(void);
@property (nullable,nonatomic,copy) void(^casedInt)(void);
@property (nullable,nonatomic,copy) void(^casedUnsignedInt)(void);
@property (nullable,nonatomic,copy) void(^casedBOOLShortChar)(void);
@property (nullable,nonatomic,copy) void(^casedCGRect)(void);
@property (nullable,nonatomic,copy) void(^casedNSRange)(void);
@property (nullable,nonatomic,copy) void(^casedCGSize)(void);
@property (nullable,nonatomic,copy) void(^casedCGPoint)(void);
@property (nullable,nonatomic,copy) void(^casedCGVector)(void);
@property (nullable,nonatomic,copy) void(^casedUIEdgeInsets)(void);
@property (nullable,nonatomic,copy) void(^casedUIOffset)(void);
@property (nullable,nonatomic,copy) void(^casedCATransform3D)(void);
@property (nullable,nonatomic,copy) void(^casedCGAffineTransform)(void);
@property (nullable,nonatomic,copy) void(^casedNSDirectionalEdgeInsets)(void);
#pragma mark - 补充
@property (nullable,nonatomic,copy) void(^casedCNumber)(void);
@property (nullable,nonatomic,copy) void(^casedFloatKind)(void);
@property (nullable,nonatomic,copy) void(^casedIntKind)(void);
@property (nullable,nonatomic,copy) void(^casedStruct)(void);
@property (nullable,nonatomic,copy) void(^casedDefault)(void);

/// 触发case过程，最终调用此方法
- (void)switchUsingBlocks;
@end

NS_ASSUME_NONNULL_END
