//
//  NSObject+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <objc/runtime.h>
#import <CoreData/CoreData.h>
#import "LinkBlock.h"
#import "DynamicLink.h"
#import "LinkHelper.h"
#import "LinkBlockInvocation.h"

@implementation NSObject(LinkBlock)

- (NSObject *(^)(NSString *, ...))linkEvalCode
{
    return ^id(NSString* code, ...){
        LinkHandle_REF(NSObject)
        
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* returnObjs = [NSMutableArray new];
            va_list args;
            va_start(args, code);
            for (int i=0; i<group.linkObjects.count; i++) {
                DynamicLink* link = [DynamicLink dynamicLinkWithCode:code];
                id result = [link invoke:_self args:&args];
                [returnObjs addObject:result];
            }
            va_end(args);
            [group.linkObjects setArray:returnObjs];
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        va_list args;
        va_start(args , code);
        DynamicLink* link = [DynamicLink dynamicLinkWithCode:code];
        id result = [link invoke:_self args:&args];
        va_end(args);
        
        return result;
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
            
            if (code.length > 3 && [code hasPrefix:@"@\""]) {//对象
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

- (NSObject *(^)(id))objAdd
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAdd , obj)
        
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableSet class]] ||
           [self isKindOfClass:[NSHashTable class]] ||
           [self isKindOfClass:[NSMutableOrderedSet class]]){
            
            [_self addObject:obj];
        }else if ([self isKindOfClass:[NSString class]]){
            
            if(!_self.objIsMutable()){
                
                _self = [self mutableCopy];
                _self.m_strAppend(obj);
            }else{
                
                _self.strAppend(obj);
            }
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [_self addSubview:obj];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [_self addSublayer:obj];
        }else if ([self isKindOfClass:[NSMutableDictionary class]] &&
                  [obj isKindOfClass:[NSDictionary class]]){
            
            [_self addEntriesFromDictionary:obj];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id))objAddTo
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAddTo , obj)
        
        if(!obj) return _self;
        
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableSet class]] ||
           [obj isKindOfClass:[NSHashTable class]] ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj addObject:_self];
        }else if ([obj objIsMutable]()){
            
            [obj appendString:_self];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [obj addSubview:_self];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [obj addSublayer:_self];
        }else if ([self isKindOfClass:[NSDictionary class]] &&
                  [obj isKindOfClass:[NSMutableDictionary class]]){
            
            [obj addEntriesFromDictionary:obj];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id))objAddToAsWhatSet
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAddToAsWhatSet , obj)
        
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableSet class]] ||
           [obj isKindOfClass:[NSHashTable class]] ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj addObject:_self];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            if([obj objIsMutable]()){
                
                [obj appendString:_self];
            }else{
                
                obj = [obj mutableCopy] ;
                [obj appendString:_self];
            }
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [obj addSubview:_self];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [obj addSublayer:_self];
        }
        
        return linkObj(obj);
    };
}

- (NSObject *(^)(id, NSUInteger))objInsert
{
    return ^id(id obj , NSUInteger idx){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objInsert , obj , idx)
        
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableOrderedSet class]]){
            
            [_self insertObject:obj atIndex:idx];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            if([_self objIsMutable]()){
                
                [_self insertString:obj atIndex:idx];
            }else{
                
                _self = [_self mutableCopy];
                [_self insertString:obj atIndex:idx];
            }
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [_self insertSubview:obj atIndex:idx];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [_self insertSublayer:obj atIndex:(unsigned)idx];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id, NSUInteger))objInsertTo
{
    return ^id(id obj , NSUInteger idx){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objInsertTo , obj , idx)
        
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj insertObject:_self atIndex:idx];
        }else if ([obj isKindOfClass:NSMutableString.class] &&
                  [obj objIsMutable]()){
            
            if(![_self isKindOfClass:NSString.class])
                _self = _self.description;
            if(_self)
                [obj insertString:_self atIndex:idx];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [obj insertSubview:_self atIndex:idx];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [obj insertSublayer:_self atIndex:(unsigned)idx];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id, NSUInteger))objInsertToAsWhatSet
{
    return ^id(id obj , NSUInteger idx){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objInsertToAsWhatSet , obj , idx)
        
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj insertObject:_self atIndex:idx];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            if([obj objIsMutable]()){
                
                [obj insertString:_self atIndex:idx];
            }else{
                
                obj = [obj mutableCopy];
                [obj insertString:_self atIndex:idx];
            }
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            [obj insertSubview:_self atIndex:idx];
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            [obj insertSublayer:_self atIndex:(unsigned)idx];
        }
        
        return linkObj(obj);
    };
}

- (NSObject *(^)(void))objRemoveAll
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemoveAll)
        
        
        if([self isKindOfClass:[UILabel class]]||
           [self isKindOfClass:[UITextField class]]||
           [self isKindOfClass:[UITextView class]]||
           [self isKindOfClass:[UISearchBar class]]
           ){
            
            if([[_self valueForKey:@"text"] length]){
                
                [_self setValue:nil forKey:@"text"];
                return _self;
            }
        }
        
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableDictionary class]] ||
           [self isKindOfClass:[NSMutableSet class]] ||
           [self isKindOfClass:[NSHashTable class]] ||
           [self isKindOfClass:[NSMutableOrderedSet class]] ||
           [self isKindOfClass:[NSCache class]] ||
           [self isKindOfClass:[NSMapTable class]]){
            
            [_self removeAllObjects];
        }else if ([self isKindOfClass:[NSString class]]){
            
            _self = [NSMutableString new];
        }else if ([self isKindOfClass:[UIView class]]){
            
            [[_self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }else if ([self isKindOfClass:[CALayer class]]){
            
            [[_self sublayers] makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
        }
        
        return _self;
    };
}

- (BOOL (^)(void))objIsBlank
{
    
    if ([self isKindOfClass:[NSString class]]){
        return self.strIsBlank;
    }
    
    if([self isKindOfClass:[NSValue class]]){
        return self.valueIsBlank;
    }
    
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(NSObject)
        LinkGroupHandle_VAL(objIsBlank)
        //collection
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableDictionary class]] ||
           [self isKindOfClass:[NSMutableSet class]] ||
           [self isKindOfClass:[NSHashTable class]] ||
           [self isKindOfClass:[NSMutableOrderedSet class]] ||
           [self isKindOfClass:[NSMapTable class]]){
            
            return [_self count];
        }else if ([self isKindOfClass:[UIView class]]){
            
            return [_self subviews].count;
        }else if ([self isKindOfClass:[CALayer class]]){
            
            return [_self sublayers].count;
        }
        
        //customer`s model
        //Obj∈NSObject|Obj∈...∈NSObject
        if(self.superclass == [NSObject class] || ![self.class classIsFoundation]){
            
            unsigned int outCount, i;
            objc_property_t* properties = class_copyPropertyList([self class], &outCount);
            
            for(i=0 ; i< outCount; i++){
                
                NSString* pName = @(property_getName(properties[i]));
                NSString *attrs = @(property_getAttributes(properties[i]));
                NSUInteger dotLoc = [attrs rangeOfString:@","].location;
                NSArray* attrInfos = [attrs componentsSeparatedByString:@","];
                NSString *code = nil;
                NSUInteger loc = 1;
                if (dotLoc == NSNotFound) { // 没有
                    code = [attrs substringFromIndex:loc];
                } else {
                    code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
                }
                
                if([attrInfos containsObject:@"R"]){//只读属性
                    continue;
                }
                else if (![[attrInfos.lastObject substringToIndex:1] isEqualToString:@"V"]){//无值
                    continue;
                }
                
                if ([code isEqualToString:@"@"]) {//id对象
                    
                    if([self valueForKey:pName]) goto CALL_RETURN_NO;
                    continue;
                } else if (code.length == 0) {
                    //KVCDisabled
                    continue;
                } else if (code.length > 3 && [code hasPrefix:@"@\""]) {//对象
                    
                    if([self valueForKey:pName]) goto CALL_RETURN_NO;
                    continue;
                } else if ([code isEqualToString:@":"] ||//SEL
                           [code isEqualToString:@"^{objc_ivar=}"] ||//ivar
                           [code isEqualToString:@"^{objc_method=}"] ||//Method
                           [code isEqualToString:@"@?"]) {//block
                    //KVCDisabled
                    continue;
                }
                else if([code isEqualToString:@(@encode(CGRect))]){
                    CGRect val = [[self valueForKey:pName] CGRectValue];
                    if(!CGRectEqualToRect(val, CGRectZero)) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(CGPoint))]){
                    CGPoint val = [[self valueForKey:pName] CGPointValue];
                    if(!CGPointEqualToPoint(val, CGPointZero)) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(CGSize))]){
                    CGSize val = [[self valueForKey:pName] CGSizeValue];
                    if(!CGSizeEqualToSize(val, CGSizeZero)) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(NSRange))]){
                    NSRange val = [[self valueForKey:pName] rangeValue];
                    if(!NSEqualRanges(val, NSMakeRange(0, 0))) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(UIEdgeInsets))]){
                    UIEdgeInsets val = [[self valueForKey:pName] UIEdgeInsetsValue];
                    if(!UIEdgeInsetsEqualToEdgeInsets(val, UIEdgeInsetsZero)) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(UIOffset))]){
                    UIOffset val = [[self valueForKey:pName] UIOffsetValue];
                    if(!UIOffsetEqualToOffset(val, UIOffsetZero)) goto CALL_RETURN_NO;
                    continue;
                }else if([code isEqualToString:@(@encode(CGVector))]){
                    CGVector val = [[self valueForKey:pName] CGVectorValue];
                    if(val.dx==0.0 && val.dy==0.0) goto CALL_RETURN_NO;
                    continue;
                }
                
                // 是否为数字类型
                NSString *lowerCode = code.lowercaseString;
                NSArray *numberTypes = @[@"i", @"s", @"c", @"b", @"f", @"d", @"l", @"q", @"c"];
                if ([numberTypes containsObject:lowerCode]) {
                    
                    NSNumber* number = [self valueForKey:pName];
                    if(![NSDecimalNumber.zero isEqualToNumber:number])
                        goto CALL_RETURN_NO;
                    continue;

                }
            }//for_end
            
            
            free(properties);
            return YES;
            
            CALL_RETURN_NO:
            free(properties);
                return NO;
        }
        
        return NO;
    };
}

- (NSObject *(^)(id))objRemove
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemove , obj)
        
        if([self isKindOfClass:[NSMutableArray class]] ||
           [self isKindOfClass:[NSMutableSet class]] ||
           [self isKindOfClass:[NSHashTable class]] ||
           [self isKindOfClass:[NSMutableOrderedSet class]]){
            
            [_self removeObject:obj];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            if(!_self.objIsMutable()){
                
                _self = [_self mutableCopy];
            }
            
            [_self replaceOccurrencesOfString:obj
                                   withString:@""
                                      options:0
                                        range:NSMakeRange(0, [_self length])];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            if([obj superview] == _self){
                
                [obj removeFromSuperview];
            }
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            if( [obj superlayer] == _self){
                
                [obj removeFromSuperlayer];
            }
        }else if ([self isKindOfClass:[NSMutableDictionary class]]){
            
            [_self removeObjectForKey:obj];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id))objRemoveFrom
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemoveFrom , obj)
        if(NSEqualNil(obj)) return _self;
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableSet class]]   ||
           [obj isKindOfClass:[NSHashTable class]]    ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj removeObject:_self];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj objIsMutable]() &&
                  [_self isKindOfClass:NSString.class]){
            
            [obj replaceOccurrencesOfString:_self
                                 withString:@""
                                    options:0
                                      range:NSMakeRange(0, [obj length])];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            if([_self superview] == obj){
                
                [_self removeFromSuperview];
            }
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            if([_self superlayer] == obj){
                
                [_self removeFromSuperlayer];
            }
        }else if ([obj isKindOfClass:[NSMutableDictionary class]]){
            
            [obj removeObjectForKey:_self];
        }
        
        return _self;
    };
}

- (NSObject *(^)(id))objRemoveFromAsWhatSet
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemoveFromAsWhatSet , obj)
        
        if([obj isKindOfClass:[NSMutableArray class]] ||
           [obj isKindOfClass:[NSMutableSet class]] ||
           [obj isKindOfClass:[NSHashTable class]] ||
           [obj isKindOfClass:[NSMutableOrderedSet class]]){
            
            [obj removeObject:_self];
        }else if ([self isKindOfClass:[NSString class]] &&
                  [obj isKindOfClass:[NSString class]]){
            
            if(![obj objIsMutable]()){
                
                obj = [obj mutableCopy];
            }
            [obj replaceOccurrencesOfString:_self
                                 withString:@""
                                    options:0
                                      range:NSMakeRange(0, [obj length])];
        }else if ([self isKindOfClass:[UIView class]] &&
                  [obj isKindOfClass:[UIView class]]){
            
            if([_self superview] == obj){
                
                [_self removeFromSuperview];
            }
        }else if ([self isKindOfClass:[CALayer class]] &&
                  [obj isKindOfClass:[CALayer class]]){
            
            if([_self superlayer] == obj){
                
                [_self removeFromSuperlayer];
            }
        }else if ([obj isKindOfClass:[NSMutableDictionary class]]){
            
            [obj removeObjectForKey:_self];
        }
        
        return linkObj(obj);
    };
}

- (NSObject *(^)(void))objCopy
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objCopy)
        return _self.copy;
    };
}

- (NSObject *(^)(void))objMutableCopy
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objMutableCopy)
        return _self.mutableCopy;
    };
}

- (NSObject *(^)(void))objNeedMutable
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objNeedMutable)
        
        if([_self conformsToProtocol:@protocol(NSMutableCopying)] &&
           [_self copy] == _self){
            
            return [_self mutableCopy];
        }
        return _self;
    };
}

- (NSObject *(^)(void))objCopyByArchive
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objCopyByArchive)
        if(![self conformsToProtocol:@protocol(NSCoding)]){
            return [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@必须实现NSCoding协议",_self]] logError];
        }
        NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:self];
        return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
    };
}

- (BOOL (^)(void))objIsMutable
{
    return ^BOOL(){
        return self.objIsMutableAs().boolValue;
    };
}
- (NSNumber *(^)(void))objIsMutableAs
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsMutableAs)
        return @([_self copy] != _self);
    };
}

#ifndef DefineKindOfClassAs
#define DefineKindOfClassAs(className) \
- (NSNumber* (^)(void))objIsKindOf##className##As\
{\
    return ^id(){\
        LinkHandle_REF(NSObject)\
        LinkGroupHandle_REF(objIsKindOf##className##As)\
        return @([_self isKindOfClass:[className class]]);\
    };\
}
#endif

DefineKindOfClassAs(NSString)
DefineKindOfClassAs(NSArray)
DefineKindOfClassAs(NSDictionary)
DefineKindOfClassAs(UIView)
DefineKindOfClassAs(NSValue)
DefineKindOfClassAs(NSNumber)

- (NSNumber *(^)(void))objIsNumberAs
{
    if([self isKindOfClass:[NSString class]]){
        return self.strIsNumberAs;
    }
    
    return self.valueIsNumber;
}

- (NSObject *(^)(void))objMutableCopyEnumerate
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objMutableCopyEnumerate)
        
        //not collection and immutable object
        if(![_self conformsToProtocol:@protocol(NSMutableCopying)] &&
           ![_self conformsToProtocol:@protocol(NSFastEnumeration)])
            return _self;
        
        BOOL isImmutable = !_self.objIsMutable();
        
        //mutable enable and single.(NSString,NSURLRequest,NSAttributeString...)
        if(![_self conformsToProtocol:@protocol(NSFastEnumeration)]){
            
            return isImmutable?[_self mutableCopy]:_self;
        }
        
        //collection that content can be modified
        if(![_self conformsToProtocol:@protocol(NSMutableCopying)]){
            
            id collection = _self;
            if([collection isKindOfClass:[NSMapTable class]]){
                
                id content = [collection dictionaryRepresentation].objMutableCopyEnumerate();
                [collection removeAllObjects];
                [content enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    [collection setObject:obj forKey:key];
                }];
            }else if([collection isKindOfClass:[NSHashTable class]]){
                
                id content = [collection allObjects];
                [collection removeAllObjects];
                [content enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    [collection addObject:obj];
                }];
            }
            
            //unknown
            return collection;
        }
        
        id mutableSelf = isImmutable?[_self mutableCopy]:_self;
        if ([_self isKindOfClass:[NSArray class]] ||
            [_self isKindOfClass:[NSSet class]] ||
            [_self isKindOfClass:[NSOrderedSet class]]){
            
            //content can from array
            NSMutableArray* content = NSMutableArrayNew;
            [((id)_self) enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
                
                [content addObject:[obj objNeedMutable]()];
            }];
            [mutableSelf removeAllObjects];//hold *
            [mutableSelf addObjectsFromArray:content];
            
        }else if ([_self isKindOfClass:[NSDictionary class]]){
            
            //immutable dictionary
            NSMutableDictionary* content = NSMutableDictionaryNew;
            [(id)_self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * stop) {
                
                [content setObject:[obj objNeedMutable]() forKey:key];
            }];
            [mutableSelf removeAllObjects];
            [mutableSelf addEntriesFromDictionary:content];
        }
        
        return mutableSelf;
    };
}

- (NSNumber *(^)(void))objIsCollectionAs
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsCollectionAs)
        
        if([_self conformsToProtocol:@protocol(NSFastEnumeration)]) return @YES;
        if([_self isKindOfClass:NSIndexSet.class]) return @YES;
        if([_self isKindOfClass:NSIndexPath.class]) return @YES;
        return @NO;
    };
}

- (BOOL (^)(void))objIsNSNull
{
    return ^BOOL(){
        return self.objIsNSNullAs().boolValue;
    };
}
- (NSNumber *(^)(void))objIsNSNullAs
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsNSNullAs)
        return @(self == [NSNull null]);
    };
}

- (BOOL (^)(id))objIsEqual
{
    return ^BOOL(id obj){
        return self.objIsEqualAs(obj).boolValue;
    };
}

- (NSNumber *(^)(id))objIsEqualAs
{
    return ^id(id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqualAs,obj)
        
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

- (NSNumber* (^)(id,...))objIsEqualToEachAs
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
    return ^BOOL(NSArray * objs){
        return self.objIsEqualToEachInArrayAs(objs).boolValue;
    };
}

- (NSNumber *(^)(NSArray *))objIsEqualToEachInArrayAs
{
    return ^id(NSArray * objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqualToEachInArrayAs,objs)
        
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
                return @NO;
            }
        }
        return @YES;
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

- (NSNumber* (^)(id, ...))objIsEqualToSomeoneAs
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
        return self.objIsEqualToSomeoneInArrayAs(objs).boolValue;
    };
}

- (NSNumber* (^)(NSArray *))objIsEqualToSomeoneInArrayAs
{
    return ^id(NSArray * objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsEqualToSomeoneInArrayAs,objs)
        
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

- (BOOL (^)( __unsafe_unretained Class))objIsKindOf
{
    return ^BOOL(Class clazz){
        return self.objIsKindOfAs(clazz).boolValue;
    };
}

- (NSNumber *(^)(__unsafe_unretained Class))objIsKindOfAs
{
    return ^id(Class clazz){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsKindOfAs,clazz)
        if(!clazz) return @NO;
        return @([_self.linkEnd isKindOfClass:clazz]);
    };
}

- (BOOL (^)( __unsafe_unretained Class))objIsMemberOfClass
{
    return ^(Class clazz){
        return self.objIsMemberOfClassAs(clazz).boolValue;
    };
}

- (NSNumber *(^)(__unsafe_unretained Class))objIsMemberOfClassAs
{
    return ^id(Class clazz){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsMemberOfClassAs,clazz)
        if(!clazz) return @NO;
        return @([_self.linkEnd isMemberOfClass:clazz]);
    };
}

- (BOOL (^)(__unsafe_unretained Class))objIsSubClassOf
{
    return ^(Class clazz){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsSubClassOf,clazz)
        if(!clazz) return NO;
        return [[_self.linkEnd class] isSubclassOfClass:clazz];
    };
}

- (NSNumber *(^)(__unsafe_unretained Class))objIsSubClassOfAs
{
    return ^id(Class clazz){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsSubClassOfAs,clazz)
        if(!clazz)
            return @NO;
        return @([[_self.linkEnd class] isSubclassOfClass:clazz]);
    };
}

- (NSObject *(^)(NSString *))objReverseValueForKey
{
    return ^id(NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objReverseValueForKey,key)
        
        //collection object
        if([_self conformsToProtocol:@protocol(NSFastEnumeration)]){
            
            if(
               [_self isKindOfClass:NSArray.class]      ||
               [_self isKindOfClass:NSMutableDictionary.class] ||
               [_self isKindOfClass:NSSet.class]        ||
               [_self isKindOfClass:NSOrderedSet.class] ){
                
                NSObject* temp = [NSObject new];
                temp.accessibilityValue = [_self valueForKey:key];
                if([temp.accessibilityValue isKindOfClass:NSArray.class]){
                    temp.accessibilityValue = [(id)temp.accessibilityValue firstObject];
                }
                temp.objReverseValueForKey(@"accessibilityValue");
                [_self setValue:temp.accessibilityValue forKey:key];
            }
            return _self;
        }
        
        // single object
        id value = [_self valueForKey:key];
        const char* objcType = [_self.class classGetPropertyType:key].UTF8String;
        
        [LinkHelper helpSwitchObjcType:objcType caseVoid:nil caseId:^{
            
            if([value isKindOfClass:[NSNumber class]]){
                
                [_self setValue:[value numReverse]() forKey:key];
            }else if ([value isKindOfClass:[NSString class]]){
                
                [_self setValue:[value strReversed]().mutableCopy forKey:key];
            }else if ([value isKindOfClass:[NSArray class]] ||
                      [value isKindOfClass:[NSOrderedSet class]]){
                
                id rValue = [value reverseObjectEnumerator].allObjects;
                if([value conformsToProtocol:@protocol(NSMutableCopying) ]){
                    rValue = [rValue mutableCopy];
                }
                [_self setValue:rValue forKey:key];
            }
        } caseClass:nil caseIMP:nil caseSEL:nil caseDouble:^{
            
            [_self setValue:@(-[value doubleValue]) forKey:key];
        } caseFloat:^{
            
            [_self setValue:@(-[value floatValue]) forKey:key];
        } casePointer:nil caseCharPointer:nil caseUnsignedLong:nil caseUnsignedLongLong:nil caseLong:^{
            
            [_self setValue:@(-[value longValue]) forKey:key];
        } caseLongLong:^{
            
            [_self setValue:@(-[value longLongValue]) forKey:key];
        } caseInt:^{
            
            [_self setValue:@(-[value intValue]) forKey:key];
        } caseUnsignedInt:nil caseBOOL_Char_xyShort:^{
            
            [_self setValue:@(![value boolValue]) forKey:key];
        } caseCGRect:^{
            
            CGRect rect = [value CGRectValue];
            CGSize size = rect.size;
            //exchange w and h
            size.width = size.width + size.height;
            size.height = size.width - size.height;
            size.width = size.width - size.height;
            rect.size = size;
            [_self setValue:[NSValue valueWithCGRect:rect] forKey:key];
        } caseNSRange:nil caseCGSize:^{
            
            CGSize size = [value CGSizeValue];
            //exchange w and h
            size.width = size.width + size.height;
            size.height = size.width - size.height;
            size.width = size.width - size.height;
            [_self setValue:[NSValue valueWithCGSize:size] forKey:key];
        } caseCGPoint:^{
            
            CGPoint point = [value CGPointValue];
            //exchange x and y
            point.x = point.x + point.y;
            point.y = point.x - point.y;
            point.x = point.x - point.y;
            [_self setValue:[NSValue valueWithCGPoint:point] forKey:key];
        } caseCGVector:^{
            
            CGVector v = [value CGVectorValue];
            //exchange dx and dy
            v.dx = v.dx + v.dy;
            v.dy = v.dx - v.dy;
            v.dx = v.dx - v.dy;
            [_self setValue:[NSValue valueWithCGVector:v] forKey:key];
        } caseUIEdgeInsets:^{
            
            UIEdgeInsets edge = [value UIEdgeInsetsValue];
            edge.top = edge.top + edge.bottom;
            edge.bottom = edge.top - edge.bottom;
            edge.top = edge.top - edge.bottom;
            edge.left = edge.left + edge.right;
            edge.right = edge.left - edge.right;
            edge.left = edge.left - edge.right;
            [_self setValue:[NSValue valueWithUIEdgeInsets:edge] forKey:key];
        } caseUIOffset:^{
            
            UIOffset offset = [value UIOffsetValue];
            //exchange x and y
            offset.horizontal = offset.horizontal + offset.vertical;
            offset.vertical   = offset.horizontal - offset.vertical;
            offset.horizontal = offset.horizontal - offset.vertical;
            [_self setValue:[NSValue valueWithUIOffset:offset] forKey:key];
        } caseCATransform3D:nil caseCGAffineTransform:nil caseNSDirectionalEdgeInsets:^{
            
            if (@available(iOS 11.0, *)) {
                NSDirectionalEdgeInsets edge = [value directionalEdgeInsetsValue];
                edge.top        = edge.top      + edge.bottom;
                edge.bottom     = edge.top      - edge.bottom;
                edge.top        = edge.top      - edge.bottom;
                edge.leading    = edge.leading  + edge.trailing;
                edge.trailing   = edge.leading  - edge.trailing;
                edge.leading    = edge.leading  - edge.trailing;
                [_self setValue:[NSValue valueWithDirectionalEdgeInsets:edge] forKey:key];
            }
        } defaule:nil];
        
        return _self;
    };
}

- (BOOL (^)(SEL))objIsRespondsSEL
{
    return ^(SEL theSEL){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsRespondsSEL,theSEL)
        if(theSEL){
            if([_self respondsToSelector:theSEL])
                return YES;
        }
        return NO;
    };
}

- (NSNumber *(^)(SEL))objIsRespondsSELAs
{
    return ^id(SEL theSEL){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsRespondsSELAs,theSEL)
        if(theSEL && [_self respondsToSelector:theSEL]) return @YES;
        return @NO;
    };
}

- (NSString *(^)(void))objToJsonString
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToJsonString)
        if(![NSJSONSerialization isValidJSONObject:_self])
            return @"";
        NSError* error;
        NSData * jsonData;
        if([self isKindOfClass:[NSString class]]){
            
            jsonData = [NSJSONSerialization JSONObjectWithData:[((id)_self) dataUsingEncoding:NSUTF8StringEncoding]
                                                       options:kNilOptions
                                                         error:&error];
        } else{
            
            jsonData = [NSJSONSerialization dataWithJSONObject:_self
                                                       options:kNilOptions
                                                         error:&error];
        }
        return error?[NSString new]:[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    };
}

- (NSNumber *(^)(void))objToNSNumber
{
    if ([self isKindOfClass:[NSString class]]){
        return self.strToNSNumber;
    }
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSNumber)
        
        if([_self isKindOfClass:[NSNumber class]]){
            return _self;
        }else if ([_self isKindOfClass:[JSValue class]]){
            return [(JSValue*)_self toNumber];
        }
        return @0;
    };
}

- (BOOL (^)(id))objIsKeyOfObjs
{
    return ^BOOL(id objs){
        return self.objIsKeyOfObjsAs(objs).boolValue;
    };
}
- (NSNumber* (^)(id))objIsKeyOfObjsAs
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsKeyOfObjsAs,objs)
        
        if(![_self respondsToSelector:@selector(keyEnumerator)]) return @NO;
        
        NSEnumerator* enumerator = [objs keyEnumerator];
        while ([enumerator.nextObject isEqual:_self]) return @YES;
        return @NO;
    };
}

- (NSObject *(^)())objToNSJsonObject
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSJsonObject,objs)
        
        return linkObjNotNil([_self _lb_obj2JsonValueDepth:NO includeFoundation:NO]);
    };
}

- (NSObject *(^)())objToNSJsonObjectDepth
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSJsonObjectDepth,objs)
        
        return linkObjNotNil([_self _lb_obj2JsonValueDepth:YES includeFoundation:NO]);
    };
}

- (NSObject *(^)())objToNSJsonObjectFoundation
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSJsonObjectFoundation,objs)
        
        return linkObjNotNil([_self _lb_obj2JsonValueDepth:NO includeFoundation:YES]);
    };
}

- (NSObject *(^)())objToNSJsonObjectDepthAndFoundation
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSJsonObjectDepthAndFoundation,objs)
        
        return linkObjNotNil([_self _lb_obj2JsonValueDepth:YES includeFoundation:YES]);
    };
}

- (NSDictionary *(^)())objToNSDictionary
{
//
//    if(!self.objIsCollectionAs().boolValue){
//        return (id)self.objToNSJsonObject;
//    }
    
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objToNSDictionary,objs)
        
        if([_self isKindOfClass:NSDictionary.class]) return _self;

        //collection object but unable to dictionary
        //avoid to enumerate
        if([self respondsToSelector:@selector(dictionaryRepresentation)] == NO
           &&  self.objIsCollectionAs().boolValue){
            return [NSDictionary new];
        }
        //single object
        id value = [_self _lb_obj2JsonValueDepth:NO includeFoundation:NO];
        if([value isKindOfClass:NSDictionary.class]) return value;
        return [NSDictionary new];
    };
}


/**
 转json value对象

 @param depth 深度遍历
 @param includeFoundation 解析Foundation属性（不安全的）
 @return ret∈{
                NSMutableDictionary,
                NSMutableArray,
                NSString,
                NSNumber,
                NSNull
            }
 */
- (id)_lb_obj2JsonValueDepth:(BOOL)depth
         includeFoundation:(BOOL)includeFoundation
{
    id _self = self;
    //direct foundation value
    if([self isKindOfClass:NSString.class]  ||
       [self isKindOfClass:NSNumber.class]  ||
       self == NSNull.null
       ){
        return _self;
    }
    //array able object so convert is to array
    if([self isKindOfClass:NSIndexPath.class]){
        return self.idxPathToNSArray();
    }
    if([self isKindOfClass:NSIndexSet.class]){
        
        _self = NSMutableArrayNew;
        [(NSIndexSet*)self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            [_self addObject:@(idx)];
        }];
        return _self;
    }
    
    //dictionary able collection then convert is to dictionary
    if([self isKindOfClass:NSDictionary.class]                      ||
       [self respondsToSelector:@selector(dictionaryRepresentation)]){
        
        id content;
        if([self respondsToSelector:@selector(dictionaryRepresentation)]){
            content = [_self dictionaryRepresentation];
        }else{
            content = [_self copy];
        }
        
        if(![self isKindOfClass:NSMutableDictionary.class])
            _self = NSMutableDictionaryNew;
        
        [content enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
            
            key = (depth==NO)
            ?obj
            :[obj _lb_obj2JsonValueDepth:depth includeFoundation:includeFoundation];
            [_self setObject:key forKey:key];
        }];
        
        return _self;
    }
    
    //array collection so convert is to array
    if([_self respondsToSelector:@selector(objectEnumerator)]){
        
        NSArray* content = [_self copy];
        if(![self isKindOfClass:NSMutableArray.class]){
            _self = NSMutableArrayNew;
        }else{
            [_self removeAllObjects];
        }
        
        NSEnumerator* enumerator = [content objectEnumerator];
        id item;
        while ((item = enumerator.nextObject)) {
            
            item = (depth==NO)
            ?item
            :[item _lb_obj2JsonValueDepth:depth includeFoundation:includeFoundation];
            [_self addObject:item];
        }
        return _self;
    }
    
    if(includeFoundation == NO && [[self class] classIsFoundation])
        return _self;
    
    //single object!so convert is to a dictionary
    NSMutableDictionary* dictionary = NSMutableDictionaryNew;
    NSArray<NSString*>* properties = [[_self class] classGetAllPropertyList:includeFoundation];
    @try {
        
        [properties enumerateObjectsUsingBlock:^(NSString* property, NSUInteger idx, BOOL * stop) {
            
            id value = [_self valueForKey:property];
            
            //nil , NSNull, custom Null has no key-value
            if(value == nil || [value isKindOfClass:NSNull.class])  return;
            
            //direct foundation value
            if([value isKindOfClass:NSString.class]  ||
               [value isKindOfClass:NSNumber.class]
               ){
                dictionary[property] = value;
                return;
            }
            
            BOOL valueIsFoundation = [[value class] classIsFoundation];
            if([value respondsToSelector:@selector(objectEnumerator)]           ||
               [value respondsToSelector:@selector(dictionaryRepresentation)]   ||
               [value isKindOfClass:NSIndexPath.class]                          ||
               [value isKindOfClass:NSIndexSet.class]                           ||
               valueIsFoundation == NO
               ){
                //collection type or custom object
                value = (depth==NO)
                ?value
                :[value _lb_obj2JsonValueDepth:depth includeFoundation:includeFoundation];
            }else if(valueIsFoundation && includeFoundation){
                
                //foundation type,such as UIView,NSError...
                value = [value description];
            } else{
                //is foundation but not include foundation
                return;
            }
            dictionary[property] = value;
        }];
    }@catch (NSException *exception) {
        
        NSLog(@"error from :%s,process of convert json value has been interrupted;NSException=%@;",__func__,[exception description]);
    }@finally {
        
        return dictionary;
    }
}

- (NSDictionary *(^)(NSArray *))objToNSDictionaryWithKeys
{
    return self.objKeyValueWithKeys;
}

- (BOOL (^)(void))objIsKindOfNSBlock
{
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(NSObject){
            return NO;
        }
        LinkGroupHandle_VAL(objIsKindOfNSBlock)
        return [_self isKindOfClass:NSClassFromString(@"NSBlock")];
    };
}

- (NSUInteger (^)(void))blockArgsCount
{
    return ^NSUInteger(){
        
        if(![self isKindOfClass:NSClassFromString(@"NSBlock")])
            return 0;
        
        LinkGroupHandle_VAL(blockArgsCount)
        
        LinkBlockInvocation* invocation = [LinkBlockInvocation invocationWithBlock:self];
        NSUInteger all = invocation.methodSignature.numberOfArguments;
        if(all < 2) return 0;
        return all - 1;
    };
}

- (const char *(^)(void))blockReturnType
{
    return ^const char *(){
        
        if(![self isKindOfClass:NSClassFromString(@"NSBlock")])
            return nil;
        
        LinkGroupHandle_VAL(blockReturnType)
        
        LinkBlockInvocation* invocation = [LinkBlockInvocation invocationWithBlock:self];
        return invocation.methodSignature.methodReturnType;
    };
}

- (Class (^)(void))objClass
{
    return ^id(){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(objClass)
        return [_self.linkEnd class];
    };
}

- (NSString *(^)(void))objClassName
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objClassName)
        return linkObjDefault(NSStringFromClass([_self class]) , @"");
    };
}

- (NSString *(^)(void))objSuperclassName
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSuperclassName)
        return linkObjDefault(NSStringFromClass([_self superclass]),@"");
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

- (NSObject *)linkFrom:(NSUInteger)from to:(NSUInteger)to block:(void (^)(NSUInteger, NSObject *))block
{
    LinkHandle_REF(NSObject)
    if([self isKindOfClass:[LinkGroup class]]){
        LinkGroup* group = (LinkGroup*)self;
        [group.linkObjects.arrObjsFromIndexTo(from,to) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(block){
                block(idx,obj);
            }
        }];
    }
    return self;
}

- (NSObject *)linkAt:(NSUInteger)idx block:(void (^)(NSObject *))block
{
    LinkHandle_REF(NSObject)
    if([self isKindOfClass:[LinkGroup class]]){
        if(block){
            LinkGroup* group = (id)self;
            if(idx<group.linkObjects.count-1){
                block(group.linkObjects[idx]);
            }
        }
    }
    return self;
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
        return group;
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
        return group;
    }
    return [[LinkReturn alloc] initWithReturnValue:self returnType:LinkReturnLink];
}

- (NSObject *(^)(void))nslog
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslog)
        NSLog(@"%@",_self);
        return _self;
    };
}


- (NSObject *)logRetainCount
{
    NSLog(@"%@",[self valueForKey:@"retainCount"]);
    return self;
}

- (NSObject *(^)(void))poDetail
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(poDetail)
        NSLog(@"%@",[self _lb_obj2JsonValueDepth:YES includeFoundation:NO]);
        return _self;
    };
}

- (NSObject *(^)(void))po
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(po)
        NSLog(@"%@",[self _lb_obj2JsonValueDepth:NO includeFoundation:NO]);
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
        }
        return self;
    };
}

- (NSObject* (^)(id))objValueForKey
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(objValueForKey,key)
        return linkObjNotNil([_self valueForKey:key]);
    };
}

- (NSObject *(^)(id, NSString* ))objSetValueForKey
{
    return ^id(id value, NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetValueForKey,value,key)
        [_self setValue:value forKey:key];
        return _self;
    };
}

- (NSObject *(^)(NSString *))objValueForKeyPath
{
    return ^id(NSString* key){
        LinkHandle_VAL_IFNOT(NSObject){
            return nil;
        }
        LinkGroupHandle_VAL(objValueForKeyPath,key)
        return linkObjNotNil([_self valueForKeyPath:key]);
    };
}

- (NSObject *(^)(id , NSString* ))objSetValueForKeyPath
{
    return ^id(id value, NSString* key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetValueForKeyPath,value,key)
        [_self setValue:value forKeyPath:key];
        return self;
    };
}

- (NSObject *(^)(NSDictionary<NSString *,id> *))objSetValuesWithKeyValues
{
    return ^id(NSDictionary<NSString *,id> * kvs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetValuesWithKeyValues,kvs)
        [_self setValuesForKeysWithDictionary:kvs];
        return self;
    };
}

- (NSDictionary *(^)(NSArray<NSString *> *))objKeyValueWithKeys
{
    return ^id(NSArray<NSString *> * keys){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objKeyValueWithKeys,keys)
        
        return linkObjNotNil([_self dictionaryWithValuesForKeys:keys]);
    };
}

- (NSObject *(^)(id))objSetNilForKey
{
    return ^id(id asKey){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetNilForKey,asKey)
        
        if([asKey isKindOfClass:NSArray.class]){
            [asKey enumerateObjectsUsingBlock:^(id  obj,NSUInteger idx, BOOL* stop) {
                [_self setValue:nil forKey:asKey];
            }];
        }else{
            [_self setValue:nil forKey:asKey];
        }
        return _self;
    };
}

- (NSObject *(^)(id,NSUInteger))objSetRandomStringForKey
{
    return ^id(id key,NSUInteger len){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomStringForKey,key,len)
        
        int count;
        id aKey;
        NSMutableString* text = [NSMutableString new];
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        NSUInteger pageCount = (len+32-1)/32;
        NSUInteger lastPageLen = len%32;
        
        for (NSUInteger i=0; i<pageCount; i++) {
            
            id newStr = [[NSUUID UUID].UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
            
            if(lastPageLen!=0 && i==pageCount-1){//last
                
                [text appendString:[newStr substringToIndex:len%32]];
                break;
            }
            [text appendString:newStr];
        }
        
        [_self setValue:[text mutableCopy] forKey:aKey];
        [text deleteCharactersInRange:NSMakeRange(0, text.length)];//clean
        goto CALL_FOR;
    };
}

- (NSObject *(^)(id,NSUInteger))objSetRandomStringzh_CNForKey
{
    return ^id(id key,NSUInteger len){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomStringzh_CNForKey,key,len)
        
        int count;
        id aKey;
        NSMutableString* text = [NSMutableString new];
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        
        NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSInteger randomH,randomL,number;
        for(NSInteger i =0; i < len; i++){
            
            randomH = 0xA1 + arc4random()%((0xFE)-(0xA1)+1);//高位
            randomL =0xB0 + arc4random()%(0xF7-0xB0+1);//低位
            number = (randomH<<8)+randomL;//组合
            [text appendString:[[NSString alloc]initWithData:[NSData dataWithBytes:&number length:2]
                                                    encoding:gbkEncoding]];
        }
        
        [_self setValue:text forKey:aKey];
        [text deleteCharactersInRange:NSMakeRange(0, text.length)];//clean
        
        goto CALL_FOR;
    };
}

- (NSObject *(^)(id,NSUInteger))objSetRandomStringNumberForKey
{
    return ^id(id key,NSUInteger len){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomStringNumberForKey,key,len)
        
        int count;
        id aKey;
        NSMutableString* text = [NSMutableString new];
        
        NSArray* charNums = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        uint32_t idx = 0;
        for(NSInteger i=0; i < len; i++){
            
            idx = arc4random_uniform(10);
            if(i==0 && idx==0){
                --i;
                continue;
            }
            [text appendString:charNums[idx]];
        }
        
        [_self setValue:text forKey:aKey];
        [text deleteCharactersInRange:NSMakeRange(0, text.length)];//clean
        
        goto CALL_FOR;
    };
}

- (NSObject *(^)(id, uint32_t))objSetRandomNumberForKey
{
    return ^id(id key , uint32_t max){
        
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomNumberForKey,key,max)
        
        int count;
        id aKey;
        NSNumber* number;
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        number = [NSNumber numberWithInteger:arc4random_uniform(max)];
        [_self setValue:number forKey:aKey];
        
        goto CALL_FOR;
    };
}

- (NSObject *(^)(id, id))objSetRandomDateForKey
{
    return ^id(id key, id days){
        
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomDateForKey,key,days)
        
        double lOffset = 0,rOffset = 0;
        
        if ([days isKindOfClass:NSArray.class] && [days count] == 2){
            
            lOffset = [[days firstObject] doubleValue];
            rOffset = [[days lastObject] doubleValue];
        }else{
            
            NSTimeInterval ds = 0;
            if([days isKindOfClass:NSArray.class] && [days count] == 1){
                
                ds = [[days firstObject] doubleValue];
            }else if([days isKindOfClass:NSNumber.class]){
                
                ds = [days doubleValue];
            }
            //jump ds == 0
            lOffset = ds<0?ds:0;
            rOffset = ds>0?ds:0;
        }
        
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        int count;
        id aKey;
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        //left~right -> 0~offset-left
        
        double offset = arc4random_uniform((rOffset - lOffset)*86400.0) + lOffset*86400.0;
        offset = offset?offset:(-(double)arc4random_uniform(86400));
        [_self setValue:[NSDate dateWithTimeIntervalSince1970:now+offset]
                 forKey:aKey];
        
        goto CALL_FOR;
    };
}

- (NSObject *(^)(id, uint32_t, NSUInteger))objSetRandomDoubleForKey
{
    return ^id(id key, uint32_t max, NSUInteger rightLen){
        
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetRandomDoubleForKey,key,max,rightLen)
        
        int count;
        id aKey;
        NSDecimalNumber* number;
        
        if([key isKindOfClass:[NSArray class]]){
            
            count = (int)[key count];
        }else{
            
            count = 1;
            aKey = key;
            goto CALL_SETVALUE;
        }
        
    CALL_FOR:
        
        if(count < 1) return _self;
        
        aKey = key[count-1];
        
    CALL_SETVALUE://in:count,aKey
        
        --count;
        uint32_t integer = arc4random_uniform(max);
        uint32_t decimal = arc4random_uniform(pow(10, rightLen));
        number = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%d.%d",integer,decimal]];
        [_self setValue:number forKey:aKey];
        
        goto CALL_FOR;
    };
}


- (NSObject *(^)(id))objGetPrevItemFromObjs
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objGetPrevItemFromObjs,objs)
        
        if([objs isKindOfClass:NSArray.class]   ||
           [objs isKindOfClass:NSOrderedSet.class]) {
            
            NSInteger idx = [objs indexOfObject:_self];
            if(idx != NSNotFound && idx-1 >= 0){
                return [objs objectAtIndex:idx-1];
            }
            goto CALL_RET;
        }else if([_self isKindOfClass:NSNumber.class]   &&
                 [objs isKindOfClass:NSIndexSet.class]){
            
                return @([objs indexLessThanIndex:[(id)_self unsignedIntegerValue]]);
        }
        
    CALL_RET:
        return [NSNull null];
    };
}

- (NSObject *(^)(id))objGetNextItemFromObjs
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objGetNextItemFromObjs,objs)

        if([objs isKindOfClass:NSArray.class]   ||
           [objs isKindOfClass:NSOrderedSet.class]) {
            
            NSUInteger idx = [objs indexOfObject:_self];
            if(idx != NSNotFound && idx+1 <= [objs count]-1){
                return [objs objectAtIndex:idx+1];
            }
            goto CALL_RET;
        }else if([_self isKindOfClass:NSNumber.class]   &&
                 [objs isKindOfClass:NSIndexSet.class]){
            
            return @([objs indexGreaterThanIndex:[(id)_self unsignedIntegerValue]]);
        }
        
    CALL_RET:
        return [NSNull null];
    };
}

- (BOOL (^)(id))objIsSubitemOfObjs
{
    return ^BOOL(id objs){
        return self.objIsSubitemOfObjsAs(objs).boolValue;
    };
}
- (NSNumber* (^)(id))objIsSubitemOfObjsAs
{
    return ^id(id objs){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objIsSubitemOfObjsAs, objs)
        
        //content that have collection
        
        if([objs respondsToSelector:@selector(objectEnumerator)]){
            
            NSEnumerator* enumerator = [objs objectEnumerator];
            while([_self isEqual:enumerator.nextObject])
                return @YES;
        }
        
        //indexSet
        if([_self isKindOfClass:NSNumber.class]){
            
            if([objs isKindOfClass:NSIndexSet.class]){
                return @([objs containsIndex:[(id)_self unsignedIntegerValue]]);
            }
        }
        
        return @NO;
    };
}

- (NSNumber *(^)(id))objIsSubitemOfObjAs
{
        return ^id(id obj){
            
            LinkHandle_REF(NSObject)
            LinkGroupHandle_REF(objIsSubitemOfObjAs, obj)
            
            id objs;
            //string content
            if([obj isKindOfClass:NSAttributedString.class]     ||
               [obj isKindOfClass:UIPasteboard.class]           ||
               [obj isKindOfClass:NSScanner.class]
               ){
                obj = [obj string];
            }
            if([obj isKindOfClass:NSString.class]){
                
                if([(id)_self isKindOfClass:NSAttributedString.class]   ||
                   [(id)_self isKindOfClass:UIPasteboard.class]         ||
                   [(id)_self isKindOfClass:NSScanner.class]){
                    _self = [(id)_self string];
                }
                
                if([_self isKindOfClass:NSString.class])
                    return @([obj containsString:(id)_self]);
                
                return @NO;
            }
            else if([obj isKindOfClass:UIView.class])
                objs = [(id)_self subviews];
            else if([obj isKindOfClass:UIViewController.class])
                objs = [(id)_self childViewControllers];
            else if([obj isKindOfClass:CALayer.class])
                objs = [(id)_self sublayers];
            
            return self.objIsSubitemOfObjsAs(objs);
        };
}

#define Link_objSetValueForK(key) \
- (NSObject *(^)(id))objSetValueForK##key\
{\
    return ^id(id value){\
        LinkHandle_REF(NSObject)\
        LinkGroupHandle_REF(objSetValueForK##key, value)\
        [_self setValue:value forKey:@""#key""];\
        return _self;\
    };\
}

Link_objSetValueForK(delegate)
Link_objSetValueForK(dataSource)
Link_objSetValueForK(text)

- (NSObject *(^)(void))objSetAllValuesBlank
{
    return ^id(){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetAllValuesBlank)
        
        unsigned int outCount, i;
        objc_property_t* properties = class_copyPropertyList([self class], &outCount);
        for(i=0 ; i< outCount; i++){
            
            NSString* pName = @(property_getName(properties[i]));
            NSString *attrs = @(property_getAttributes(properties[i]));
            NSUInteger dotLoc = [attrs rangeOfString:@","].location;
            NSArray* attrInfos = [attrs componentsSeparatedByString:@","];
            NSString *code = nil;
            NSUInteger loc = 1;
            if (dotLoc == NSNotFound) { // 没有
                code = [attrs substringFromIndex:loc];
            } else {
                code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
            }
            
            if([attrInfos containsObject:@"R"]){//只读属性
                continue;
            }
            else if (![[attrInfos.lastObject substringToIndex:1] isEqualToString:@"V"]){//无值
                continue;
            }
            
            if ([code isEqualToString:@"@"]) {
                //id
                [_self setValue:nil forKey:pName];
                continue;
            } else if (code.length == 0) {
                //KVCDisabled
                continue;
            } else if (code.length > 3 && [code hasPrefix:@"@\""]) {//对象
                [_self setValue:nil forKey:pName];
            } else if ([code isEqualToString:@":"] ||//SEL
                       [code isEqualToString:@"^{objc_ivar=}"] ||//ivar
                       [code isEqualToString:@"^{objc_method=}"] ||//Method
                       [code isEqualToString:@"@?"]) {//block
                //KVCDisabled
                continue;
            }else if([code isEqualToString:@(@encode(CGRect))]){
                [_self setValue:[NSValue valueWithCGRect:CGRectZero] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(CGPoint))]){
                [_self setValue:[NSValue valueWithCGPoint:CGPointZero] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(CGSize))]){
                [_self setValue:[NSValue valueWithCGSize:CGSizeZero] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(NSRange))]){
                [_self setValue:[NSValue valueWithRange:NSMakeRange(0, 0)] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(UIEdgeInsets))]){
                [_self setValue:[NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(UIOffset))]){
                [_self setValue:[NSValue valueWithUIOffset:UIOffsetZero] forKey:pName];
                continue;
            }else if([code isEqualToString:@(@encode(CGVector))]){
                [_self setValue:[NSValue valueWithCGVector:CGVectorMake(0, 0)] forKey:pName];
                continue;
            }
            
            
            // 是否为数字类型
            NSString *lowerCode = code.lowercaseString;
            NSArray *numberTypes = @[@"i", @"s", @"c", @"b", @"f", @"d", @"l", @"q", @"c"];
            if ([numberTypes containsObject:lowerCode]) {
                //numberType
                [_self setValue:@0 forKey:pName];
                if ([lowerCode isEqualToString:@"c"]  || [lowerCode isEqualToString:@"b"]) {
                    //boolType
                    [_self setValue:@NO forKey:pName];
                }
            }
        }
        
        free(properties);
        return _self;
    };
}

- (NSObject *(^)(SEL sel))objPerformSelector
{
    return ^id(SEL sel){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objPerformSelector, sel)
        if([_self respondsToSelector:sel]){
            [_self _lb_performSelector:sel];
        }else{
            NSLog(@"LinkBlock:%@未能找到方法:%@",self,NSStringFromSelector(sel));
        }
        return _self;
    };
}

- (NSObject *(^)(SEL))objPerformSelectorAsWhatReturn
{
    return ^id(SEL sel){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objPerformSelectorAsWhatReturn, sel)
        if(![_self respondsToSelector:sel]){
            [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",_self,NSStringFromSelector(sel)]] logError];
        }
        return LBObjcValue([_self _lb_performSelector:sel withArg:nil]);
    };
}

- (NSObject *(^)(SEL, id))objPerformSelectorArgument
{
    return ^id(SEL sel , id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objPerformSelectorArgument, sel , obj)
        if([_self respondsToSelector:sel]){
            [_self _lb_performSelector:sel withObject:obj];
        }else{
            [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",_self,NSStringFromSelector(sel)]] logError];
        }
        return _self;
    };
}

- (NSObject *(^)(SEL, id))objPerformSelectorArgumentAsWhatReturn
{
    return ^id(SEL sel , id obj){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objPerformSelectorArgumentAsWhatReturn, sel , obj)
        if(![_self respondsToSelector:sel]){
            [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",_self,NSStringFromSelector(sel)]] logError];
        }
        return LBObjcValue([_self _lb_performSelector:sel withArg:obj]);
    };
}

- (NSObject *(^)(SEL , ...))objPerformSelectors
{
    return ^id(SEL sel , ...){
        LinkHandle_REF(NSObject)
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            if([group.linkObjects.firstObject respondsToSelector:sel]){
                [group.linkObjects.firstObject _lb_performSelector:sel];
            }else{
                [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",group.linkObjects.firstObject,NSStringFromSelector(sel)]] logError];
            }
            va_list args;
            va_start(args, sel);
            SEL parm;
            while ((parm = va_arg(args, SEL))) {
                for (int i=1; i<group.linkObjects.count; i++) {
                    if([group.linkObjects[i] respondsToSelector:parm]){
                        [group.linkObjects[i] _lb_performSelector:parm];
                    }else{
                        [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",group.linkObjects[i],NSStringFromSelector(sel)]] logError];
                    }
                }
            }
            va_end(args);
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        if([_self respondsToSelector:sel]){
            [_self _lb_performSelector:sel];
        }else{
            [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",self,NSStringFromSelector(sel)]] logError];
        }
        va_list args;
        va_start(args, sel);
        SEL parm;
        while ((parm = va_arg(args, SEL))) {
            if([_self respondsToSelector:parm]){
                [_self _lb_performSelector:parm];
            }else{
                [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@不能响应方法:%@",self,NSStringFromSelector(sel)]] logError];
            }
        }
        va_end(args);
        
        return _self;
    };
}

- (NSArray *(^)(SEL, ...))objPerformSelectorsAsWhatReturns
{
    return ^id(SEL sel , ...){
        LinkHandle_REF(NSObject)
        NSMutableArray* results = NSMutableArrayNew;
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            [results addObject: LBObjcValue([group.linkObjects.firstObject _lb_performSelector:sel withArg:nil])];
            va_list args;
            va_start(args, sel);
            SEL parm;
            while ((parm = va_arg(args, SEL))) {
                for (int i=1; i<group.linkObjects.count; i++) {
                    [results addObject: LBObjcValue([group.linkObjects[i] _lb_performSelector:parm withArg:nil])];
                }
            }
            va_end(args);
            [group.linkObjects setArray:results];
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        [results addObject: LBObjcValue([_self _lb_performSelector:sel withArg:nil])];
        va_list args;
        va_start(args, sel);
        SEL parm;
        while ((parm = va_arg(args, SEL))) {
            [results addObject: LBObjcValue([_self _lb_performSelector:parm withArg:nil])];
        }
        va_end(args);
        
        return results;
    };
}

- (NSObject *(^)(SEL , NSArray* , ...))objPerformsSelectorArguments
{
    return ^id(SEL sel0 , NSArray* args0 , ...){
        LinkHandle_REF(NSObject)
        SEL currentSEL;
        NSArray* currentArgs;
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            currentSEL = sel0; currentArgs = args0;
            [group.linkObjects.firstObject _lb_performSelector:currentSEL withArgs:currentArgs];
            currentSEL = nil; currentArgs = nil;
            for (int idx=1 ; idx<group.linkObjects.count; idx++) {
                
                va_list args;
                va_start(args , args0);
                int i = 0;
                while (true) {
                    
                    if(i%2 == 0){//偶数取方法
                        
                        if(currentSEL && currentArgs){
                            [group.linkObjects[i] _lb_performSelector:currentSEL withArgs:currentArgs];
                            currentArgs = nil;
                        }
                        currentSEL = va_arg(args, SEL);
                        if(!currentSEL) break;
                    }else{//取参数
                        
                        currentArgs = va_arg(args, NSArray*);
                        if(!currentArgs) break;
                    }
                    ++i;
                }
                va_end(args);
            }
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        currentSEL = sel0; currentArgs = args0;
        [_self _lb_performSelector:currentSEL withArgs:currentArgs];
        currentSEL = nil; currentArgs = nil;
        
        va_list args;
        va_start(args , args0);
        int i = 0;
        while (true) {
            
            if(i%2 == 0){//偶数取方法
                
                if(currentSEL && currentArgs){
                    [_self _lb_performSelector:currentSEL withArgs:currentArgs];
                    currentArgs = nil;
                }
                currentSEL = va_arg(args, SEL);
                if(!currentSEL) break;
            }else{//取参数
                
                currentArgs = va_arg(args, NSArray*);
                if(!currentArgs) break;
            }
            ++i;
        }
        va_end(args);
        return self;
    };
}

- (NSArray *(^)(SEL , NSArray* , ...))objPerformsSelectorArgumentsAsWhatReturns
{
    return ^id(SEL sel0 , NSArray* args0 , ...){
        
        LinkHandle_REF(NSObject)
        NSMutableArray* result = NSMutableArrayNew;
        SEL currentSEL;
        NSArray* currentArgs;
        ///////////////////////
        //LinkGroupHandle_REF
        if([self isKindOfClass:[LinkGroup class]]){
            LinkGroup* group = (LinkGroup*)self;
            currentSEL = sel0; currentArgs = args0;
            [group.linkObjects.firstObject _lb_performSelector:currentSEL withArgs:currentArgs];
            currentSEL = nil; currentArgs = nil;
            for (int idx=1 ; idx<group.linkObjects.count; idx++) {
                
                va_list args;
                va_start(args , args0);
                int i = 0;
                while (true) {
                    
                    if(i%2 == 0){//偶数取方法
                        
                        if(currentSEL && currentArgs){
                            [result addObject: LBObjcValue([group.linkObjects[i] _lb_performSelector:currentSEL withArgs:currentArgs])];
                            currentArgs = nil;
                        }
                        currentSEL = va_arg(args, SEL);
                        if(!currentSEL) break;
                    }else{//取参数
                        
                        currentArgs = va_arg(args, NSArray*);
                        if(!currentArgs) break;
                    }
                    ++i;
                }
                va_end(args);
            }
            [group.linkObjects setArray:result];
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        currentSEL = sel0; currentArgs = args0;
        [result addObject: LBObjcValue([_self _lb_performSelector:currentSEL withArgs:currentArgs])];
        currentSEL = nil; currentArgs = nil;
        
        va_list args;
        va_start(args , args0);
        int i = 0;
        while (true) {
            
            if(i%2 == 0){//偶数取方法
                
                if(currentSEL && currentArgs){
                    [result addObject: LBObjcValue([_self _lb_performSelector:currentSEL withArgs:currentArgs])];
                    currentArgs = nil;
                }
                currentSEL = va_arg(args, SEL);
                if(!currentSEL) break;
            }else{//奇数取参数
                
                currentArgs = va_arg(args, NSArray*);
                if(!currentArgs) break;
            }
            ++i;
        }
        va_end(args);
        return result;
    };
}

- (CFIndex)objRetainCount
{
    return [[self valueForKey:@"retainCount"] longValue];
}
#pragma mark - 类型转换

#ifndef LBMarcoLinkTransType
#define LBMarcoLinkTransType(ReType) \
- (ReType *)as##ReType \
{ \
    return (id)self; \
}
#endif

LBMarcoLinkTransType(NSString)
LBMarcoLinkTransType(NSMutableString)
LBMarcoLinkTransType(NSArray)
LBMarcoLinkTransType(NSMutableArray)
LBMarcoLinkTransType(NSDictionary)
LBMarcoLinkTransType(NSMutableDictionary)
LBMarcoLinkTransType(NSAttributedString)
LBMarcoLinkTransType(NSMutableAttributedString)
LBMarcoLinkTransType(NSURL)
LBMarcoLinkTransType(NSUserDefaults)
LBMarcoLinkTransType(NSNumber)
LBMarcoLinkTransType(NSValue)
LBMarcoLinkTransType(NSDate)
LBMarcoLinkTransType(NSData)
LBMarcoLinkTransType(UIView)
LBMarcoLinkTransType(UILabel)
LBMarcoLinkTransType(UIControl)
LBMarcoLinkTransType(UIButton)
LBMarcoLinkTransType(UIScrollView)
LBMarcoLinkTransType(UIImage)
LBMarcoLinkTransType(UIColor)
LBMarcoLinkTransType(UIViewController)
LBMarcoLinkTransType(UIImageView)
LBMarcoLinkTransType(UITableView)
LBMarcoLinkTransType(UITextField)
LBMarcoLinkTransType(UITextView)
LBMarcoLinkTransType(UIWebView)
LBMarcoLinkTransType(NSMutableSet)
LBMarcoLinkTransType(NSSet)
LBMarcoLinkTransType(NSCalendar)
LBMarcoLinkTransType(CALayer)

- (void)_lb_performSelector:(SEL)aSelector
{
    [self performSelector:aSelector];
}

- (void)_lb_performSelector:(SEL)aSelector withObject:(id)obj
{
    [self performSelector:aSelector withObject:obj];
}

- (id)_lb_performSelector:(SEL)aSelector withArg:(id)arg
{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    if (signature == nil) {
        return [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@未能找到方法:%@",self,NSStringFromSelector(aSelector)]] logError];
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    if(signature.numberOfArguments>2)
        [invocation setArgument:&arg atIndex:2];//去掉self,_cmd所以从2开始
    [invocation invoke];
    id __unsafe_unretained returnValue;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    return returnValue;
}

- (id)_lb_performSelector:(SEL)aSelector withArgs:(NSArray*)args
{
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    if (signature == nil) {
        return [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"%@未能找到方法:%@",self,NSStringFromSelector(aSelector)]] logError];
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    NSInteger paramsCount = signature.numberOfArguments - 2;// 获取除去self、_cmd以外的参数个数
    for (NSInteger idx = 0; idx < paramsCount; idx++) {
        if(idx >= paramsCount) break ;//越界检测
        id arg = nil;
        if(args.count && idx<args.count && args[idx] != [NSNull null]){
            arg = args[idx];
        }
        [invocation setArgument:&arg atIndex:idx+2];// 去掉self、_cmd所以从2开始
        [invocation retainArguments];
    }
    [invocation invoke];
    id __unsafe_unretained returnValue;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnValue];
    }
    return returnValue;
}
@end
