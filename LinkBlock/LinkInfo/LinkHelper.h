//
//  LinkHelper.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/13.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface LinkHelper<__covariant ObjectType> : NSProxy


/**
 获取被帮助形式的对象；该对象可以调用对象本身的方法；也可以调用求助功能；
 这个形式避免了多余的扩展方法，扩展文件和多余的工具类类型定义；

 @param target 要寻求帮助的对象，该方法不会引用目标对象，确保目标在使用前不被释放，或者使用helpAndRef
 */
+ (id)help:(id)target;

- (NSArray<NSString*>*)blockCommandSplitFromLinkCode;
- (NSString*)functionNameSplitFromFunctionCode;
- (NSArray<NSString*>*)functionArgumentSplitFromFunctionCallCode;
- (NSValue*)valueFromValueCode;
- (NSNumber*)numberEvalFromCode;


- (id)dynamicLinkBlockForwardInvocation:(NSString*)invocation
                                  vList:(va_list)vList
                                 vRange:(NSRange)vRange;

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

@end
