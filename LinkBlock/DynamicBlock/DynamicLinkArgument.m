//
//  DynamicLinkArgument.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLinkArgument.h"
#import "LinkHelper.h"

@interface DynamicLinkArgument()
{
     void* _objcValue;
}
@end

@implementation DynamicLinkArgument

- (void)dealloc
{
    //测试后删除
    free(_objcValue);
    _objcValue = NULL;
}

+ (instancetype)linkArgumentFromVlueCode:(NSString *)code
{
    DynamicLinkArgument* arg = [DynamicLinkArgument new];
    
    const char* objcType = [[LinkHelper help:code] objcTypeFromValueCodeOfNSString];
    if(!objcType){
        NSAssert(objcType, @"LinkError:构造失败的字符串值定义%@，检查并核对文档；",code);
        return nil;
    }
    
    arg->_stringValue = code;
    arg->_objcType = objcType;
    [arg setObjcValue];
    return arg;
}

- (void)setObjcValue
{
    if(!_stringValue || !_objcType){
        _objcValue = NULL;
        return;
    }
    
    
//    void(^blockOfInteger)() = ^(){
//
//    };
//
//    void(^blockOfFloat)() = ^(){
//
//    };
//
//    [LinkHelper helpSwitchObjcType:_objcType caseVoid:nil caseId:^{
//
//    } caseClass:^{
//
//    } caseIMP:nil caseSEL:^{
//
//    } caseDouble:blockOfFloat caseFloat:blockOfFloat casePointer:nil caseCharPointer:^{
//
//    } caseUnsignedLong:blockOfInteger caseUnsignedLongLong:blockOfInteger caseLong:blockOfInteger caseLongLong:blockOfInteger caseInt:blockOfInteger caseUnsignedInt:blockOfInteger caseBOOL_Char_xyShort:^{
//
//    } caseCGRect:^{
//
//    } caseNSRange:^{
//        
//    } caseCGSize:^{
//
//    } caseCGPoint:^{
//
//    } caseCGVector:^{
//
//    } caseUIEdgeInsets:^{
//
//    } caseUIOffset:^{
//
//    } caseCATransform3D:nil caseCGAffineTransform:^{
//
//    } caseNSDirectionalEdgeInsets:^{
//
//    } defaule:^{
//
//    }];
}


@end
