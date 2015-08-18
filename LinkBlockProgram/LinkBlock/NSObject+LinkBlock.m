//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(LinkBlock)
- (NSObject *(^)())blockCopy
{
    return ^(){
        return [self copy];
    };
}
- (NSObject *(^)())blockMutableCopy
{
    return ^(){
        return [self mutableCopy];
    };
}
- (BOOL (^)(NSObject *))blockIsEqual
{
    return ^(NSObject* obj){
        return [self isEqual:obj];
    };
}

- (BOOL (^)( __unsafe_unretained Class))blockIsKindOf
{
    return ^(Class classKind){
        return [self isKindOfClass:classKind];
    };
}
- (BOOL (^)(__unsafe_unretained Class))blockIsSubClassOf
{
    return ^(Class classKind){
        return [[self class] isSubclassOfClass:classKind];
    };
}

- (NSObject* (^)(__unsafe_unretained Class))blockTypeKeep
{
    return ^(Class theClass){
        if(!self.blockIsKindOf(theClass)){
            return (NSObject*)[theClass new];
        }else{
            return self;
        }
    };
}

- (BOOL (^)(SEL))blockIsResponseSEL
{
    return ^(SEL theSEL){
        if(theSEL){
            if([self respondsToSelector:theSEL])
                return YES;
        }
        return NO;
    };
}


- (NSString *(^)())blockToJsonString
{
    return ^(){
        NSError* error= nil;
        NSData * JSONData = [NSJSONSerialization dataWithJSONObject:self
                                                            options:kNilOptions
                                                              error:&error];
        if(error)
            return @"\"\"";
        return [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    };
}

- (Class (^)())blockClass
{
    return ^(){
        return [self class];
    };
}
- (NSString *(^)())blockClassName
{
    return ^(){
        return NSStringFromClass([self class]);
    };
}

- (void)setBlockCopy:(NSObject *(^)())blockCopy{};
- (void)setBlockMutableCopy:(NSObject *(^)())blockMutableCopy{};
- (void)setBlockIsEqual:(BOOL (^)(NSObject *))blockIsEqual{};
- (void)setBlockTypeKeep:(NSObject* (^)(__unsafe_unretained Class))blockTypeKeep{};
- (void)setBlockIsResponseSEL:(BOOL (^)(SEL))blockIsResponseSEL{};
- (void)setBlockIsKindOf:(BOOL (^)( __unsafe_unretained Class))blockIsKindOf{}
- (void)setBlockIsSubClassOf:(BOOL (^)(__unsafe_unretained Class))blockIsSubClass{};
- (void)setBlockToJsonString:(NSString *(^)())blockToJsonString{};
- (void)setBlockClass:(Class (^)())blockClass{};
- (void)setBlockClassName:(NSString *(^)())blockClassName{};


static const char * privateDictName = "quxingyiBlock";//私有字典名



/** 触发扩展字典中的的UIControl的事件，不应直接调用 */
- (void)novoExecuteEventForSender:(id)sender
{
    if(![((NSObject*)sender) isKindOfClass:[UIControl class]])
        return;
    
    NSMutableDictionary *privateDict= [(UIControl *)(sender) private__GetPrivateDict];
    if(![privateDict isKindOfClass:[NSMutableDictionary class]])
        return;
    
    NSNumber* targetKey = [NSNumber numberWithUnsignedLongLong: [self hash]];
    NSMutableDictionary *targetDict= privateDict[targetKey];
    if(![targetDict isKindOfClass: [NSMutableDictionary class]])
        return;

    [targetDict enumerateKeysAndObjectsUsingBlock:^(NSNumber* eventName, NSMutableArray* blocks , BOOL *stop) {
        UIControlEvents event= [eventName unsignedIntValue];
        [blocks enumerateObjectsUsingBlock:^(void(^block)(UIControlEvents), NSUInteger idx, BOOL *stop) {
            block(event);
        }];
    }];
}
@end
