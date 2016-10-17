//
//  Others+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//


#import "LinkBlock.h"

@implementation NSObject(OtherLinkBlock)
- (id (^)())end
{
    return ^id(){
        return self.linkEnd;
    };
}
- (id (^)())ends
{
    return ^id(){
        return self.linkEnds;
    };
}
- (id (^)(NSUInteger idx))endsAt
{
    return ^id(NSUInteger idx){
        return self.linkEndsAt(idx);
    };
}

- (BOOL (^)(id))arrIsContainer
{
    return ^(id obj){
        LinkHandle_VAL_IFNOT(NSArray){
            return NO;
        }
        LinkGroupHandle_VAL(arrIsContainer,obj)
        return [_self containsObject:obj];
    };
}

- (BOOL (^)(NSString *))strIsContain
{
    return ^(NSString* str){
        LinkHandle_VAL_IFNOT(NSString){
            return NO;
        }
        LinkGroupHandle_VAL(strIsContain,str)
        return [_self containsString:str];
    };
}
@end
