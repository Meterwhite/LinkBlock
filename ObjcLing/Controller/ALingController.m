//
//  ALingController.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALingController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "ALingAction.h"
#import "TLingErr.h"
#import "TLing.h"

static Class _clz_TLing;

typedef id TLingBlock;

TLing *TLingCallPt(__kindof TLing *ling, SEL sel);

TLingBlock TLingCallBlockPt(__kindof TLing *ling, SEL sel);

bool setValue2Act(ALingAction<TLingParametric, TLingVariableParametric> *act, NSUInteger idx, const char *enc, va_list li);

/// Only subclass
NS_INLINE bool isASubclass(Class child, Class parent);

bool sendMsgWork(id target, NSUInteger index, TLing *ling, SEL sel, Class actClzz);
bool sendMsgWork_va(id target, NSUInteger index, TLing *ling, SEL sel, Class actClzz, va_list li, const char *enc0, va_list li_self);

Class getActionClass(__kindof TLing *ling, SEL sel);

@implementation ALingController

+ (void)load {
    _clz_TLing = [TLing class];
    @autoreleasepool {
        [self registerActions];
    }
}

+ (void)registerActions {
    unsigned int count    = 0;
    Class    *cLi         = objc_copyClassList(&count);
    Class    cALingAction = [ALingAction class];
    Protocol *pArgsIn     = @protocol(TLingParametric);
    do {
        Class   cAct    = cLi[count - 1];
        if(!isASubclass(cAct, cALingAction)) continue;
        NSArray *infos = [NSStringFromClass(cAct) componentsSeparatedByString:@"_"];
        Class   cObj    = NSClassFromString([infos firstObject]);
        SEL     selObj  = NSSelectorFromString([infos lastObject]);
        IMP     actImp;
        if(class_conformsToProtocol(cAct, pArgsIn)) {
            actImp = (IMP)TLingCallBlockPt;
        } else {
            actImp = (IMP)TLingCallPt;
        }
        Method m = class_getInstanceMethod(cObj, selObj);
        method_setImplementation(m, actImp);
    }while(--count);
    free(cLi);
}

///
/// @param ling NSObjectling
/// @param sel log
TLing *TLingCallPt(__kindof ALing *ling, SEL sel) {
    /// Error pass
    if(ling.error) {
        return ling;
    }
    Class actClzz = getActionClass(ling, sel);
    if(ling.count == 1) {
        if(!sendMsgWork(ling.target, 0, ling, sel, actClzz)) {
            return ling;
        }
    } else if(ling.count > 1) {
        NSUInteger i = 0;
        for (id target in ling) {
            if(!sendMsgWork(target, i++, ling, sel, actClzz)) {
                return ling;
            }
        }
    }
    ling->step++;
    return ling;
}

TLingBlock TLingCallBlockPt(__kindof TLing *ling, SEL sel) {
    do{
        Class actClz = getActionClass(ling, sel);
        if(!actClz) break;
        const char *enc = [actClz encodeAt:0];
        if (enc[0] == _C_CONST) enc++;
        if (enc[0] == _C_ID) { //id and block
            return ^TLing *(id at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(Class)) == 0){       //Class
            return ^TLing *(Class at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(IMP)) == 0 ){         //IMP
            return ^TLing *(IMP at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(SEL)) == 0) {         //SEL
            return ^TLing *(SEL at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(double)) == 0){       //double
            return ^TLing *(double at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(float)) == 0){       //float
            return ^TLing *(double at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (enc[0] == _C_PTR){                           //pointer ( and const pointer)
            return ^TLing *(void *at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(char *)) == 0) {      //char* (and const char*)
            return ^TLing *(char *at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(unsigned long)) == 0) {
            return ^TLing *(unsigned long at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(unsigned long long)) == 0) {
            return ^TLing *(unsigned long long at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(long)) == 0) {
            return ^TLing *(long at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(long long)) == 0) {
            return ^TLing *(long long at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(int)) == 0) {
            return ^TLing *(int at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if (strcmp(enc, @encode(unsigned int)) == 0) {
            return ^TLing *(unsigned int at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, at0);
            };
            break;
        }else if ((strcmp(enc, @encode(bool)) == 0           ||
                   strcmp(enc, @encode(BOOL)) == 0           ||
                   strcmp(enc, @encode(char)) == 0           ||
                   strcmp(enc, @encode(short)) == 0          ||
                   strcmp(enc, @encode(unsigned char)) == 0  ||
                   strcmp(enc, @encode(unsigned short)) == 0)){
            return ^TLing *(int at0, ...) {
                va_list li;
                va_start(li, at0);
                return subCallBlockPt(ling, sel, actClz, li, enc, (short)at0);
            };
            break;
        }else{
            //struct union and array
            if (strcmp(enc, @encode(CGRect)) == 0){
                return ^TLing *(CGRect at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if(strcmp(enc, @encode(CGPoint)) == 0){
                return ^TLing *(CGPoint at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if (strcmp(enc, @encode(CGSize)) == 0){
                return ^TLing *(CGSize at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if (strcmp(enc, @encode(NSRange)) == 0){
                return ^TLing *(NSRange at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if (strcmp(enc, @encode(UIEdgeInsets)) == 0){
                return ^TLing *(UIEdgeInsets at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if (strcmp(enc, @encode(CGVector)) == 0){
                return ^TLing *(CGVector at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if (strcmp(enc, @encode(UIOffset)) == 0){
                return ^TLing *(UIOffset at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if(strcmp(enc, @encode(CATransform3D)) == 0){
                return ^TLing *(CATransform3D at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }else if(strcmp(enc, @encode(CGAffineTransform)) == 0){
                return ^TLing *(CGAffineTransform at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                };
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(enc, @encode(NSDirectionalEdgeInsets)) == 0){
                    return ^TLing *(NSDirectionalEdgeInsets at0, ...) {
                        va_list li;
                        va_start(li, at0);
                        return subCallBlockPt(ling, sel, actClz, li, enc, at0);
                    };
                    break;
                }
            }
        }
    }while(0);
    /// Type error
    return ^TLing *(CATransform3D at0, ...) {
        [ling pushError:[[TLingErr allocWith:ling.target] initForUserDescription:@"Unsupported parameter type"]];
        return ling;
    };
}

TLing *subCallBlockPt(__kindof TLing *ling, SEL sel, Class actClzz, va_list li, const char *enc0 , ...) {
    if(ling.error) {
        return ling;
    }
    va_list li_at0;
    va_start(li_at0, enc0);
    if(ling.count == 1) {
        if(!sendMsgWork_va(ling.target, 0, ling, sel, actClzz, li, enc0, li_at0)) {
            return ling;
        }
    } else if(ling.count > 1) {
        NSUInteger i = 0;
        for (id target in ling) {
            if(!sendMsgWork_va(target, i++, ling, sel, actClzz, li, enc0, li_at0)) {
                return ling;
            }
        }
    }
    ling->step++;
    return ling;
}

@end

bool sendMsgWork(id target, NSUInteger index, TLing *ling, SEL sel, Class actClzz) {
    if(ling.dependentClass) {
        if(![ling.target isKindOfClass:ling.dependentClass]) {
            [ling pushError:[[TLingErr allocWith:ling.count>1?ling.targets:ling.target] initForKind:ling.dependentClass sel:sel]];
            return false;
        }
    }
    ALingAction *act = [[actClzz alloc] init];
    [act setTarget:ling.target];
    [act setStep:ling.step];
    TLingErr *err;
    id newTag = [act sendMsg:&err];
    if(err) {
        [ling pushError:err];
        return false;
    }
    if(newTag){
        if(ling.count == 1) {
            [ling switchTarget:newTag];
        } else {
            [ling.targets replaceObjectAtIndex:index withObject:newTag];
        }
    }
    return true;
}

bool sendMsgWork_va(id target, NSUInteger index, TLing *ling, SEL sel, Class actClzz, va_list li_va, const char *enc0, va_list li_at0) {
    if(ling.dependentClass) {
        if(![target isKindOfClass:ling.dependentClass]) {
            [ling pushError:[[TLingErr allocWith:(ling.count > 1) ? ling.targets : ling.target] initForKind:ling.dependentClass sel:sel]];
            return false;
        }
    }
    ALingAction<TLingParametric,TLingVariableParametric> *act = [[actClzz alloc] init];
    [act setTarget:target];
    [act setStep:ling.step];
    for (NSUInteger idx = 0; idx < act.count  ; idx++) {
        if(idx == 0) {
            setValue2Act(act, idx, enc0, li_at0);
        } else {
            const char *code = [actClzz encodeAt:idx];
            if(!code) break;
            setValue2Act(act, idx, code, li_va);
        }
    }
    /// Variable parameter list
    if(class_conformsToProtocol(actClzz, @protocol(TLingVariableParametric))) {
        while (setValue2Act(act, -1, @encode(id), li_va));
    }
    TLingErr *err;
    id newTag = [act sendMsg:&err];
    if(err) {
        [ling pushError:err];
        return false;
    }
    if(newTag){
        if(ling.count == 1) {
            [ling switchTarget:newTag];
        } else {
            [ling.targets replaceObjectAtIndex:index withObject:newTag];
        }
    }
    return true;
}

/// @param idx -1(Variable parameter list)
bool setValue2Act(ALingAction<TLingParametric, TLingVariableParametric> *act, NSUInteger idx, const char *enc, va_list li) {
    SEL setter = NSSelectorFromString([NSString stringWithFormat:@"setAt%ld:",idx]);
    do{
        if(idx == -1) {
            id v = va_arg(li, id);
            if(v == nil) return false;
            [[act arrayForValist] addObject:v];
            break;
        }
        if (enc[0] == _C_CONST) enc++;
        if (enc[0] == _C_ID) { //id and block
            id v = va_arg(li, id);
            ((void(*)(id,SEL,id))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(Class)) == 0){       //Class
            Class v = va_arg(li, Class);
            ((void(*)(id,SEL,Class))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(IMP)) == 0 ){         //IMP
            IMP v = va_arg(li, IMP);
            ((void(*)(id,SEL,IMP))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(SEL)) == 0) {         //SEL
            SEL v = va_arg(li, SEL);
            ((void(*)(id,SEL,SEL))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(double)) == 0){      //double
            double v = va_arg(li, double);
            ((void(*)(id,SEL,double))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(float)) == 0){       //float
            float v = va_arg(li, double);
            ((void(*)(id,SEL,float))objc_msgSend)(act,setter,v);
            break;
        }else if (enc[0] == _C_PTR){                       //pointer ( and const pointer)
            void *v = va_arg(li, void*);
            ((void(*)(id,SEL,void*))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(char *)) == 0) {     //char* (and const char*)
            char *v = va_arg(li, char *);
            ((void(*)(id,SEL,char *))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(unsigned long)) == 0) {
            unsigned long v = va_arg(li, unsigned long);
            ((void(*)(id,SEL,unsigned long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(unsigned long long)) == 0) {
            unsigned long long v = va_arg(li, unsigned long long);
            ((void(*)(id,SEL,unsigned long long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(long)) == 0) {
            long v = va_arg(li, long);
            ((void(*)(id,SEL,long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(long long)) == 0) {
            long long v = va_arg(li, long long);
            ((void(*)(id,SEL,long long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(int)) == 0) {
            int v = va_arg(li, int);
            ((void(*)(id,SEL,int))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(enc, @encode(unsigned int)) == 0) {
            unsigned int v = va_arg(li, unsigned int);
            ((void(*)(id,SEL,unsigned int))objc_msgSend)(act,setter,v);
            break;
        }else if ((strcmp(enc, @encode(bool)) == 0           ||
                   strcmp(enc, @encode(BOOL)) == 0           ||
                   strcmp(enc, @encode(char)) == 0           ||
                   strcmp(enc, @encode(short)) == 0          ||
                   strcmp(enc, @encode(unsigned char)) == 0  ||
                   strcmp(enc, @encode(unsigned short)) == 0)){
            short v = va_arg(li, int);
            ((void(*)(id,SEL,short))objc_msgSend)(act,setter,v);
            break;
        }else{
            //struct union and array
            if (strcmp(enc, @encode(CGRect)) == 0){
                CGRect v = va_arg(li, CGRect);
                ((void(*)(id,SEL,CGRect))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(enc, @encode(CGPoint)) == 0){
                CGPoint v = va_arg(li, CGPoint);
                ((void(*)(id,SEL,CGPoint))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(enc, @encode(CGSize)) == 0){
                CGSize v = va_arg(li, CGSize);
                ((void(*)(id,SEL,CGSize))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(enc, @encode(NSRange)) == 0){
                NSRange v = va_arg(li, NSRange);
                ((void(*)(id,SEL,NSRange))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(enc, @encode(UIEdgeInsets)) == 0){
                UIEdgeInsets v = va_arg(li, UIEdgeInsets);
                ((void(*)(id,SEL,UIEdgeInsets))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(enc, @encode(CGVector)) == 0){
                CGVector v = va_arg(li, CGVector);
                ((void(*)(id,SEL,CGVector))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(enc, @encode(UIOffset)) == 0){
                UIOffset v = va_arg(li, UIOffset);
                ((void(*)(id,SEL,UIOffset))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(enc, @encode(CATransform3D)) == 0){
                CATransform3D v = va_arg(li, CATransform3D);
                ((void(*)(id,SEL,CATransform3D))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(enc, @encode(CGAffineTransform)) == 0){
                CGAffineTransform v = va_arg(li, CGAffineTransform);
                ((void(*)(id,SEL,CGAffineTransform))objc_msgSend)(act,setter,v);
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(enc, @encode(NSDirectionalEdgeInsets)) == 0){
                    NSDirectionalEdgeInsets v = va_arg(li, NSDirectionalEdgeInsets);
                    ((void(*)(id,SEL,NSDirectionalEdgeInsets))objc_msgSend)(act,setter,v);
                    break;
                }
            }
        }
    }while(0);
    return true;
}

NS_INLINE bool isASubclass(Class child, Class parent) {
    if(child == parent) return false;
    for (Class c = child; c != NULL; c = class_getSuperclass(c)) {
        if (c == parent) {
            return true;
        }
   }
   return false;
}


Class getActionClass(__kindof TLing *ling, SEL sel) {
    Class actC = nil;
    for (Class lingC = [ling class]; actC == nil && lingC != _clz_TLing ; lingC = class_getSuperclass(lingC)) {
        actC = NSClassFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(lingC),NSStringFromSelector(sel)]);
    }
    return actC;
}
