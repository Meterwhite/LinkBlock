//
//  ALingAction.m
//  LinkAnyObjectDemo
//
//  Created by MeterWhite on 2020/8/16.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>
#import <objc/message.h>
#import "ALingAction.h"
#import "TLingErr.h"

/// Class : Index : EncodeString
static NSMapTable *_cached_encode;

id getBoxedRevar(NSInvocation *invoaction,const char *objcType);

NS_INLINE bool pasValue2Ivk(__kindof ALingAction *act, NSInvocation *invoaction,const char *objcType, NSUInteger idx);

@implementation ALingAction

- (NSUInteger)count {
    return 0;
}


- (SEL)forwardSEL {
    return nil;
}


- (const char *)encodeForIndex:(NSUInteger)idx {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _cached_encode = [NSMapTable mapTableWithKeyOptions: NSPointerFunctionsOpaqueMemory | NSPointerFunctionsOpaquePersonality valueOptions: NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPersonality];
    });
    NSString *code;
    NSMutableDictionary *cmap = [_cached_encode objectForKey:self.class];
    if(cmap) {
        if((code = cmap[@(idx)])) {
        CALL_RET:
            return code.UTF8String;
        }
    } else {
        cmap = [NSMutableDictionary dictionary];
        [_cached_encode setObject:cmap forKey:self.class];
    }
    NSString *pnam = [NSString stringWithFormat:@"at%ld",idx];
    objc_property_t p = class_getProperty(self.class, pnam.UTF8String);
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

- (id)sendMsg:(TLingErr * _Nullable __autoreleasing *)err {
    if(!self.tag || ![self forwardSEL]) return nil;
    NSMethodSignature *sig  = [[self.tag class] instanceMethodSignatureForSelector:[self forwardSEL]];
    if(!sig) {
        *err = [TLingErr.alloc init];
        return nil;
    }
    NSInvocation *ivk = [NSInvocation invocationWithMethodSignature:sig];
    for (NSUInteger i = 2; i < self.count; i++) {
        const char * code = [self encodeForIndex:i];
        if(!pasValue2Ivk(self, ivk, code, i)) {
            *err = [TLingErr.alloc init];
        }
    }
    [ivk invokeWithTarget:self.tag];
    if([self conformsToProtocol:@protocol(TLingBroken)]) {
        return getBoxedRevar(ivk, sig.methodReturnType);
    }
    return nil;
}

@end

NS_INLINE bool pasValue2Ivk(__kindof ALingAction *act, NSInvocation *invoaction,const char *objcType, NSUInteger idx) {
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

id getBoxedRevar(NSInvocation *invoaction,const char *objcType) {
    if(!objcType) return nil;
    id revar;
    do{
        //常量则位移到类型符
        if (objcType[0] == _C_CONST) objcType++;
        if (objcType[0] == _C_ID) { //id and block
            [invoaction getReturnValue:&revar];
            break;
        }else if (strcmp(objcType, @encode(Class)) == 0){       //Class
            Class v;
            [invoaction getReturnValue:&v];
            revar = v;
            break;
        }else if (strcmp(objcType, @encode(IMP)) == 0 ){         //IMP
            IMP v;
            [invoaction getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(IMP)];
            break;
        }else if (strcmp(objcType, @encode(SEL)) == 0) {         //SEL
            SEL v;
            [invoaction getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(SEL)];
            break;
        }else if (strcmp(objcType, @encode(double)) == 0){       //double
            double v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithDouble:v];
            break;
        }else if (strcmp(objcType, @encode(float)) == 0){       //float
            float v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithFloat:v];
            break;
        }else if (objcType[0] == _C_PTR){                           //pointer ( and const pointer)
            IMP v;
            [invoaction getReturnValue:&v];
            revar = [NSValue valueWithBytes:&v objCType:@encode(IMP)];
            break;
        }else if (strcmp(objcType, @encode(char *)) == 0) {      //char* (and const char*)
            char * v;
            [invoaction getReturnValue:&v];
            revar = [NSString stringWithUTF8String:v];
            break;
        }else if (strcmp(objcType, @encode(unsigned long)) == 0) {
            unsigned long v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithUnsignedLong:v];
            break;
        }else if (strcmp(objcType, @encode(unsigned long long)) == 0) {
            unsigned long long v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithLongLong:v];
            break;
        }else if (strcmp(objcType, @encode(long)) == 0) {
            long v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithLong:v];
            break;
        }else if (strcmp(objcType, @encode(long long)) == 0) {
            long long v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithLongLong:v];
            break;
        }else if (strcmp(objcType, @encode(int)) == 0) {
            int v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithInt:v];
            break;
        }else if (strcmp(objcType, @encode(unsigned int)) == 0) {
            unsigned int v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithUnsignedInt:v];
            break;
        }else if ((strcmp(objcType, @encode(bool)) == 0           ||
                   strcmp(objcType, @encode(BOOL)) == 0           ||
                   strcmp(objcType, @encode(char)) == 0           ||
                   strcmp(objcType, @encode(short)) == 0          ||
                   strcmp(objcType, @encode(unsigned char)) == 0  ||
                   strcmp(objcType, @encode(unsigned short)) == 0)){
            short v;
            [invoaction getReturnValue:&v];
            revar = [NSNumber numberWithShort:v];
            break;
        }else{
            //struct union and array
            if (strcmp(objcType, @encode(CGRect)) == 0){
                CGRect v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCGRect:v];
                break;
            }else if(strcmp(objcType, @encode(CGPoint)) == 0){
                CGPoint v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCGPoint:v];
                break;
            }else if (strcmp(objcType, @encode(CGSize)) == 0){
                CGSize v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCGSize:v];
                break;
            }else if (strcmp(objcType, @encode(NSRange)) == 0){
                NSRange v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithRange:v];
                break;
            }else if (strcmp(objcType, @encode(UIEdgeInsets)) == 0){
                UIEdgeInsets v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithUIEdgeInsets:v];
                break;
            }else if (strcmp(objcType, @encode(CGVector)) == 0){
                CGVector v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCGVector:v];
                break;
            }else if (strcmp(objcType, @encode(UIOffset)) == 0){
                UIOffset v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithUIOffset:v];
                break;
            }else if(strcmp(objcType, @encode(CATransform3D)) == 0){
                CATransform3D v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCATransform3D:v];
                break;
            }else if(strcmp(objcType, @encode(CGAffineTransform)) == 0){
                CGAffineTransform v;
                [invoaction getReturnValue:&v];
                revar = [NSValue valueWithCGAffineTransform:v];
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(objcType, @encode(NSDirectionalEdgeInsets)) == 0){
                    NSDirectionalEdgeInsets v;
                    [invoaction getReturnValue:&v];
                    revar = [NSValue valueWithDirectionalEdgeInsets:v];
                    break;
                }
            }
        }
    }while(0);
    return revar;
}
