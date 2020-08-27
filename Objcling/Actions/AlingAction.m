//
//  AlingAction.m
//  Objcling
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>
#import <objc/message.h>
#import "AlingAction.h"
#import "TlingErr.h"

/// Class : Index : EncodeString
static NSMapTable *_cached_encode;

id getBoxedRevar(NSInvocation *invoaction,const char *objcType);

NS_INLINE bool pasValue2Ivk(__kindof AlingAction *act, NSInvocation *invoaction,const char *objcType, NSUInteger idx);

@implementation AlingAction

- (NSUInteger)count {
    return 0;
}


- (SEL)forwardSEL {
    return nil;
}

+ (const char *)encodeAt:(NSInteger)idx {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _cached_encode = [NSMapTable mapTableWithKeyOptions: NSPointerFunctionsOpaqueMemory | NSPointerFunctionsOpaquePersonality valueOptions: NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPersonality];
    });
    NSString *code;
    NSMutableDictionary *cmap = [_cached_encode objectForKey:self];
    if(cmap) {
        if((code = cmap[@(idx)])) {
        CALL_RET:
            return code.UTF8String;
        }
    } else {
        cmap = [NSMutableDictionary dictionary];
        [_cached_encode setObject:cmap forKey:self];
    }
    NSString *pnam = (idx == -1) ? @"atN" : [NSString stringWithFormat:@"at%ld",idx];
    objc_property_t p = class_getProperty(self, pnam.UTF8String);
    NSString *ats = @(property_getAttributes(p));
    NSUInteger doc = [ats rangeOfString:@","].location;
    NSUInteger loc = 1;
    if (doc == NSNotFound) {
        code = [ats substringFromIndex:loc];
    } else {
        code = [ats substringWithRange:NSMakeRange(loc, doc - loc)];
    }
    cmap[@(idx)] = code;
    goto CALL_RET;
}

- (id)sendMsg:(TlingErr * _Nullable __autoreleasing *)err {
    if(!self.target || ![self forwardSEL]) return nil;
    NSMethodSignature *sig  = [[self.target class] instanceMethodSignatureForSelector:[self forwardSEL]];
    if(!sig) {
        *err = [TlingErr.alloc init];
        return nil;
    }
    NSInvocation *ivk = [NSInvocation invocationWithMethodSignature:sig];
    for (NSUInteger i = 2; i < self.count; i++) {
        const char * code = [self.class encodeAt:i];
        if(!pasValue2Ivk(self, ivk, code, i)) {
            *err = [TlingErr.alloc init];
        }
    }
    [ivk invokeWithTarget:self.target];
    if([self conformsToProtocol:@protocol(TlingBroken)]) {
        return getBoxedRevar(ivk, sig.methodReturnType);
    }
    return nil;
}

//+ (Class)assoClass {
//    static Class _value;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        id v = [NSStringFromClass(self) componentsSeparatedByString:@"_"].firstObject;
//        _value = NSClassFromString(v);
//    });
//    return _value;
//}

+ (SEL)associatedSEL {
    static SEL _value;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id v = [NSStringFromClass(self) componentsSeparatedByString:@"_"].lastObject;
        _value = NSSelectorFromString(v);
    });
    return _value;
}

@end

NS_INLINE bool pasValue2Ivk(__kindof AlingAction *act, NSInvocation *invoaction,const char *objcType, NSUInteger idx) {
    if(!objcType) return false;
    SEL getter = NSSelectorFromString([NSString stringWithFormat:@"at%ld",idx]);
    do{
        //常量则位移到类型符
        if (objcType[0] == _C_CONST) objcType++;
        if (objcType[0] == _C_ID) { //id and block
            id v = ((id(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(Class)) == 0){       //Class
            Class v = ((Class(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(IMP)) == 0 ){         //IMP
            IMP v = ((IMP(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(SEL)) == 0) {         //SEL
            SEL v = ((SEL(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(double)) == 0){       //double
            double v = ((double(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(float)) == 0){       //float
            float v = ((float(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (objcType[0] == '^'){                           //pointer ( and const pointer)
            void* v = ((void*(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(char *)) == 0) {      //char* (and const char*)
            char * v = ((char *(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(unsigned long)) == 0) {
            unsigned long v = ((unsigned long(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(unsigned long long)) == 0) {
            unsigned long long v = ((unsigned long long(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(long)) == 0) {
            long v = ((long(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(long long)) == 0) {
            long long v = ((long long(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(int)) == 0) {
            int v = ((int(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if (strcmp(objcType, @encode(unsigned int)) == 0) {
            unsigned int v = ((unsigned int(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else if ((strcmp(objcType, @encode(bool)) == 0           ||
                   strcmp(objcType, @encode(BOOL)) == 0           ||
                   strcmp(objcType, @encode(char)) == 0           ||
                   strcmp(objcType, @encode(short)) == 0          ||
                   strcmp(objcType, @encode(unsigned char)) == 0  ||
                   strcmp(objcType, @encode(unsigned short)) == 0)){
            short v = ((short(*)(id,SEL))objc_msgSend)(act,getter);
            [invoaction setArgument:&v atIndex:idx];
            break;
        }else{
            //struct union and array
            if (strcmp(objcType, @encode(CGRect)) == 0){
                CGRect v = ((CGRect(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if(strcmp(objcType, @encode(CGPoint)) == 0){
                CGPoint v = ((CGPoint(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if (strcmp(objcType, @encode(CGSize)) == 0){
                CGSize v = ((CGSize(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if (strcmp(objcType, @encode(NSRange)) == 0){
                NSRange v = ((NSRange(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if (strcmp(objcType, @encode(UIEdgeInsets)) == 0){
                UIEdgeInsets v = ((UIEdgeInsets(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if (strcmp(objcType, @encode(CGVector)) == 0){
                CGVector v = ((CGVector(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if (strcmp(objcType, @encode(UIOffset)) == 0){
                UIOffset v = ((UIOffset(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if(strcmp(objcType, @encode(CATransform3D)) == 0){
                CATransform3D v = ((CATransform3D(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }else if(strcmp(objcType, @encode(CGAffineTransform)) == 0){
                CGAffineTransform v = ((CGAffineTransform(*)(id,SEL))objc_msgSend)(act,getter);
                [invoaction setArgument:&v atIndex:idx];
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(objcType, @encode(NSDirectionalEdgeInsets)) == 0){
                    NSDirectionalEdgeInsets v = ((NSDirectionalEdgeInsets(*)(id,SEL))objc_msgSend)(act,getter);
                    [invoaction setArgument:&v atIndex:idx];
                    break;
                }
            }
        }
        return false;
    }while(0);
    return true;
}

/// Get boxed return value
id getBoxedRevar(NSInvocation *ivk,const char *enc) {
    if(!enc) return nil;
    id revar;
    do{
        if (enc[0] == _C_CONST) enc++;
        if (enc[0] == _C_ID) { //id and block
            [ivk getReturnValue:&revar];
            break;
        }else if (strcmp(enc, @encode(Class)) == 0){       //Class
            Class v;
            [ivk getReturnValue:&v];
            revar = v;
            break;
        }else if (strcmp(enc, @encode(IMP)) == 0 ){         //IMP
            IMP v;
            [ivk getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(IMP)];
            break;
        }else if (strcmp(enc, @encode(SEL)) == 0) {         //SEL
            SEL v;
            [ivk getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(SEL)];
            break;
        }else if (strcmp(enc, @encode(double)) == 0){       //double
            double v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithDouble:v];
            break;
        }else if (strcmp(enc, @encode(float)) == 0){       //float
            float v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithFloat:v];
            break;
        }else if (enc[0] == _C_PTR){                           //pointer ( and const pointer)
            IMP v;
            [ivk getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(IMP)];
            break;
        }else if (strcmp(enc, @encode(char *)) == 0) {      //char* (and const char*)
            char * v;
            [ivk getReturnValue:&v];
            revar = [NSString stringWithUTF8String:v];
            break;
        }else if (strcmp(enc, @encode(unsigned long)) == 0) {
            unsigned long v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithUnsignedLong:v];
            break;
        }else if (strcmp(enc, @encode(unsigned long long)) == 0) {
            unsigned long long v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithLongLong:v];
            break;
        }else if (strcmp(enc, @encode(long)) == 0) {
            long v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithLong:v];
            break;
        }else if (strcmp(enc, @encode(long long)) == 0) {
            long long v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithLongLong:v];
            break;
        }else if (strcmp(enc, @encode(int)) == 0) {
            int v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithInt:v];
            break;
        }else if (strcmp(enc, @encode(unsigned int)) == 0) {
            unsigned int v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithUnsignedInt:v];
            break;
        }else if ((strcmp(enc, @encode(bool)) == 0           ||
                   strcmp(enc, @encode(BOOL)) == 0           ||
                   strcmp(enc, @encode(char)) == 0           ||
                   strcmp(enc, @encode(short)) == 0          ||
                   strcmp(enc, @encode(unsigned char)) == 0  ||
                   strcmp(enc, @encode(unsigned short)) == 0)){
            short v;
            [ivk getReturnValue:&v];
            revar = [NSNumber numberWithShort:v];
            break;
        }else{
            //struct union and array
            if (strcmp(enc, @encode(CGRect)) == 0){
                CGRect v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCGRect:v];
                break;
            }else if(strcmp(enc, @encode(CGPoint)) == 0){
                CGPoint v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCGPoint:v];
                break;
            }else if (strcmp(enc, @encode(CGSize)) == 0){
                CGSize v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCGSize:v];
                break;
            }else if (strcmp(enc, @encode(NSRange)) == 0){
                NSRange v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithRange:v];
                break;
            }else if (strcmp(enc, @encode(UIEdgeInsets)) == 0){
                UIEdgeInsets v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithUIEdgeInsets:v];
                break;
            }else if (strcmp(enc, @encode(CGVector)) == 0){
                CGVector v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCGVector:v];
                break;
            }else if (strcmp(enc, @encode(UIOffset)) == 0){
                UIOffset v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithUIOffset:v];
                break;
            }else if(strcmp(enc, @encode(CATransform3D)) == 0){
                CATransform3D v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCATransform3D:v];
                break;
            }else if(strcmp(enc, @encode(CGAffineTransform)) == 0){
                CGAffineTransform v;
                [ivk getReturnValue:&v];
                revar = [NSValue valueWithCGAffineTransform:v];
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(enc, @encode(NSDirectionalEdgeInsets)) == 0){
                    NSDirectionalEdgeInsets v;
                    [ivk getReturnValue:&v];
                    revar = [NSValue valueWithDirectionalEdgeInsets:v];
                    break;
                }
            }
        }
    }while(0);
    return revar;
}
