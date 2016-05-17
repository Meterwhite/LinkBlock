//
//  NSValue+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSValue+LinkBlock.h"


@implementation NSObject(NSValueLinkBlock)
- (NSValue *(^)(NSArray *))valueSetPointToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSValue, NSValue);
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.origin = [_self CGPointValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}
- (void)setValueSetPointToViews:(NSValue *(^)(NSArray *))valueSetPointToViews{};

- (NSValue *(^)(NSArray *))valueSetSizeToViews
{
    return ^(NSArray* views){
        LinkError_REF_AUTO(NSValue, NSValue);
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.size = [_self CGSizeValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}
- (void)setValueSetSizeToViews:(NSValue *(^)(NSArray *))valueSetSizeToViews{};
@end