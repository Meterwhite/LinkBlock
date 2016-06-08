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
    return ^(NSString* key){
        @try {
            return [self valueForKey:key];
        }
        @catch (NSException *exception) {
#ifdef DEBUG
            NSLog(@"LinkBlock log:\n%@",exception);
#endif
            return (id)nil;
        }
    };
}
- (void)setValueForKeySafe:(id (^)(NSString *))valueGetSafe{};

- (NSObject *(^)(id ,NSString* ))setValueForKeySafe
{
    return ^(id value,NSString* key){
        @try {
            [self setValue:value forKey:key];
        }
        @catch (NSException *exception) {
#ifdef DEBUG
            NSLog(@"LinkBlock log:\n%@",exception);
#endif
            return self;
        }
        @finally {
            return self;
        }
    };
}
- (void)setSetValueForKeySafe:(NSObject *(^)(id value,NSString* key))valueSetSafe{};

- (id (^)(NSString *))valueForKeyPathSafe
{
    return ^(NSString* key){
        @try {
            return [self valueForKeyPath:key];
        }
        @catch (NSException *exception) {
#ifdef DEBUG
            NSLog(@"LinkBlock log:\n%@",exception);
#endif
            return (id)nil;
        }
    };
}
- (void)setValueForKeyPathSafe:(id (^)(NSString *))valuePathGetSafe{};

- (NSObject *(^)(id ,NSString* ))setValueForKeyPathSafe
{
    return ^(id value,NSString* key){
        @try {
            [self setValue:value forKeyPath:key];
        }
        @catch (NSException *exception) {
#ifdef DEBUG
            NSLog(@"LinkBlock log:\n%@",exception);
#endif
            return self;
        }
        @finally {
            return self;
        }
    };
}
- (void)setSetValueForKeyPathSafe:(NSObject *(^)(id value,NSString* key))valuePathSetSafe{};

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
    return ^(){
        return (NSObject*)[self copy];
    };
}
- (void)setObjCopy:(NSObject *(^)())objCopy{};

- (NSObject *(^)())objMutableCopy
{
    return ^(){
        return (NSObject*)[self mutableCopy];
    };
}
- (void)setObjMutableCopy:(NSObject *(^)())objMutableCopy{};

- (BOOL (^)(NSObject *))objIsEqual
{
    return ^(NSObject* obj){
        return [self isEqual:obj];
    };
}
- (void)setObjIsEqual:(BOOL (^)(NSObject *))objIsEqual{};

- (BOOL (^)( __unsafe_unretained Class))isKindOf
{
    return ^(Class classKind){
        if(!classKind)
            return NO;
        return [self isKindOfClass:classKind];
    };
}
- (void)setIsKindOf:(BOOL (^)(__unsafe_unretained Class))objIsKind{};

- (BOOL (^)(__unsafe_unretained Class))isSubClassOf
{
    return ^(Class classKind){
        if(!classKind)
            return NO;
        return [[self class] isSubclassOfClass:classKind];
    };
}
- (void)setIsSubClassOf:(BOOL (^)(__unsafe_unretained Class))isSubClassOf{};

- (NSObject* (^)(__unsafe_unretained Class))typeForceObj
{
    return ^(Class theClass){
        if(!theClass || ![self isKindOfClass:theClass]){
            return (NSObject*)[theClass new];
        }else{
            return self;
        }
    };
}
- (void)setTypeForceObj:(NSObject *(^)(__unsafe_unretained Class))typeForceObj{};

- (BOOL (^)(SEL))isRespondsSEL
{
    return ^(SEL theSEL){
        if(theSEL){
            if([self respondsToSelector:theSEL])
                return YES;
        }
        return NO;
    };
}
- (void)setIsRespondsSEL:(BOOL (^)(SEL))isResponseSEL{};


- (NSString *(^)())objToJsonString
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (NSString*)@"";
        }
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
- (void)setObjToJsonString:(NSString *(^)())objToJsonString{};

- (Class (^)())objClass
{
    return ^(){
        return [self class];
    };
}
- (void)setObjClass:(Class (^)())objClass{};

- (NSString *(^)())className
{
    return ^(){
        return NSStringFromClass(self.class);
    };
}
- (void)setClassName:(NSString *(^)())objClassName{};

- (NSString *(^)())superclassName
{
    return ^(){
        return NSStringFromClass(self.superclass);
    };
}
- (void)setSuperclassName:(NSString *(^)())superclassName{};

- (NSObject *(^)(id*))setTo
{
    return ^(id* toObject){
        LinkError_VAL_IF(NSObject){
            *toObject= nil;
        }else{
            *toObject= _self;
        }
        return _self;
    };
}
- (void)setSetTo:(NSObject *(^)(id*))setTo{};

- (NSObject *)newLink:(void (^)(NSObject *))aNewLin
{
    if(aNewLin){
        aNewLin(self);
    }
    return self;
}

- (NSObject *(^)())nslog
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (NSObject*)_self;
        }
        NSLog(@"%@",_self);
        return _self;
    };
}
- (void)setNslog:(NSObject *(^)())nslog{};

- (NSObject *(^)(NSString *))nslogTitle
{
    return ^(NSString* title){
        LinkError_VAL_IF(NSObject){
            return (NSObject*)_self;
        }
        NSLog(@"%@%@",title,_self);
        return _self;
    };
}
- (void)setNslogTitle:(NSObject *(^)(NSString *))nslogTitle{};

- (NSObject *(^)(NSString *))nslogValueForKey
{
    return ^(NSString* key){
        LinkError_VAL_IF(NSObject){
            return _self;
        }
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}
- (void)setNslogValueForKey:(NSObject *(^)(NSString *))nslogValueForKey{};

- (NSObject *(^)(NSString *))nslogValueForKeyPath
{
    return ^(NSString* key){
        LinkError_VAL_IF(NSObject){
            return _self;
        }
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}
- (void)setNslogValueForKeyPath:(NSObject *(^)(NSString *))nslogValueForKeyPath{};

- (id (^)())end
{
    return ^(){
        LinkError_VAL_IF(NSObject){
            return (id)nil;
        }
        return (id)_self;
    };
}
- (void)setEnd:(id(^)())end{};


- (id (^)(NSString *))valueForKey
{
    return ^(NSString* key){
        return [self valueForKey:key];
    };
}
- (void)setValueForKey:(id (^)(NSString *))valueForKey{};

- (NSObject *(^)(id, NSString* ))setValueForKey
{
    return ^(id value, NSString* key){
        [self setValue:value forKey:key];
        return self;
    };
}
- (void)setSetValueForKey:(NSObject *(^)(id, NSString *))setValueForKey{};

- (id (^)(NSString *))valueForKeyPath
{
    return ^(NSString* key){
        return [self valueForKeyPath:key];
    };
}
- (void)setValueForKeyPath:(id (^)(NSString *))valueForKeyPath{};

- (NSObject *(^)(id , NSString* ))setValueForKeyPath
{
    return ^(id value, NSString* key){
        [self setValue:value forKeyPath:key];
        return self;
    };
}
- (void)setSetValueForKeyPath:(NSObject *(^)(id, NSString *))setValueForKeyPath{};

- (NSObject *(^)(NSArray *))objBeforeInArr
{
    return ^(NSArray* inArr){
        LinkError_REF_AUTO(NSObject, NSObject);
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx-1)>0){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return (NSObject*)nil;
        }
    };
}
- (void)setObjBeforeInArr:(NSObject *(^)(NSArray *))objBeforeInArr{};

- (NSObject *(^)(NSArray *))objNextInArr
{
    return ^(NSArray* inArr){
        LinkError_REF_AUTO(NSObject, NSObject);
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx+1) <inArr.count){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return (NSObject*)nil;
        }
    };
}
- (void)setObjNextInArr:(NSObject *(^)(NSArray *))objNextInArr{};

- (NSArray *(^)(NSDictionary *))objKeysInDict
{
    return ^(NSDictionary* inDict){
        LinkError_REF_AUTO(NSArray, NSObject);
        return [inDict allKeysForObject:_self];
    };
}
- (void)setObjKeysInDict:(NSArray *(^)(NSDictionary *))objKeysInDict{};

#pragma mark - 类型转换
- (NSString *(^)())typeIsNSString
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSString:(NSString *(^)())typeIsNSString{};

- (NSMutableString *(^)())typeIsNSMutableString
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSMutableString:(NSMutableString *(^)())typeIsNSMutableString{};

- (NSArray *(^)())typeIsNSArray
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSArray:(NSArray *(^)())typeIsNSArray{};

- (NSMutableArray *(^)())typeIsNSMutableArray
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSMutableArray:(NSMutableArray *(^)())typeIsNSMutableArray{};

- (NSDictionary *(^)())typeIsNSDictionary
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSDictionary:(NSDictionary *(^)())typeIsNSDictionary{};

- (NSMutableDictionary *(^)())typeIsNSMutableDictionary
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSMutableDictionary:(NSMutableDictionary *(^)())typeIsNSMutableDictionary{};

- (NSAttributedString *(^)())typeIsNSAttributedString
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSAttributedString:(NSAttributedString *(^)())typeIsNSAttributedString{};

- (NSMutableAttributedString *(^)())typeIsNSMutableAttributedString
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSMutableAttributedString:(NSMutableAttributedString *(^)())typeIsNSMutableAttributedString{};

- (NSURL *(^)())typeIsNSURL
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSURL:(NSURL *(^)())typeIsNSURL{};

- (NSUserDefaults *(^)())typeIsNSUserDefaults
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSUserDefaults:(NSUserDefaults *(^)())typeIsNSUserDefaults{};

- (UIView *(^)())typeIsUIView
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIView:(UIView *(^)())typeIsUIView{};

- (UILabel *(^)())typeIsUILabel
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUILabel:(UILabel *(^)())typeIsUILabel{};

- (UIControl *(^)())typeIsUIControl
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIControl:(UIControl *(^)())typeIsUIControl{};

- (UIButton *(^)())typeIsUIButton
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIButton:(UIButton *(^)())typeIsUIButton{};

- (UIScrollView *(^)())typeIsUIScrollView
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIScrollView:(UIScrollView *(^)())typeIsUIScrollView{};

- (UIImage *(^)())typeIsUIImage
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIImage:(UIImage *(^)())typeIsUIImage{};

- (UIColor *(^)())typeIsUIColor
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIColor:(UIColor *(^)())typeIsUIColor{};

- (UIViewController *(^)())typeIsUIViewController
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIViewController:(UIViewController *(^)())typeIsUIViewController{};

- (UIImageView *(^)())typeIsUIImageView
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUIImageView:(UIImageView *(^)())typeIsUIImageView{};

- (UITableView *(^)())typeIsUITableView
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUITableView:(UITableView *(^)())typeIsUITableView{};

- (NSNumber *(^)())typeIsNSNumber
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSNumber:(NSNumber *(^)())typeIsNSNumber{};

- (NSValue *(^)())typeIsNSValue
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSValue:(NSValue *(^)())typeIsNSValue{};

- (UITextField *(^)())typeIsUITextField
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUITextField:(UITextField *(^)())typeIsUITextField{};

- (UITextView *(^)())typeIsUITextView
{
    return ^(){return (id)self;};
}
- (void)setTypeIsUITextView:(UITextView *(^)())typeIsUITextView{};

- (NSDate *(^)())typeIsNSDate
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSDate:(NSDate *(^)())typeIsNSDate{};

- (NSData *(^)())typeIsNSData
{
    return ^(){return (id)self;};
}
- (void)setTypeIsNSData:(NSData *(^)())typeIsNSData{};

@end
