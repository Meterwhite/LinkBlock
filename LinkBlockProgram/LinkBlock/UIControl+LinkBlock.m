//
//  UIControl+LinkBlock.m
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//
#import "LinkBlock.h"
#import "UIControl+LinkBlock.h"
#import <objc/runtime.h>

@implementation NSObject(UIControlLinkBlock)


static const char * privateDictName = "quxingyi";//私有字典名

- (void)controlAddTarget:(NSObject*)target
      forControlEvents:(UIControlEvents)controlEvents
             withBlock:(void (^)(UIControlEvents event))executeBlock
{
    LinkError_VAL_IF(UIControl){
        return;
    }
    
    if(executeBlock){
        [_self private__PrivateDictSetTarget:target event:controlEvents withBlock:executeBlock];
        [_self addTarget:target action:@selector(novoExecuteEventForSender:) forControlEvents:controlEvents];
    }
    
}

-(void)controlRemoveTarget:(id)target
        forControlEvents:(UIControlEvents)controlEvents
               withBlock:(void (^)(UIControlEvents event))executeBlock
{
    LinkError_VAL_IF(UIControl){
        return;
    }
    [_self private__PrivateDictRemoveTarget:target event:controlEvents withBlock:executeBlock];
}


#pragma mark - 私有方法
- (NSMutableDictionary *)private__GetPrivateDict
{
    LinkError_VAL_IF(UIControl){
        return (NSMutableDictionary*)nil;
    }
    NSMutableDictionary *privateDict= objc_getAssociatedObject(_self, &privateDictName);
    if(!privateDict ||
       ![privateDict isKindOfClass:([NSMutableDictionary class])]){//检查target的私有字典是否存在，不存在则创建
        privateDict= [NSMutableDictionary dictionary];
        objc_setAssociatedObject(_self, &privateDictName, privateDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return privateDict;
}

- (void)private__PrivateDictSetTarget:(id)target
                                event:(UIControlEvents)event
                            withBlock:(void(^)(UIControlEvents event))executeBlock
{
    LinkError_VAL_IF(UIControl){
        return;
    }
    NSMutableDictionary* privateDict= [_self private__GetPrivateDict];
    NSMutableDictionary* targetDict = privateDict[target];
    if(![targetDict isKindOfClass:[NSMutableDictionary class]]){
        targetDict = [NSMutableDictionary dictionary];
        NSNumber* targetKey = [NSNumber numberWithUnsignedLongLong: [target hash]];
        privateDict[targetKey] = targetDict;
        
    }
    
    NSNumber* eventKey = [NSNumber numberWithUnsignedLongLong:event];
    NSMutableArray* eventsArr = targetDict[eventKey];
    if(![eventsArr isKindOfClass:[NSMutableArray class]]){
        eventsArr = [NSMutableArray array];
        targetDict[eventKey] = eventsArr;
    }
    
    if(![eventsArr containsObject:executeBlock])
        [eventsArr addObject:executeBlock];

}

- (void)private__PrivateDictRemoveTarget:(id)target
                                   event:(UIControlEvents)event
                               withBlock:(void(^)(UIControlEvents event))executeBlock
{
    LinkError_VAL_IF(UIControl){
        return;
    }
    NSMutableDictionary* privateDict= [_self private__GetPrivateDict];
    NSNumber* targetKey = [NSNumber numberWithUnsignedLongLong: [target hash]];
    NSMutableDictionary* targetDict = privateDict[targetKey];
    if(![targetDict isKindOfClass:[NSMutableDictionary class]])
        return;
    
    NSNumber* eventKey = [NSNumber numberWithUnsignedLongLong:event];
    NSMutableArray* eventsArr = targetDict[eventKey];
    if(![eventsArr isKindOfClass:[NSMutableArray class]])
        return;
    if(executeBlock){
        [eventsArr removeObject:executeBlock];
    }else{
        [eventsArr removeAllObjects];
    }
    
}


@end


