//
//  LinkHelper.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/13.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface LinkHelper<__covariant ObjectType> : NSProxy

+ (id)help:(id)target;

/**
 拆分调用命令
 */
- (NSArray<NSString*>*)actionCommandSplitFromLinkCode;

/**
 截取函数名
 */
- (NSString*)functionNameSplitFromFunctionCode;

/**
 截取属性明
 */
- (NSString *)propertyNameFromPropertyCode;

/**
 函数参数拆分；不是函数结构返回nil；否则返回数组；
 */
- (NSArray<NSString*>*)functionArgumentSplitFromFunctionCallCode;


/**
 *字符串字面量解析并装箱
 *空白和不能识别的内容将会返回nil
 */
- (NSValue*)valueFromValueCode;

/**
 字符串数学表达式计算
 */
- (NSNumber*)numberEvalFromCode;

/**
 获取对象的block属性

 @param propertyName block属性名称
 */
- (id)blockPropertyFromObjectByPropertyName:(NSString*)propertyName;


/**
 是否是不定参数的linkBlock
 */
- (BOOL)isIndefiniteParametersLinkBlockName;

/**
 是否是禁止的调用名称
 */
- (BOOL)isUnavailableActionName;

/**
 是否是硬编码的直接量
 */
- (BOOL)isCodeLinkBlockEncoded;

/**
 *硬编码的直接量转为Fundation对象
 */
- (id)valueFromLinkBlockEncodingCodeAction;

/*
 *LinkBlock编码(硬编码的直接量)
 *原理:将字符串和装箱数字的直接量@"..."和@(...)，硬编码成字母和下划线组成的编码形式
 *其中非函数名字符转为:_LB + Unicode编码数字部分 + _
 *如：@"..." => NSString_LB002e__LB002e__LB002e_ 和 @(...) => NSNumber_LB002e__LB002e__LB002e_
 */
- (NSString*)linkBlockEncodingNSStringAndNSNumberFromCode;


+ (void)  helpSwitchObjcType:(const char*)objcType
                    caseVoid:(void(^)())caseVoid
                      caseId:(void(^)())caseId
                   caseClass:(void(^)())caseClass
                     caseIMP:(void(^)())caseIMP
                     caseSEL:(void(^)())caseSEL
                  caseDouble:(void(^)())caseDouble
                   caseFloat:(void(^)())caseFloat
                 casePointer:(void(^)())casePointer
             caseCharPointer:(void(^)())caseCharPointer
            caseUnsignedLong:(void(^)())caseUnsignedLong
        caseUnsignedLongLong:(void(^)())caseUnsignedLongLong
                    caseLong:(void(^)())caseLong
                caseLongLong:(void(^)())caseLongLong
                     caseInt:(void(^)())caseInt
             caseUnsignedInt:(void(^)())caseUnsignedInt
       caseBOOL_Char_xyShort:(void(^)())casecaseBOOL_Char_xyShort
                  caseCGRect:(void(^)())caseCGRect
                 caseNSRange:(void(^)())caseNSRange
                  caseCGSize:(void(^)())caseCGSize
                 caseCGPoint:(void(^)())caseCGPoint
                caseCGVector:(void(^)())caseCGVector
            caseUIEdgeInsets:(void(^)())caseUIEdgeInsets
                caseUIOffset:(void(^)())caseUIOffset
           caseCATransform3D:(void(^)())caseCATransform3D
       caseCGAffineTransform:(void(^)())caseCGAffineTransform
 caseNSDirectionalEdgeInsets:(void(^)())caseNSDirectionalEdgeInsets
                     defaule:(void(^)())defaule;


#pragma mark - 配置
+ (BOOL)link_block_configuration_get_is_show_warning;

/**
 运行时是否显示警告
 */
+ (void)link_block_configuration_set_is_show_warning:(BOOL)b;
@end
