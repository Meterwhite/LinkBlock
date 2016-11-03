//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <objc/runtime.h>
#import <CoreData/CoreData.h>
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
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(setValueForKeySafe,value,key)
        @try {
            [_self setValue:value forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
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
            return nil;
        }
    };
}

- (NSObject *(^)(id ,NSString* ))setValueForKeyPathSafe
{
    return ^id(id value,NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(setValueForKeyPathSafe,value,key)
        @try {
            [_self setValue:value forKeyPath:key];
        }
        @catch (NSException *exception) {
            NSLog(@"LinkBlock log:\n%@",exception);
        }
        @finally {
            return _self;
        }
    };
}

+ (BOOL)classIsFoundation
{
    //root
    if(self == [NSObject class] || self == [NSManagedObject class]) return YES;
    //base
    if([self isSubclassOfClass:[NSArray class]]) return YES;
    if([self isSubclassOfClass:[NSDictionary class]]) return YES;
    if([self isSubclassOfClass:[NSValue class]]) return YES;
    if([self isSubclassOfClass:[NSString class]]) return YES;
    if([self isSubclassOfClass:[NSDate class]]) return YES;
    if([self isSubclassOfClass:[NSData class]]) return YES;
    if([self isSubclassOfClass:[NSAttributedString class]]) return YES;
    if([self isSubclassOfClass:[NSURL class]]) return YES;
    if([self isSubclassOfClass:[NSError class]]) return YES;
    if([self isSubclassOfClass:[NSSet class] ]) return YES;
    if([self isSubclassOfClass:[NSPredicate class]]) return YES;
    if([self isSubclassOfClass:[NSCoder class] ]) return YES;
    if([self isSubclassOfClass:[NSFormatter class]]) return YES;
    if([self isSubclassOfClass:[NSMapTable class]]) return YES;
    if([self isSubclassOfClass:[NSHashTable class]]) return YES;
    if([self isSubclassOfClass:NSClassFromString(@"NSBlock")]) return YES;
    if(self == [NSNull class]) return YES;
    
    //other
    if(self == [NSBundle class]) return YES;
    if(self == [NSCalendar class]) return YES;
    if(self == [NSCharacterSet class]) return YES;
    if(self == [NSPersonNameComponents class]) return YES;
    if(self == [NSEnumerator class]) return YES;
    if(self == [NSExpression class]) return YES;
    if(self == [NSFileHandle class]) return YES;
    if(self == [NSFileManager class]) return YES;
    if(self == [NSHTTPCookie class]) return YES;
    if(self == [NSHTTPCookieStorage class]) return YES;
    if(self == [NSIndexPath class]) return YES;
    if(self == [NSIndexSet class]) return YES;
    if(self == [NSInvocation class]) return YES;
    if(self == [NSJSONSerialization class]) return YES;
    if(self == [NSLocale class]) return YES;
    if(self == [NSLock class]) return YES;
    if(self == [NSMethodSignature class]) return YES;
    if(self == [NSNotification class]) return YES;
    if(self == [NSNotificationQueue class]) return YES;
    if(self == [NSOperation class]) return YES;
    if(self == [NSOrderedSet class]) return YES;
    if(self == [NSOrthography class]) return YES;
    if(self == [NSOrthography class]) return YES;
    if(self == [NSPointerArray class]) return YES;
    if(self == [NSPointerFunctions class]) return YES;
    if(self == [NSPort class]) return YES;
    if(self == [NSProcessInfo class]) return YES;
    if(self == [NSPropertyListSerialization class]) return YES;
    if(self == [NSProxy class]) return YES;
    if(self == [NSRegularExpression class]) return YES;
    if(self == [NSRunLoop class]) return YES;
    if(self == [NSScanner class]) return YES;
    if(self == [NSSortDescriptor class]) return YES;
    if(self == [NSStream class]) return YES;
    if(self == [NSTextCheckingResult class]) return YES;
    if(self == [NSThread class]) return YES;
    if(self == [NSTimeZone class]) return YES;
    if(self == [NSTimer class]) return YES;
    if(self == [NSURLAuthenticationChallenge class]) return YES;
    if(self == [NSURLCache class]) return YES;
    if(self == [NSURLConnection class]) return YES;
    if(self == [NSURLCredential class]) return YES;
    if(self == [NSURLCredentialStorage class]) return YES;
    if(self == [NSURLProtectionSpace class]) return YES;
    if(self == [NSURLProtocol class]) return YES;
    if(self == [NSURLRequest class]) return YES;
    if(self == [NSURLResponse class]) return YES;
    if(self == [NSUserDefaults class]) return YES;
    if(self == [NSValueTransformer class]) return YES;
    if(self == [NSXMLParser class]) return YES;
    
    if(self == [NSExtensionContext class]) return YES;
    if(self == [NSExtensionItem class]) return YES;
    if(self == [NSFileCoordinator class]) return YES;
    if(self == [NSFileVersion class]) return YES;
    if(self == [NSFileWrapper class]) return YES;
    if(self == [NSItemProvider class]) return YES;
    if(self == [NSMetadataQuery class]) return YES;
    if(self == [NSProgress class]) return YES;
    if(self == [NSUbiquitousKeyValueStore class]) return YES;
    if(self == [NSUndoManager class]) return YES;
    if(self == [NSURLSession class]) return YES;
    if(self == [NSUserActivity class]) return YES;
    if(self == [NSUUID class]) return YES;
    
    //UIKit
    if([self isSubclassOfClass:[UIResponder class]]){
        if(self == [UIView class]) return YES;
        if(self == [UIControl class]) return YES;
        if(class_getSuperclass(self) == [UIControl class]) return YES;
        return NO;//自定义控件（非直接继承UIControl）
    }
    if(self == [CALayer class]) return YES;
    if(self == [UIColor class]) return YES;
    if(self == [UIViewController class]) return YES;
    if(self == [UIDevice class]) return YES;
    if(self == [NSTextAttachment class]) return YES;
    if(self == [UIScreen class]) return YES;
    if(self == [UIBezierPath class]) return YES;
    
    if(self == [UINib class]) return YES;
    if(self == [UITextChecker class]) return YES;
    if(self == [UIGestureRecognizer class]) return YES;
    if(self == [UIStoryboard class]) return YES;
    if(self == [UIPress class]) return YES;
    if(self == [UIEvent class]) return YES;

    return NO;
}

+ (BOOL)classContainProperty:(NSString*)property
{
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    for(i=0 ; i< outCount; i++){
        if([property isEqualToString:[NSString stringWithUTF8String:property_getName(properties[i])]]){
            free(properties);
            return YES;
        }
    }
    free(properties);
    return NO;
}

+ (BOOL)classContainIvar:(NSString*)ivarName
{
    unsigned int outCout ,i ;
    Ivar* ivarList = class_copyIvarList([self class], &outCout);
    for(i=0;i< outCout;i++){
        if([ivarName isEqualToString:[NSString stringWithUTF8String:ivar_getName(ivarList[i])]]){
            free(ivarList);
            return YES;
        }
    }
    free(ivarList);
    return NO;
}

+ (NSArray<NSString*>*)classGetIvarList
{
    unsigned int outCount , i;
    Ivar* ivarList = class_copyIvarList([self class], &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for(i=0 ; i< outCount; i++)
        [reMArr addObject:[NSString stringWithUTF8String:ivar_getName(ivarList[i])]];
    free(ivarList);
    return reMArr.copy;
}
+ (NSArray<NSString*>*)classGetPropertyList
{
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableArray* reMArr = [NSMutableArray new];
    
    for(i=0 ; i< outCount; i++){
        [reMArr addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
    }
    free(properties);
    return reMArr.copy;
}

+ (NSString *)classGetPropertyType:(NSString *)key
{
    NSString *code = nil;
    unsigned int outCount, i;
    objc_property_t* properties = class_copyPropertyList([self class], &outCount);
    
    for(i=0 ; i< outCount; i++){
        
        NSString* pName = @(property_getName(properties[i]));
        if([pName isEqualToString:key]){
            
            NSString *attrs = @(property_getAttributes(properties[i]));
            NSUInteger dotLoc = [attrs rangeOfString:@","].location;
            NSUInteger loc = 1;
            if (dotLoc == NSNotFound) {
                code = [attrs substringFromIndex:loc];
            } else {
                code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
            }
            return code;
        }
    }
    free(properties);
    return code;
}

+ (NSArray<NSString*>*)classGetAllPropertyList:(BOOL)includeFoundation
{
    NSMutableArray* reArr = [NSMutableArray new];
    [self classEnumerateUsingBlock:^(__unsafe_unretained Class clazz, BOOL *stop) {
        if(clazz == [NSObject class]) return;
        [reArr addObjectsFromArray:[clazz classGetPropertyList]];
    } includeFoundation:includeFoundation];
    return reArr.copy;
}

+ (NSArray<NSString*>*)classGetClassMethodList
{
    unsigned int outCount;
    Method* methods = class_copyMethodList(object_getClass(self), &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for (int i = 0; i < outCount; i++) {
        SEL name = method_getName(methods[i]);
        NSString* methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [reMArr addObject:methodName];
    }
    free(methods);
    return reMArr.copy;
}

- (NSArray<NSString*>*)objGetInstanceMethodList
{
    unsigned int outCount;
    Method* methods = class_copyMethodList([self class], &outCount);
    NSMutableArray* reMArr = [NSMutableArray new];
    for (int i = 0; i < outCount; i++) {
        SEL name = method_getName(methods[i]);
        NSString* methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [reMArr addObject:methodName];
    }
    free(methods);
    return reMArr.copy;
}

+ (NSArray<NSString*>*)classGetProtocolList
{
    unsigned int outCount;
    NSMutableArray* reMArr = [NSMutableArray new];
    
    __unsafe_unretained Protocol **protocols = class_copyProtocolList(self, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        NSString* protocolName= [NSString stringWithCString:protocol_getName(protocols[i]) encoding:NSUTF8StringEncoding];
        [reMArr addObject:protocolName];
    }
    free(protocols);
    return reMArr.copy;
}

+ (void)classEnumerateUsingBlock:(void (^)(__unsafe_unretained Class, BOOL *))block
               includeFoundation:(BOOL)includeFoundation
{
    if(!block)  return;
    BOOL stop = NO;
    Class clazz = self;
    while (clazz && !stop) {
        
        block(clazz, &stop);
        clazz = class_getSuperclass(clazz);
        if(!includeFoundation && [clazz classIsFoundation]) break;
    }
}

+ (void)classPropertysEnumerateUsingBlock:(void (^)(__unsafe_unretained Class, NSString *, NSString *, BOOL *))block includeFoundation:(BOOL)includeFoundation
{
    if(!block)  return;
    BOOL stop = NO;
    Class clazz = self;
    while (clazz && !stop) {
        
        NSString *code = nil;
        unsigned int outCount, i;
        objc_property_t* properties = class_copyPropertyList(clazz, &outCount);
        for(i=0 ; i< outCount; i++){
            
            NSString* pName = [NSString stringWithUTF8String:property_getName(properties[i])];
            NSString *attrs = @(property_getAttributes(properties[i]));
            NSUInteger dotLoc = [attrs rangeOfString:@","].location;
            NSUInteger loc = 1;
            if (dotLoc == NSNotFound) {
                code = [attrs substringFromIndex:loc];
            } else {
                code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
            }
            
            if (code.length > 3 && [code hasPrefix:@"@\""]) {//类型
                // 去掉@"和"，截取中间的类型名称
                code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
            }
            block(clazz,pName,code,&stop);
        }
        free(properties);
        
        clazz = class_getSuperclass(clazz);
        if(!includeFoundation && [clazz classIsFoundation]) break;
    }
}

- (NSObject *(^)(id))objAppend
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAppend , obj)
        
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableSet class]]){
            
            [_self addObject:obj];
        }else if ([self isKindOfClass:[NSArray class]]){
            
            _self = self.mutableCopy;
            [_self addObject:obj];
        }else if ([self isKindOfClass:[NSMutableString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            [_self appendString:obj];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            _self = self.mutableCopy;
            [_self appendString:obj];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [_self addSubview:obj];
        }else if ([self isKindOfClass:[NSSet class]]){
            
            _self = self.mutableCopy;
            [_self addObject:obj];
        }
        
        return _self;
    };
}

- (NSObject *(^)())objCopy
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objCopy)
        return _self.copy;
    };
}

- (NSObject *(^)())objMutableCopy
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objMutableCopy)
        return _self.mutableCopy;
    };
}

- (NSObject *(^)())objMutableCopyDeep
{
    return ^id(){
        LinkHandle_REF(NSObject)
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

- (BOOL (^)())objIsNSNull
{
    return ^(){
        if(self == [NSNull null]) return YES;
        return NO;
    };
}
- (NSNumber *(^)())objIsNSNull_n
{
    return ^(){
        return @(self.objIsNSNull());
    };
}

- (BOOL (^)(id))objIsEqual
{
    return ^(id obj){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsEqual,obj)
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }
        
        return blockCompare(_self,obj);
    };
}

- (NSNumber *(^)(id))objIsEqual_n
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqual_n,obj)
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }
        
        return @(blockCompare(_self,obj));
    };
}

- (BOOL (^)(id,...))objIsEqualToEach
{
    return ^(id obj ,...){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        
        NSMutableArray* objs = [NSMutableArray new];
        [objs addObject:obj];
        va_list args;
        va_start(args, obj);
        id parmObj;
        
        while ((parmObj = va_arg(args, id) )) {
            [objs addObject:parmObj];
        }
        va_end(args);
        
        ///////////////////////
        //LinkGroupHandle_VAL
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            return [group.linkObjects firstObject].objIsEqualToEachInArray(objs);
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        return _self.objIsEqualToEachInArray(objs);
    };
}

- (NSNumber* (^)(id,...))objIsEqualToEach_n
{
    return ^id(id obj ,...){
        LinkHandle_REF(NSObject)
        
        NSMutableArray* objs = [NSMutableArray new];
        [objs addObject:obj];
        va_list args;
        va_start(args, obj);
        id parmObj;
        
        while ((parmObj = va_arg(args, id) )) {
            [objs addObject:parmObj];
        }
        va_end(args);
        
        ///////////////////////
        //LinkGroupHandle_VAL
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* newObjs = [NSMutableArray new];
            [group.linkObjects enumerateObjectsUsingBlock:^(NSObject * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newObjs addObject: @(obj.objIsEqualToEachInArray(objs))];
            }];
            group.linkObjects = newObjs;
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        return @(_self.objIsEqualToEachInArray(objs));
    };
}

- (BOOL (^)(NSArray *))objIsEqualToEachInArray
{
    return ^(NSArray * objs){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsEqualToEachInArray,objs)
        
        if(![objs isKindOfClass:[NSArray class]])
            return NO;
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }

        for (id obj in objs) {
            if(blockCompare(_self, obj)){
                return NO;
            }
        }
        return YES;
    };
}

- (NSNumber *(^)(NSArray *))objIsEqualToEachInArray_n
{
    return ^id(NSArray * objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqualToEachInArray_n,objs)
        
        if(![objs isKindOfClass:[NSArray class]])
            return @(NO);
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }
        
        for (id obj in objs) {
            if(blockCompare(_self, obj)){
                return @(NO);
            }
        }
        return @(YES);
    };
}

- (BOOL (^)(id, ...))objIsEqualToSomeone
{
    return ^(id obj , ...){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        NSMutableArray* objs = [NSMutableArray new];
        [objs addObject:obj];
        va_list args;
        va_start(args, obj);
        id parmObj;
        while ((parmObj = va_arg(args, id))) {
            [objs addObject:parmObj];
        }
        va_end(args);
        
        ///////////////////////
        //LinkGroupHandle_VAL
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            return [group.linkObjects firstObject].objIsEqualToSomeoneInArray(objs);
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        return _self.objIsEqualToSomeoneInArray(objs);
    };
}

- (NSNumber* (^)(id, ...))objIsEqualToSomeone_n
{
    return ^id(id obj , ...){
        LinkHandle_REF(NSObject)
        NSMutableArray* objs = [NSMutableArray new];
        [objs addObject:obj];
        va_list args;
        va_start(args, obj);
        id parmObj;
        while ((parmObj = va_arg(args, id))) {
            [objs addObject:parmObj];
        }
        va_end(args);
        
        ///////////////////////
        //LinkGroupHandle_VAL
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* newObjs = [NSMutableArray new];
            [group.linkObjects enumerateObjectsUsingBlock:^(NSObject * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [newObjs addObject: @(obj.objIsEqualToSomeoneInArray(objs))];
            }];
            group.linkObjects = newObjs;
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        return @(_self.objIsEqualToSomeoneInArray(objs));
    };
}

- (BOOL (^)(NSArray *))objIsEqualToSomeoneInArray
{
    return ^(NSArray * objs){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsEqualToSomeoneInArray,objs)
        
        if(![objs isKindOfClass:[NSArray class]])
            return NO;
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }
        
        for (id obj in objs) {
            if(blockCompare(_self , obj)){
                return YES;
            }
        }
        return NO;
    };
}

- (NSNumber* (^)(NSArray *))objIsEqualToSomeoneInArray_n
{
    return ^id(NSArray * objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqualToSomeoneInArray_n,objs)
        
        if(![objs isKindOfClass:[NSArray class]])
            return @NO;
        
        BOOL (^blockCompare)(id obj1, id obj2);
        if([_self isKindOfClass:[NSString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToString:obj2];};
        }else if ([_self isKindOfClass:[NSNumber class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToNumber:obj2];};
        }else if ([_self isKindOfClass:[NSValue class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToValue:obj2];};
        }else if ([_self isKindOfClass:[NSDate class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDate:obj2];};
        }else if ([_self isKindOfClass:[NSData class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToData:obj2];};
        }else if ([_self isKindOfClass:[NSArray class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToArray:obj2];};
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToDictionary:obj2];};
        }else if ([_self isKindOfClass:[NSSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToSet:obj2];};
        }else if ([_self isKindOfClass:[NSIndexSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToIndexSet:obj2];};
        }else if ([_self isKindOfClass:[NSAttributedString class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToAttributedString:obj2];};
        }else if ([_self isKindOfClass:[NSTimeZone class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToTimeZone:obj2];};
        }else if ([_self isKindOfClass:[NSHashTable class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToHashTable:obj2];};
        }else if ([_self isKindOfClass:[NSOrderedSet class]]){
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqualToOrderedSet:obj2];};
        }else{
            blockCompare = ^(id obj1, id obj2){return [obj1 isEqual:obj2];};
        }
        
        for (id obj in objs) {
            if(blockCompare(_self , obj)){
                return @YES;
            }
        }
        return @NO;
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

- (NSNumber *(^)(__unsafe_unretained Class))isKindOf_n
{
    return ^id(Class classKind){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(isKindOf_n,classKind)
        if(!classKind)
            return @NO;
        return @([_self isKindOfClass:classKind]);
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

- (NSNumber *(^)(__unsafe_unretained Class))isSubClassOf_n
{
    return ^id(Class classKind){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(isSubClassOf_n,classKind)
        if(!classKind)
            return @(NO);
        return @([[_self class] isSubclassOfClass:classKind]);
    };
}

- (NSObject* (^)(__unsafe_unretained Class))objMustType
{
    return ^id(Class theClass){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objMustType,theClass)
        if(!theClass || ![_self isKindOfClass:theClass]){
            return [theClass new];
        }else{
            return _self;
        }
    };
}

- (NSObject *(^)(NSString *))objBoolReverseForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objBoolReverseForKey,key)
        @try {
            NSNumber* value = [_self valueForKey:key];
            if([value isKindOfClass:[NSNumber class]]){
                [_self setValue:@(!value.boolValue) forKey:key];
            }
        } @finally {
            return _self;
        }
    };
}

- (NSObject *(^)(id))objSetDelegate
{
    return ^id(id delegate){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetDelegate,delegate)
        @try {
            [self setValue:delegate forKey:@"delegate"];
        } @finally {
            return _self;
        }
    };
}

- (NSObject *(^)())objValueRandom
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objValueRandom)
        
        unsigned int outCount, i;
        objc_property_t* properties = class_copyPropertyList([self class], &outCount);
        for(i=0 ; i< outCount; i++){
            
            NSString* pName = @(property_getName(properties[i]));
            NSString *attrs = @(property_getAttributes(properties[i]));
            NSUInteger dotLoc = [attrs rangeOfString:@","].location;
            NSString *code = nil;
            NSUInteger loc = 1;
            if (dotLoc == NSNotFound) { // 没有
                code = [attrs substringFromIndex:loc];
            } else {
                code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
            }
            
            if ([code isEqualToString:@"@"]) {
                //id
                continue;
            } else if (code.length == 0) {
                //KVCDisabled
                continue;
            } else if (code.length > 3 && [code hasPrefix:@"@\""]) {//类型
                // 去掉@"和"，截取中间的类型名称
                code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
                Class clazz = NSClassFromString(code);
                
                if([clazz isSubclassOfClass:[NSNumber class]]){//数字
                    [_self setValue:@(arc4random_uniform(10001)) forKey:pName];
                }else if ([clazz isSubclassOfClass:[NSMutableString class]]){//字符串
                    [_self setValue:[[NSUUID UUID].UUIDString substringToIndex:4].mutableCopy forKey:pName];
                }else if ([clazz isSubclassOfClass:[NSString class]]){
                    [_self setValue:[[NSUUID UUID].UUIDString substringToIndex:4] forKey:pName];
                }
            } else if ([code isEqualToString:@":"] ||//SEL
                       [code isEqualToString:@"^{objc_ivar=}"] ||//ivar
                       [code isEqualToString:@"^{objc_method=}"] ||//Method
                       [code isEqualToString:@"@?"]) {//block
                //KVCDisabled
                continue;
            }
            // 是否为数字类型
            NSString *lowerCode = code.lowercaseString;
            NSArray *numberTypes = @[@"i", @"s", @"c", @"b", @"f", @"d", @"l", @"q", @"c"];
            if ([numberTypes containsObject:lowerCode]) {
                //numberType
                [_self setValue:@(arc4random_uniform(10001)) forKey:pName];
                if ([lowerCode isEqualToString:@"c"]  || [lowerCode isEqualToString:@"b"]) {
                    //boolType
                    [_self setValue:@(arc4random_uniform(2)==0?NO:YES) forKey:pName];
                }
            }
        }
        
        free(properties);
        return _self;
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

- (NSNumber *(^)(SEL))isRespondsSEL_n
{
    return ^id(SEL theSEL){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(isRespondsSEL_n,theSEL)
        if(theSEL){
            if([_self respondsToSelector:theSEL])
                return @(YES);
        }
        return @(NO);
    };
}

- (NSString *(^)())objToJsonString
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToJsonString)
        if(![NSJSONSerialization isValidJSONObject:_self])
            return @"";
        NSError* error;
        NSData * jsonData;
        if([self isKindOfClass:[NSString class]]){
            
            jsonData = [NSJSONSerialization JSONObjectWithData:[((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding]
                                                       options:kNilOptions
                                                         error:&error];
        } else{
            
            jsonData = [NSJSONSerialization dataWithJSONObject:_self
                                                       options:kNilOptions
                                                         error:&error];
        }
        if(error) return @"";
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    };
}

- (NSObject *(^)(NSMutableDictionary *, id<NSCopying>))objSetToDict
{
    return ^id(NSMutableDictionary* dict, id<NSCopying> key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetToDict,dict,key)
        dict[key] = _self;
        return _self;
    };
}

- (BOOL (^)(NSMutableDictionary *))objIsInDictKeys
{
    return ^BOOL(NSMutableDictionary* dict){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsInDictKeys,dict)
        return [dict.allKeys containsObject:_self];
    };
}
- (NSNumber* (^)(NSMutableDictionary *))objIsInDictKeys_n
{
    return ^id(NSMutableDictionary* dict){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsInDictKeys_n,dict)
        return @([dict.allKeys containsObject:_self]);
    };
}

- (BOOL (^)(NSMutableDictionary *))objIsInDictValues
{
    return ^BOOL(NSMutableDictionary* dict){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsInDictKeys,dict)
        return [dict.allValues containsObject:_self];
    };
}
- (NSNumber* (^)(NSMutableDictionary *))objIsInDictValues_n
{
    return ^id(NSMutableDictionary* dict){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsInDictValues_n,dict)
        return @([dict.allValues containsObject:_self]);
    };
}

- (NSDictionary *(^)(BOOL))objToNSDictionaryNoDeep
{
    return ^id(BOOL includeFoundation){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSDictionaryNoDeep,includeFoundation)
        
        //为容器对象时层次遍历
        if([_self isKindOfClass:[NSDictionary class]]){
            NSMutableDictionary* reDict = [NSMutableDictionary new];
            [reDict addEntriesFromDictionary:_self];
            [_self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSObject*  _Nonnull value, BOOL * _Nonnull stop) {
                reDict[key] = value.objToNSDictionaryNoDeep(includeFoundation);
            }];
            return reDict.copy;
        }
        if([_self isKindOfClass:[NSArray class]]){
            NSMutableArray* reArr = [NSMutableArray new];
            [_self enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [reArr addObject:obj.objToNSDictionaryNoDeep(includeFoundation)];
            }];
            return reArr.copy;
        }
        if([_self isKindOfClass:[NSSet class]]){
            NSMutableSet* reSet = [NSMutableSet new];
            [_self enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, BOOL * _Nonnull stop) {
                [reSet addObject:obj.objToNSDictionaryNoDeep(includeFoundation)];
            }];
            return reSet.copy;
        }
        if([_self isKindOfClass:[NSHashTable class]]){
            NSHashTable* reTab = _self.mutableCopy;
            [reTab removeAllObjects];
            for (NSObject* obj in [_self objectEnumerator]) {
                [reTab addObject:obj.objToNSDictionaryNoDeep(includeFoundation)];
            }
            return reTab;
        }
        if([_self isKindOfClass:[NSMapTable class]]){
            NSMapTable* reMap = _self.mutableCopy;
            [reMap removeAllObjects];
            for (NSObject* key in [_self keyEnumerator]) {
                NSObject* value = [_self objectForKey:key];
                [reMap setObject:value.objToNSDictionaryNoDeep(includeFoundation)
                          forKey:key];
            }
            return reMap;
        }
        
        //为非容器Foundation类型时返回自身
        if([[self class] classIsFoundation])  return _self;
        
        //为非容器对象遍历属性
        NSMutableDictionary* reDict = [NSMutableDictionary new];
        NSArray<NSString*>* properties = [[_self class] classGetAllPropertyList:includeFoundation];
        @try {
            [properties enumerateObjectsUsingBlock:^(NSString * _Nonnull property, NSUInteger idx, BOOL * _Nonnull stop) {
                
                __kindof NSObject* value = [_self valueForKey:property];
                
                if(!value)  return;
                
                reDict[property] = value;
            }];
        }@catch (NSException *exception){
            //发生错误则进行安全赋值
            [reDict removeAllObjects];
            [properties enumerateObjectsUsingBlock:^(NSString * _Nonnull property, NSUInteger idx, BOOL * _Nonnull stop) {
                
                __kindof NSObject* value;
                
                @try {
                    value = [_self valueForKey:property];
                } @catch (NSException *exception) {
                    exception.nslog();
                } @finally {
                    value = nil;
                }
                
                if(!value)  return;
                
                reDict[property] = value;
            }];
        }
        return [reDict copy];
    };
}

- (NSDictionary *(^)(BOOL))objToNSDictionary
{
    return ^id(BOOL includeFoundation){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSDictionary,includeFoundation)
        //为容器对象时层次遍历
        if([_self isKindOfClass:[NSDictionary class]]){
            NSMutableDictionary* reDict = [NSMutableDictionary new];
            [reDict addEntriesFromDictionary:_self];
            [_self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSObject*  _Nonnull value, BOOL * _Nonnull stop) {
                reDict[key] = value.objToNSDictionary(includeFoundation);
            }];
            return reDict.copy;
        }
        if([_self isKindOfClass:[NSArray class]]){
            NSMutableArray* reArr = [NSMutableArray new];
            [_self enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [reArr addObject:obj.objToNSDictionary(includeFoundation)];
            }];
            return reArr.copy;
        }
        if([_self isKindOfClass:[NSSet class]]){
            NSMutableSet* reSet = [NSMutableSet new];
            [_self enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, BOOL * _Nonnull stop) {
                [reSet addObject:obj.objToNSDictionary(includeFoundation)];
            }];
            return reSet.copy;
        }
        if([_self isKindOfClass:[NSHashTable class]]){
            NSHashTable* reTab = _self.mutableCopy;
            [reTab removeAllObjects];
            for (NSObject* obj in [_self objectEnumerator]) {
                [reTab addObject:obj.objToNSDictionary(includeFoundation)];
            }
            return reTab;
        }
        if([_self isKindOfClass:[NSMapTable class]]){
            NSMapTable* reMap = _self.mutableCopy;
            [reMap removeAllObjects];
            for (NSObject* key in [_self keyEnumerator]) {
                NSObject* value = [_self objectForKey:key];
                [reMap setObject:value.objToNSDictionary(includeFoundation)
                          forKey:key];
            }
            return reMap;
        }
        
        //为非容器Foundation类型时返回自身
        if([[self class] classIsFoundation])  return _self;
        
        //为非容器对象遍历属性
        NSMutableDictionary* reDict = [NSMutableDictionary new];
        NSArray<NSString*>* properties = [[_self class] classGetAllPropertyList:includeFoundation];
        @try {
            [properties enumerateObjectsUsingBlock:^(NSString * _Nonnull property, NSUInteger idx, BOOL * _Nonnull stop) {
                
                __kindof NSObject* value = [_self valueForKey:property];
                
                if(!value)  return;
                //属性值为容器类型时层次遍历
                if([value isKindOfClass:[NSDictionary class]]   ||
                   [value isKindOfClass:[NSArray class]]        ||
                   [value isKindOfClass:[NSSet class]]          ||
                   [value isKindOfClass:[NSHashTable class]]    ||
                   [value isKindOfClass:[NSMapTable class]]){
                    
                    reDict[property] = value.objToNSDictionary(includeFoundation);
                }else{
                    
                    if([[value class] classIsFoundation]){
                        //属性值为Foundation类型时直接赋值
                        reDict[property] = value;
                    }else{
                        //属性值为非Foundation类型时继续转换
                        reDict[property] = value.objToNSDictionary(includeFoundation);
                    }
                }
            }];
        }@catch (NSException *exception) {
            //发生错误则进行安全赋值
            [reDict removeAllObjects];
            [properties enumerateObjectsUsingBlock:^(NSString * _Nonnull property, NSUInteger idx, BOOL * _Nonnull stop) {
                
                __kindof NSObject* value;
                
                @try {
                    value = [_self valueForKey:property];
                } @catch (NSException *exception) {
                    exception.nslog();
                    value = nil;
                }
                
                if(!value)  return;
                //属性值为容器类型时层次遍历
                if([value isKindOfClass:[NSDictionary class]]   ||
                   [value isKindOfClass:[NSArray class]]        ||
                   [value isKindOfClass:[NSSet class]]          ||
                   [value isKindOfClass:[NSHashTable class]]    ||
                   [value isKindOfClass:[NSMapTable class]]){
                    
                    reDict[property] = value.objToNSDictionary(includeFoundation);
                }else{
                    
                    if([[value class] classIsFoundation]){
                        //属性值为Foundation类型时直接赋值
                        reDict[property] = value;
                    }else{
                        //属性值为非Foundation类型时继续转换
                        reDict[property] = value.objToNSDictionary(includeFoundation);
                    }
                }
            }];
        }
        
        return reDict.copy;
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
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(className)
        return NSStringFromClass(_self.class);
    };
}

- (NSString *(^)())superclassName
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(superclassName)
        return NSStringFromClass(_self.superclass);
    };
}

- (NSObject *(^)(id*))setTo
{
    return ^id(id* toObject){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(setTo,toObject)
        *toObject= _self;
        return _self;
    };
}

- (NSObject *)linkInBlock:(void (^)(NSObject *))block
{
    LinkHandle_REF(NSObject)
    if(block)   block(_self);
    return _self;
}

- (NSObject *)linkLoopIn:(NSUInteger)count block:(void (^)(NSObject *, NSUInteger))block
{
    LinkHandle_REF(NSObject)
    for (int i=0; i<count; i++) {
        if(block)   block(_self , i);
    }
    return _self;
}

- (NSObject*)linkAfterIn:(double)time block:(void(^)(NSObject* link))block
{
    LinkHandle_REF(NSObject)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(block)   block(_self);
    });
    return _self;
}

- (NSObject *)linkAsy_main_queue:(void (^)(NSObject *))block
{
    LinkHandle_REF(NSObject)
    dispatch_async(dispatch_get_main_queue(), ^{
        if(block)   block(_self);
    });
    return _self;
}

- (NSObject *)linkAsy_global_queue:(void (^)(NSObject *))block
{
    LinkHandle_REF(NSObject)
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if(block)   block(_self);
    });
    return _self;
}

- (NSObject *(^)(id))linkAnd
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
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

- (NSObject *(^)(id))linkTo
{
    return ^id(id obj){
        
        if([self isKindOfClass:[LinkInfo class]]){
            if(((LinkError*)self).infoType == LinkInfoError){
                
                ((LinkError*)self).throwCount++;
            }else if(((LinkReturn*)self).infoType == LinkInfoReturn){
                
                return self;
            }
        }
        
        LinkGroupHandle_REF(linkTo,obj)
        if(obj){
            return obj;
        }
        else{
            return self;
        }
    };
}

- (NSObject *(^)(NSUInteger idx))linkOut
{
    return ^id(NSUInteger idx){
        LinkHandle_REF(NSObject)
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
        LinkHandle_REF(NSObject)
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

- (NSObject *)linkFirstObj
{
    LinkHandle_REF(NSObject)
    if([_self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (id)_self;
        if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
            NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
            if(!count) return group;
            return group.linkObjects.firstObject;
        }else{
            return group.linkObjects.firstObject;
        }
    }
    return _self;
}

- (NSObject *)linkLastObj
{
    LinkHandle_REF(NSObject)
    if([_self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (id)_self;
        if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
            NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
            if(!count) return group;
            return group.linkObjects.lastObject;
        }else{
            return group.linkObjects.lastObject;
        }
    }
    return _self;
}

- (NSObject *(^)(NSUInteger))linkLoop
{
    return ^id(NSUInteger count){
        LinkHandle_REF(NSObject)
        LinkGroup* group;
        if([self isKindOfClass:[LinkGroup class]]){
            group = (id)_self;
            group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] = @(group.linkObjects.count);
            NSArray* copyObjs = [group.linkObjects copy];
            //复制链条
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

- (NSObject *(^)(BOOL))linkIf
{
    return ^id(BOOL condition){
        
        if([self isKindOfClass:[LinkInfo class]]){
            if(((LinkError*)self).infoType == LinkInfoError){
                
                ((LinkError*)self).throwCount++;
            }else if(condition && ((LinkReturn*)self).infoType == LinkInfoReturn){
                
                if(((LinkReturn*)self).returnType == LinkReturnCondition){
                    return ((LinkReturn*)self).returnValue;
                }
            }
            return self;
        }
        
        LinkGroupHandle_REF(linkIf,condition)
        
        if(!condition){
            return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnCondition];
        }
        return self;
    };
}

- (NSObject *)linkElse
{
    
    if([self isKindOfClass:[LinkInfo class]]){
        if(((LinkError*)self).infoType == LinkInfoError){
            
            ((LinkError*)self).throwCount++;
        }else if(((LinkReturn*)self).infoType == LinkInfoReturn){
            
            if(((LinkReturn*)self).returnType == LinkReturnCondition){
                return ((LinkReturn*)self).returnValue;
            }
        }
        return self;
    }
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (LinkGroup*)self;
        NSMutableArray* returnObjs = [NSMutableArray new];
        for (int i=0; i<group.linkObjects.count; i++) {
            id re = group.linkObjects[i].linkElse;
            [returnObjs addObject:re];
        }
        [group.linkObjects setArray:returnObjs];
        return (id)group;
    }
    return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnCondition];
}

- (NSObject *)linkReturn
{
        if([self isKindOfClass:[LinkInfo class]]){
            if(((LinkError*)self).infoType == LinkInfoError){
                
                ((LinkError*)self).throwCount++;
                return self;
            }else if(((LinkReturn*)self).infoType == LinkInfoReturn){
                
                switch (((LinkReturn*)self).returnType) {
                    case LinkReturnLink:
                        return self;
                    case LinkReturnCondition:
                        (((LinkReturn*)self).returnValue = LinkReturnLink);
                        return self;
                    default:
                        return self;
                }
            }
        }
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (LinkGroup*)self;
        NSMutableArray* returnObjs = [NSMutableArray new];
        for (int i=0; i<group.linkObjects.count; i++) {
            id re = group.linkObjects[i].linkReturn;
            [returnObjs addObject:re];
        }
        [group.linkObjects setArray:returnObjs];
        return (id)group;
    }
    return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnLink];
}

- (NSObject *(^)())nslog
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslog)
        NSLog(@"%@",_self);
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogTitle
{
    return ^id(NSString* title){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslogTitle,title)
        NSLog(@"%@%@",title,_self);
        return _self;
    };
}

- (NSObject *(^)(NSString *))logInfo
{
    return ^id(NSString* info){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(logInfo,info)
        NSLog(@"%@",info);
        return self;
    };
}

- (NSObject *(^)())poNoDeep
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(poNoDeep)
        NSLog(@"%@",_self.objToNSDictionaryNoDeep(NO));
        return _self;
    };
}

- (NSObject *(^)())po
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(po)
        NSLog(@"%@",_self.objToNSDictionary(YES));
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogValueForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslogValueForKey,key)
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}

- (NSObject *(^)(NSString *))nslogValueForKeyPath
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslogValueForKeyPath,key)
        NSLog(@"%@",[_self valueForKey:key]);
        return _self;
    };
}

- (id)linkEnd
{
    if([self isKindOfClass:[LinkInfo class]]){
        if([self isKindOfClass:[LinkError class]]){
            
            ((LinkError*)self).throwCount++;
            NSLog(@"%@",[self description]);
            return nil;
        }else if([self isKindOfClass:[LinkGroup class]]){
            
            return [((LinkGroup*)self).linkObjects firstObject];
        }else if ([self isKindOfClass:[LinkReturn class]]){
            
            return ((LinkReturn*)self).returnValue;
        }
    }else if (self == [NSNull null]){
        return nil;
    }
    return self;
}

- (NSArray* )linkEnds
{
    if([self isKindOfClass:[LinkInfo class]]){
        if([self isKindOfClass:[LinkError class]]){
            
            ((LinkError*)self).throwCount++;
            NSLog(@"%@",[self description]);
            return nil;
        }else if([self isKindOfClass:[LinkGroup class]]){
            
            LinkGroup* group = (id)self;
            if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                
                NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                NSArray* tempArr = [group.linkObjects subarrayWithRange:NSMakeRange(0, count)];
                NSMutableArray* valueArr = [NSMutableArray new];
                [tempArr enumerateObjectsUsingBlock:^(NSObject*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [valueArr addObject:obj.linkEnd];
                }];
                [group.linkObjects setArray:valueArr];
            }
            return [group.linkObjects copy];
        }else if ([self isKindOfClass:[LinkReturn class]]){
            
            NSObject* reVal = ((LinkReturn*)self).returnValue;
            if([reVal isKindOfClass:[LinkGroup class]])
                return reVal.linkEnds;
            return reVal.linkEnd;
        }
    }else if (self == [NSNull null]){
        return nil;
    }
    return (id)self;
}

- (id (^)(NSUInteger))linkEndsAt
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
            }else if ([self isKindOfClass:[LinkReturn class]]){
                
                LinkGroup* group = ((LinkReturn*)self).returnValue;
                if([group isKindOfClass:[LinkGroup class]]){
                    
                    if(group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)]){
                        NSInteger count = [group.userInfo[@(LinkGroupHandleTypeLoopOriginCount)] integerValue];
                        [group.linkObjects setArray:[group.linkObjects subarrayWithRange:NSMakeRange(0, count)]];
                    }
                    if(idx < group.linkObjects.count)
                        return group.linkObjects[idx];
                    return nil;
                }
            }
        }else if (self == [NSNull null]){
            return nil;
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
        LinkHandle_REF(NSObject)
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
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(setValueForKeyPath,value,key)
        [_self setValue:value forKeyPath:key];
        return self;
    };
}

- (NSObject *(^)(NSMutableArray *))objAddToArr
{
    return ^id(NSMutableArray* arr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAddToArr,arr)
        [arr addObject:_self];
        return _self;
    };
}

- (NSObject *(^)(NSMutableArray *))objRemoveFromArr
{
    return ^id(NSMutableArray* arr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemoveFromArr,arr)
        [arr removeObject:_self];
        return _self;
    };
}

- (NSObject *(^)(NSArray *))objBeforeInArr
{
    return ^id(NSArray* inArr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objBeforeInArr,inArr)
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx-1)>0){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return [NSNull null];
        }
    };
}

- (NSObject *(^)(NSArray *))objNextInArr
{
    return ^id(NSArray* inArr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objNextInArr,inArr)
        NSUInteger idx = [inArr indexOfObject:_self];
        if(idx!=NSNotFound && (idx+1) <inArr.count){
            return (NSObject*)[inArr objectAtIndex:idx];
        }else{
            return [NSNull null];
        }
    };
}

- (BOOL (^)(NSArray *))objIsInArr
{
    return ^BOOL(NSArray* inArr){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsInArr, inArr)
        return [inArr containsObject:_self];
    };
}
- (NSNumber* (^)(NSArray *))objIsInArr_n
{
    return ^id(NSArray* inArr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsInArr_n, inArr)
        return @([inArr containsObject:_self]);
    };
}

#pragma mark - 类型转换

#ifndef Link_TransType_Maro
#define Link_TransType_Maro(ReType) \
- (ReType *)of##ReType \
{ \
    return (id)self; \
}
#endif

Link_TransType_Maro(NSString)
Link_TransType_Maro(NSMutableString)
Link_TransType_Maro(NSArray)
Link_TransType_Maro(NSMutableArray)
Link_TransType_Maro(NSDictionary)
Link_TransType_Maro(NSMutableDictionary)
Link_TransType_Maro(NSAttributedString)
Link_TransType_Maro(NSMutableAttributedString)
Link_TransType_Maro(NSURL)
Link_TransType_Maro(NSUserDefaults)
Link_TransType_Maro(NSNumber)
Link_TransType_Maro(NSValue)
Link_TransType_Maro(NSDate)
Link_TransType_Maro(NSData)
Link_TransType_Maro(UIView)
Link_TransType_Maro(UILabel)
Link_TransType_Maro(UIControl)
Link_TransType_Maro(UIButton)
Link_TransType_Maro(UIScrollView)
Link_TransType_Maro(UIImage)
Link_TransType_Maro(UIColor)
Link_TransType_Maro(UIViewController)
Link_TransType_Maro(UIImageView)
Link_TransType_Maro(UITableView)
Link_TransType_Maro(UITextField)
Link_TransType_Maro(UITextView)
Link_TransType_Maro(UIWebView)
Link_TransType_Maro(NSMutableSet)
Link_TransType_Maro(NSSet)

@end
