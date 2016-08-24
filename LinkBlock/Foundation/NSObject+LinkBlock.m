//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <objc/runtime.h>
#import "LinkBlock.h"

@implementation NSObject(LinkBlock)

- (id (^)(NSString *))valueForKeySafe
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(valueForKeySafe,key)
        @try {
            return [_self valueForKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
            return nil;
        }
    };
}

- (NSObject *(^)(id ,NSString* ))setValueForKeySafe
{
    return ^id(id value,NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(setValueForKeySafe,value,key)
        @try {
            [_self setValue:value forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
            return _self;
        }
        @finally {
            return _self;
        }
    };
}

- (id (^)(NSString *))valueForKeyPathSafe
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(valueForKeyPathSafe,key)
        @try {
            return [_self valueForKeyPath:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
            return (id)nil;
        }
    };
}

- (NSObject *(^)(id ,NSString* ))setValueForKeyPathSafe
{
    return ^id(id value,NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(setValueForKeyPathSafe,value,key)
        @try {
            [_self setValue:value forKeyPath:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
            return _self;
        }
        @finally {
            return _self;
        }
    };
}


+ (BOOL)classContainProperty:(NSString*)property
{
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    for(i=0 ; i< outCount; i++)
        if([property isEqualToString:[NSString stringWithUTF8String:property_getName(properties[i])]])
            return YES;
    
    return NO;
}
+ (BOOL)classContainIvar:(NSString*)ivarName
{
    unsigned int outCout ,i ;
    Ivar* ivarList = class_copyIvarList([self class], &outCout);
    for(i=0;i< outCout;i++)
        if([ivarName isEqualToString:[NSString stringWithUTF8String:ivar_getName(ivarList[i])]])
            return YES;
    
    return NO;
}


+ (NSArray*)classGetIvarList
{
    unsigned int outCount , i;
    Ivar* ivarList = class_copyIvarList([self class], &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for(i=0 ; i< outCount; i++)
        [reMArr addObject:[NSString stringWithUTF8String:ivar_getName(ivarList[i])]];
    
    return (NSArray*)[reMArr copy];
}
+ (NSArray*)classGetPropertyList
{
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray* reMArr = [NSMutableArray new];
    
    for(i=0 ; i< outCount; i++)
        [reMArr addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
    
    return (NSArray*)[reMArr copy];
}

+ (NSArray*)classGetClassMethodList
{
    unsigned int outCount;
    Method* methods = class_copyMethodList(object_getClass(self), &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for (int i = 0; i < outCount; i++) {
        SEL name = method_getName(methods[i]);
        NSString* methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [reMArr addObject:methodName];
    }
    return (NSArray*)[reMArr copy];
}

- (NSArray*)objGetInstanceMethodList
{
    unsigned int outCount;
    Method* methods = class_copyMethodList([self class], &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for (int i = 0; i < outCount; i++) {
        SEL name = method_getName(methods[i]);
        NSString* methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [reMArr addObject:methodName];
    }
    return (NSArray*)[reMArr copy];
}

+ (NSArray*)classGetProtocolList
{
    unsigned int outCount;
    NSMutableArray* reMArr = [NSMutableArray new];
    
    __unsafe_unretained Protocol **protocols = class_copyProtocolList(self, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        NSString* protocolName= [NSString stringWithCString:protocol_getName(protocols[i]) encoding:NSUTF8StringEncoding];
        [reMArr addObject:protocolName];
    }
    
    return (NSArray*)[reMArr copy];
}

- (NSArray*)objGetAllMethodList
{
    NSMutableArray* reMArr = [NSMutableArray new];
    
    NSArray<NSString*>* classMethod = [[self class] classGetClassMethodList];
    [classMethod enumerateObjectsUsingBlock:^(NSString * _Nonnull classMethodName, NSUInteger idx, BOOL * _Nonnull stop) {
        [reMArr addObject: [NSString stringWithFormat:@"+ %@",classMethodName]];
    }];
    
    NSArray<NSString*>* instanceMehod = [self objGetInstanceMethodList];
    [instanceMehod enumerateObjectsUsingBlock:^(NSString * _Nonnull instanceMethodName, NSUInteger idx, BOOL * _Nonnull stop) {
        [reMArr addObject: [NSString stringWithFormat:@"- %@",instanceMethodName]];
    }];
    
    return (NSArray*)[reMArr copy];
}

- (NSObject *(^)())objCopy
{
    return ^id(){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objCopy)
        return [_self copy];
    };
}

- (NSObject *(^)())objMutableCopy
{
    return ^id(){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objMutableCopy)
        return (NSObject*)[_self mutableCopy];
    };
}

- (NSObject *(^)())objMutableCopyDeep
{
    return ^id(){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objMutableCopyDeep)
        
        if([_self isKindOfClass:[NSString class]]&&![_self isMemberOfClass:NSClassFromString(@"__NSCFString")]){//不可变字符串
            
            return [_self mutableCopy];
        }else if ([_self isKindOfClass:[NSArray class]]&&
                  ![_self isKindOfClass:[NSMutableArray class]]){//不可变数组
            
            NSMutableArray<NSObject*>* reSelf = [_self mutableCopy];
            [((NSArray*)_self) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if(([reSelf[idx] isKindOfClass:[NSString class]]&&![reSelf[idx] isMemberOfClass:NSClassFromString(@"__NSCFString")])||
                   ([reSelf[idx] isKindOfClass:[NSArray class]]&&![reSelf[idx] isKindOfClass:[NSMutableArray class]])||
                   ([reSelf[idx] isKindOfClass:[NSDictionary class]]&&![reSelf[idx] isKindOfClass:[NSMutableDictionary class]])){
                    
                    reSelf[idx] =  [reSelf[idx] mutableCopy];
                }
            }];
            return reSelf;
        }else if ([_self isKindOfClass:[NSDictionary class]]&&
                  ![_self isKindOfClass:[NSMutableDictionary class]]){//不可变字典
            
            NSMutableDictionary* reSelf = [_self mutableCopy];
            [(NSDictionary*)_self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSObject*  _Nonnull obj, BOOL * _Nonnull stop) {
                
                if(([obj isKindOfClass:[NSString class]]&&![obj isMemberOfClass:NSClassFromString(@"__NSCFString")])||
                   ([obj isKindOfClass:[NSArray class]]&&![obj isKindOfClass:[NSMutableArray class]])||
                   ([obj isKindOfClass:[NSDictionary class]]&&![obj isKindOfClass:[NSMutableDictionary class]])){
                    
                    [reSelf setObject:obj.objMutableCopyDeep() forKey:key];
                }
            }];
            return reSelf;
        }
        return _self;
    };
}

- (BOOL (^)(NSObject *))objIsEqual
{
    return ^(NSObject* obj){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsEqual,obj)
        return [_self isEqual:obj];
    };
}

- (BOOL (^)( __unsafe_unretained Class))isKindOf
{
    return ^(Class classKind){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(isKindOf,classKind)
        if(!classKind)
            return NO;
        return [_self isKindOfClass:classKind];
    };
}

- (BOOL (^)(__unsafe_unretained Class))isSubClassOf
{
    return ^(Class classKind){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(isSubClassOf,classKind)
        if(!classKind)
            return NO;
        return [[_self class] isSubclassOfClass:classKind];
    };
}

- (NSObject* (^)(__unsafe_unretained Class))objMustType
{
    return ^id(Class theClass){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objMustType,theClass)
        if(!theClass || ![_self isKindOfClass:theClass]){
            return [theClass new];
        }else{
            return _self;
        }
    };
}

- (BOOL (^)(SEL))isRespondsSEL
{
    return ^(SEL theSEL){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(isRespondsSEL,theSEL)
        if(theSEL){
            if([_self respondsToSelector:theSEL])
                return YES;
        }
        return NO;
    };
}



- (NSString *(^)())objToJsonString
{
    return ^id(){
        LinkHandle_REF(NSString, NSObject)
        LinkGroupHandle_REF(objToJsonString)
        if(![NSJSONSerialization isValidJSONObject:_self])
            return @"\"\"";
        NSError* error= nil;
        NSData * JSONData = [NSJSONSerialization dataWithJSONObject:_self
                                                            options:kNilOptions
                                                              error:&error];
        if(error)
            return @"\"\"";
        return [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    };
}

- (Class (^)())objClass
{
    return ^id(){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(objClass)
        return [_self class];
    };
}

- (NSString *(^)())className
{
    return ^id(){
        LinkHandle_REF(NSString, NSObject)
        LinkGroupHandle_REF(className)
        return NSStringFromClass(_self.class);
    };
}

- (NSString *(^)())superclassName
{
    return ^id(){
        LinkHandle_REF(NSString, NSObject)
        LinkGroupHandle_REF(superclassName)
        return NSStringFromClass(_self.superclass);
    };
}

- (NSObject *(^)(id*))setTo
{
    return ^id(id* toObject){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(setTo,toObject)
        *toObject= _self;
        return _self;
    };
}

- (NSObject *)newLink:(void (^)(NSObject *))aNewLin
{
    LinkHandle_REF(NSObject, NSObject)
    if(aNewLin){
        aNewLin(_self);
    }
    return _self;
}

- (NSObject *(^)(id))linkAnd
{
    return ^id(id obj){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroup* group;
        if([self isKindOfClass:[LinkGroup class]]){
            group = (id)_self;
            if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] = @(count+1);
                [group.linkObjects insertObject:obj atIndex:count];
            }else{
                [group.linkObjects addObject:obj];
            }
            return group;
        }
        group = [LinkGroup groupWithObjs:_self,obj,nil];
        return group;
    };
}

- (NSObject *(^)(NSUInteger idx))linkOut
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSObject, NSObject)
        if([_self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (id)_self;
            if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                if(idx > count-1) return group;
                group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] = @(count-1);
                id forOut = group.linkObjects[idx];
                [group.linkObjects removeObject:forOut];
            }else{
                if(idx>group.linkObjects.count-1) return group;
                [group.linkObjects removeObjectAtIndex:idx];
            }
            return group;
        }
        return _self;
    };
}

- (NSObject *(^)(NSUInteger))linkAt
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSObject, NSObject)
        if([_self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (id)_self;
            if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                if(idx > count-1) return group;
                return group.linkObjects[idx];
            }else{
                if(idx>group.linkObjects.count-1) return group;
                return group.linkObjects[idx];
            }
        }
        return _self;
    };
}

- (NSObject *(^)(NSUInteger))linkLoop
{
    return ^id(NSUInteger count){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroup* group;
        if([self isKindOfClass:[LinkGroup class]]){
            group = (id)_self;
            group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] = @(group.linkObjects.count);
            NSArray* copyObjs = [group.linkObjects copy];
            //暴力复制
            for (int i=0; i<count; i++) {
                [group.linkObjects addObject:copyObjs];
            }
            return group;
        }
        //新Loop
        group = [LinkGroup group];
        group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] = @(1);
        for (int i=0; i<count; i++) {
            [group.linkObjects addObject:_self];
        }
        return group;
    };
}

- (NSObject *(^)())nslog
{
    return ^id(){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(nslog)
        NSLog(@"%@",_self);
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogTitle
{
    return ^id(NSString* title){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(nslogTitle,title)
        NSLog(@"%@%@",title,_self);
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogValueForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(nslogValueForKey,key)
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogValueForKeyPath
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(nslogValueForKeyPath,key)
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}

- (id (^)())end
{
    return ^id(){
        
        if([self isKindOfClass:[LinkInfo class]]){
            if([self isKindOfClass:[LinkError class]]){
                
                ((LinkError*)self).throwCount++;
                NSLog(@"%@",[self description]);
                return nil;
            }else if([self isKindOfClass:[LinkGroup class]]){
                
                return [((LinkGroup*)self).linkObjects firstObject];
            }
        }
        return self;
    };
}

- (NSArray *(^)())ends
{
    return ^id(){
        
        if([self isKindOfClass:[LinkInfo class]]){
            if([self isKindOfClass:[LinkError class]]){
                
                ((LinkError*)self).throwCount++;
                NSLog(@"%@",[self description]);
                return nil;
            }else if([self isKindOfClass:[LinkGroup class]]){
                LinkGroup* group = (id)self;
                if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                    NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                    [group.linkObjects setArray:[group.linkObjects subarrayWithRange:NSMakeRange(0, count)]];
                }
                return [group.linkObjects copy];
            }
        }
        return self;
    };
}

- (id (^)(NSUInteger))endsAt
{
    return ^id(NSUInteger idx){
        
        if([self isKindOfClass:[LinkInfo class]]){
            if([self isKindOfClass:[LinkError class]]){
                
                ((LinkError*)self).throwCount++;
                NSLog(@"%@",[self description]);
                return nil;
            }else if([self isKindOfClass:[LinkGroup class]]){
                LinkGroup* group = (id)self;
                if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                    NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                    [group.linkObjects setArray:[group.linkObjects subarrayWithRange:NSMakeRange(0, count)]];
                }
                if(idx < group.linkObjects.count)
                    return group.linkObjects[idx];
                return nil;
            }
        }
        return self;
    };
}

- (id (^)(NSString *))valueForKey
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(valueForKey,key)
        return [_self valueForKey:key];
    };
}

- (NSObject *(^)(id, NSString* ))setValueForKey
{
    return ^id(id value, NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(setValueForKey,value,key)
        [_self setValue:value forKey:key];
        return _self;
    };
}

- (id (^)(NSString *))valueForKeyPath
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(valueForKeyPath,key)
        return [_self valueForKeyPath:key];
    };
}

- (NSObject *(^)(id , NSString* ))setValueForKeyPath
{
    return ^id(id value, NSString* key){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(setValueForKeyPath,value,key)
        [_self setValue:value forKeyPath:key];
        return self;
    };
}

- (NSObject *(^)(NSArray *))objBeforeInArr
{
    return ^id(NSArray* inArr){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objBeforeInArr,inArr)
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx-1)>0){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return (NSObject*)nil;
        }
    };
}

- (NSObject *(^)(NSArray *))objNextInArr
{
    return ^id(NSArray* inArr){
        LinkHandle_REF(NSObject, NSObject)
        LinkGroupHandle_REF(objNextInArr,inArr)
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx+1) <inArr.count){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return (NSObject*)nil;
        }
    };
}

- (NSArray *(^)(NSDictionary *))objKeysInDict
{
    return ^id(NSDictionary* inDict){
        LinkHandle_REF(NSArray, NSObject)
        LinkGroupHandle_REF(objKeysInDict,inDict)
        return [inDict allKeysForObject:_self];
    };
}


#pragma mark - 类型转换

#ifndef Link_Type_ReturnSelf 
#define Link_Type_ReturnSelf return ^id(){return self;};
#endif
- (NSString *(^)())typeIsNSString
{
    Link_Type_ReturnSelf
}

- (NSMutableString *(^)())typeIsNSMutableString
{
    Link_Type_ReturnSelf
}

- (NSArray *(^)())typeIsNSArray
{
    Link_Type_ReturnSelf
}

- (NSMutableArray *(^)())typeIsNSMutableArray
{
    Link_Type_ReturnSelf
}

- (NSDictionary *(^)())typeIsNSDictionary
{
    Link_Type_ReturnSelf
}

- (NSMutableDictionary *(^)())typeIsNSMutableDictionary
{
    Link_Type_ReturnSelf
}

- (NSAttributedString *(^)())typeIsNSAttributedString
{
    Link_Type_ReturnSelf
}

- (NSMutableAttributedString *(^)())typeIsNSMutableAttributedString
{
    Link_Type_ReturnSelf
}

- (NSURL *(^)())typeIsNSURL
{
    Link_Type_ReturnSelf
}

- (NSUserDefaults *(^)())typeIsNSUserDefaults
{
    Link_Type_ReturnSelf
}

- (UIView *(^)())typeIsUIView
{
    Link_Type_ReturnSelf
}

- (UILabel *(^)())typeIsUILabel
{
    Link_Type_ReturnSelf
}

- (UIControl *(^)())typeIsUIControl
{
    Link_Type_ReturnSelf
}

- (UIButton *(^)())typeIsUIButton
{
    Link_Type_ReturnSelf
}

- (UIScrollView *(^)())typeIsUIScrollView
{
    Link_Type_ReturnSelf
}

- (UIImage *(^)())typeIsUIImage
{
    Link_Type_ReturnSelf
}

- (UIColor *(^)())typeIsUIColor
{
    Link_Type_ReturnSelf
}

- (UIViewController *(^)())typeIsUIViewController
{
    Link_Type_ReturnSelf
}

- (UIImageView *(^)())typeIsUIImageView
{
    Link_Type_ReturnSelf
}

- (UITableView *(^)())typeIsUITableView
{
    Link_Type_ReturnSelf
}

- (NSNumber *(^)())typeIsNSNumber
{
    Link_Type_ReturnSelf
}

- (NSValue *(^)())typeIsNSValue
{
    Link_Type_ReturnSelf
}

- (UITextField *(^)())typeIsUITextField
{
    Link_Type_ReturnSelf
}

- (UITextView *(^)())typeIsUITextView
{
    Link_Type_ReturnSelf
}

- (NSDate *(^)())typeIsNSDate
{
    Link_Type_ReturnSelf
}

- (NSData *(^)())typeIsNSData
{
    Link_Type_ReturnSelf
}


@end
