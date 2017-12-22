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

@end

@implementation DynamicLinkArgument

+ (instancetype)dynamicLinkArgumentFromVlueCode:(NSString *)code
{
    DynamicLinkArgument* _self = [[self alloc] initWithCode:code];
    if(!_self.validate) return nil;
    return _self;
}

- (instancetype)initWithCode:(NSString *)code
{
    self = [super init];
    if (self) {
        _objcValue = [[LinkHelper help:code] valueFromValueCode];
        if(!_objcValue){
            NSLog(@"DynamicLink Error:失败的直接量定义%@，检查并核对文档；",code);
            _validate = NO;
        }else{
            _validate = YES;
        }
        _stringValue = code;
    }
    return self;
}

- (const char *)objcType
{
    return _objcValue.objCType;
}

- (NSUInteger)index
{
    if(_indexPath.length == 2){
        return [_indexPath indexAtPosition:1];
    }
    return 0;
}



@end
