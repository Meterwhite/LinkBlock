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

- (NSArray<NSString*>*)linkCodeSplite;
- (const char*)objcTypeFromValueCodeOfNSString;
- (NSValue*)valueFromValueCodeOfNSString;
- (NSArray<NSString*>*)functionArgumentsStringValueFromCode;
- (NSNumber*)numberEvalFromCode;

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
