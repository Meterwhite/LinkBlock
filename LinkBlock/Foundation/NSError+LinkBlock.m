//
//  NSError+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSErrorLinkBlock)
- (NSObject *(^)(id<NSCopying>))errorValueInUserInfo
{
    return ^id(id<NSCopying> key){
        LinkHandle_REF(NSObject, NSError)
        LinkGroupHandle_REF(errorValueInUserInfo,key)
        return _self.userInfo[key];
    };
}
@end
