//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSObject+LinkBlock.h"
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

+ (BOOL)currentClassContainProperty:(NSString*)property
{
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    for(i=0 ; i< outCount; i++)
        if([property isEqualToString:[NSString stringWithUTF8String:property_getName(properties[i])]])
            return YES;
    
    return NO;
}
+ (BOOL)currentClassContainIvar:(NSString*)ivarName
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
        if(!theClass || !self.isKindOf(theClass)){
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

- (NSObject *(^)(id*))set
{
    return ^(id* toValue){
        LinkError_VAL_IF(NSObject){
            *toValue= nil;
        }else{
            *toValue= _self;
        }
        return _self;
    };
}
- (void)setSet:(NSObject *(^)(id*))blockValueTo{};


- (NSObject *(^)())nslog
{
    return ^(){
#ifdef DEBUG
        LinkError_VAL_IF(NSObject){
            return (NSObject*)_self;
        }
        NSLog(@"%@",_self);
#endif
        return _self;
    };
}
- (void)setNslog:(NSObject *(^)())nslog{};

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

#pragma mark - quick use type
- (NSString *(^)())typeIsNSString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSString:(NSString *(^)())typeIsNSString{};

- (NSMutableString *(^)())typeIsNSMutableString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableString:(NSMutableString *(^)())typeIsNSMutableString{};

- (NSArray *(^)())typeIsNSArray
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSArray:(NSArray *(^)())typeIsNSArray{};

- (NSMutableArray *(^)())typeIsNSMutableArray
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableArray:(NSMutableArray *(^)())typeIsNSMutableArray{};

- (NSDictionary *(^)())typeIsNSDictionary
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSDictionary:(NSDictionary *(^)())typeIsNSDictionary{};

- (NSMutableDictionary *(^)())typeIsNSMutableDictionary
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableDictionary:(NSMutableDictionary *(^)())typeIsNSMutableDictionary{};

- (NSAttributedString *(^)())typeIsNSAttributedString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSAttributedString:(NSAttributedString *(^)())typeIsNSAttributedString{};

- (NSMutableAttributedString *(^)())typeIsNSMutableAttributedString
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSMutableAttributedString:(NSMutableAttributedString *(^)())typeIsNSMutableAttributedString{};

- (NSURL *(^)())typeIsNSURL
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSURL:(NSURL *(^)())typeIsNSURL{};

- (NSUserDefaults *(^)())typeIsNSUserDefaults
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsNSUserDefaults:(NSUserDefaults *(^)())typeIsNSUserDefaults{};

- (UIView *(^)())typeIsUIView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIView:(UIView *(^)())typeIsUIView{};

- (UILabel *(^)())typeIsUILabel
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUILabel:(UILabel *(^)())typeIsUILabel{};

- (UIControl *(^)())typeIsUIControl
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIControl:(UIControl *(^)())typeIsUIControl{};

- (UIButton *(^)())typeIsUIButton
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIButton:(UIButton *(^)())typeIsUIButton{};

- (UIScrollView *(^)())typeIsUIScrollView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIScrollView:(UIScrollView *(^)())typeIsUIScrollView{};

- (UIImage *(^)())typeIsUIImage
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIImage:(UIImage *(^)())typeIsUIImage{};

- (UIColor *(^)())typeIsUIColor
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIColor:(UIColor *(^)())typeIsUIColor{};

- (UIViewController *(^)())typeIsUIViewController
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIViewController:(UIViewController *(^)())typeIsUIViewController{};

- (UIImageView *(^)())typeIsUIImageView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUIImageView:(UIImageView *(^)())typeIsUIImageView{};

- (UITableView *(^)())typeIsUITableView
{
    return ^(){
        return (id)self;
    };
}
- (void)setTypeIsUITableView:(UITableView *(^)())typeIsUITableView{};

#pragma mark - extension for func

static const char* blockName = "quxingyiHandsome";
- (void)objBlockSet:(NSString*)name block:(id(^)())executeBlock
{
    if([name isKindOfClass:[NSString class]] && executeBlock)
        [self novoGetBlocksDict][name]= executeBlock;
}
- (id(^)())objBlockGet:(NSString*)name
{
    if(![name isKindOfClass:[NSString class]])
        return (id)^(){return nil;};
    
    id(^block)() = [self novoGetBlocksDict][name];
    if(!block)
        return (id)^(){return nil;};
    
    return (id)block;
}
- (void)objBlockRemove:(NSString*)name
{
    if([name isKindOfClass:[NSString class]])
        [[self novoGetBlocksDict] removeObjectForKey:name];
}
- (id)objBlockExecute:(NSString *)name
{
    if(![name isKindOfClass:[NSString class]])
        return (id)nil;
    id(^block)() = [self novoGetBlocksDict][name];
    if(block)
        return block();
    return (id)nil;
}

- (NSMutableDictionary* )novoGetBlocksDict
{
    NSMutableDictionary *privateDict= objc_getAssociatedObject(self, &blockName);
    if(!privateDict ||
       ![privateDict isKindOfClass:([NSMutableDictionary class])]){
        privateDict= [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &blockName, privateDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return privateDict;
}

#pragma mark - exteion for uicontrol

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
