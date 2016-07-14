//
//  LinkError.m
//
//  Created by NOVO on 15/8/20.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation LinkError
- (NSString *)description
{
    return [NSString stringWithFormat:@"【LinkError】调用方法\"%@\"时需要类型\"%@\"而不是类型\"%@\"，在链条的倒数第\"%ld\"处发生",self.inFunc,self.needClass,self.errorClass,(long)(self.throwCount+1)];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"LinkError:throwCount=%ld,needClass=%@,errorClass=%@,inFunc=%@",(long)self.throwCount,self.needClass,self.errorClass,self.inFunc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _needClass = @"ObjectCType";
        _errorClass = @"nil";
        _inFunc = @"linkObj";
    }
    return self;
}
@end
