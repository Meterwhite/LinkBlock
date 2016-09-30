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
        return (id)self.linkEnd;
    };
}
- (id (^)())ends
{
    return ^id(){
        return (id)self.linkEnds;
    };
}
- (id (^)(NSUInteger idx))endsAt
{
    return ^id(NSUInteger idx){
        return (id)self.linkEndsAt(idx);
    };
}
@end
