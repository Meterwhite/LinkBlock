//
//  ALingController.m
//  LinkAnyObjectDemo
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

NS_INLINE void setValue2Act(ALingAction<TLingParametric> *act,NSUInteger idx,const char *objcType, va_list li);

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
        if(![cAct isSubclassOfClass:cALingAction]) continue;
        if(cAct == cALingAction) continue;
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
/// @param ling NSObjecttring
/// @param sel log
TLing *TLingCallPt(__kindof ALing *ling, SEL sel) {
    /// Error pass
    if(ling.error) {
        return ling;
    }
    /// Action
    Class actC = nil;
    Class lingC= nil;
    for (lingC = [ling class]; actC == nil && lingC != _clz_TLing ; lingC = class_getSuperclass(lingC)) {
        actC = NSClassFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(lingC),NSStringFromSelector(sel)]);
    }
    if(!actC) {
        TLingErr *err = [[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForMissingAct:sel];
        [ling pushError:err];
        return ling;
    } else if(ling.count == 1) {
        /// Type safe for Ling
        if(ling.dependentClass) {
            if(![ling.target isKindOfClass:ling.dependentClass]) {
                [ling pushError:[[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForKind:ling.dependentClass sel:sel]];
                return ling;
            }
        }
        ALingAction *act = [[actC alloc] init];
        [act setTag:ling.target];
        [act setStep:ling.step];
        TLingErr *err;
        id newTag = [act sendMsg:&err];
        if(err) {
            [ling pushError:err];
            return ling;
        }
        if(newTag){
            [ling switchTarget:newTag];
        }
    } else if(ling.count > 1) {
        NSUInteger i = 0;
        for (id target in ling) {
            /// Type safe for Lings
            if(ling.dependentClass) {
                if(![target isKindOfClass:ling.dependentClass]) {
                    [ling pushError:[[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForKind:ling.dependentClass sel:sel]];
                    return ling;
                }
            }
            ALingAction *act = [[actC alloc] init];
            [act setTag:target];
            [act setStep:ling.step];
            TLingErr *err;
            id newTag = [act sendMsg:&err];
            if(err) {
                [ling pushError:err];
                return ling;
            }
            if(newTag){
                [ling.targets replaceObjectAtIndex:i withObject:newTag];
            }
            i++;
        }
    }
    ling->step++;
    return ling;
}

TLing2Block TLingCallBlockPt(__kindof TLing *ling, SEL sel) {
    return ^TLing *(void *at0, ...) {
        if(ling.error) {
            return ling;
        }
        Class actC = nil;
        for (Class lingC = [ling class]; actC == nil && lingC != _clz_TLing ; lingC = class_getSuperclass(lingC)) {
            actC = NSClassFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(lingC),NSStringFromSelector(sel)]);
        }
        if(!actC) {
            TLingErr *err = [[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForMissingAct:sel];
            [ling pushError:err];
        } else if(ling.count == 1) {
            /// Type safe
            if(ling.dependentClass) {
                if(![ling.target isKindOfClass:ling.dependentClass]) {
                    [ling pushError:[[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForKind:ling.dependentClass sel:sel]];
                    return ling;
                }
            }
            ALingAction<TLingParametric> *act = [[actC alloc] init];
            [act setTag:ling.target];
            [act setStep:ling.step];
            {
                va_list li;
                va_start(li, at0);
                NSUInteger i = 0;
                const char *code;
                do {
                    code = [act encodeForIndex:i];
                    if(!code) break;
                    setValue2Act(act,i,code,li);
                } while (i++);
            }
            TLingErr *err;
            id newTag = [act sendMsg:&err];
            if(err) {
                [ling pushError:err];
                return ling;
            }
            if(newTag){
                [ling switchTarget:newTag];
            }
        } else if(ling.count > 1) {
            NSUInteger i = 0;
            for (id target in ling) {
                /// Type safe
                if(ling.dependentClass) {
                    if(![target isKindOfClass:ling.dependentClass]) {
                        [ling pushError:[[TLingErr allocFrom:ling.count>1?ling.targets:ling.target at:ling.step] initForKind:ling.dependentClass sel:sel]];
                        return ling;
                    }
                }
                ALingAction<TLingParametric> *act = [[actC alloc] init];
                [act setTag:target];
                {
                    va_list li;
                    va_start(li, at0);
                    NSUInteger i = 0;
                    const char *code;
                    do {
                        code = [act encodeForIndex:i];
                        if(!code) break;
                        setValue2Act(act,i,code,li);
                    } while (i++);
                }
                TLingErr *err;
                id newTag = [act sendMsg:&err];
                if(err) {
                    [ling pushError:err];
                    return ling;
                }
                if(newTag){
                    [ling.targets replaceObjectAtIndex:i withObject:newTag];
                }
                i++;
            }
        }
        ling->step++;
        return ling;
    };
}

@end

NS_INLINE void setValue2Act(ALingAction<TLingParametric> *act,NSUInteger idx,const char *objcType, va_list li) {
    if(!objcType) return;
    SEL setter = NSSelectorFromString([NSString stringWithFormat:@"setAt%ld",idx]);
    do{
        //常量则位移到类型符
        if (objcType[0] == _C_CONST) objcType++;
        if (objcType[0] == _C_ID) { //id and block
            id v = va_arg(li, id);
            ((void(*)(id,SEL,id))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(Class)) == 0){       //Class
            Class v = va_arg(li, Class);
            ((void(*)(id,SEL,Class))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(IMP)) == 0 ){         //IMP
            IMP v = va_arg(li, IMP);
            ((void(*)(id,SEL,IMP))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(SEL)) == 0) {         //SEL
            SEL v = va_arg(li, SEL);
            ((void(*)(id,SEL,SEL))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(double)) == 0){       //double
            double v = va_arg(li, double);
            ((void(*)(id,SEL,double))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(float)) == 0){       //float
            float v = va_arg(li, double);
            ((void(*)(id,SEL,float))objc_msgSend)(act,setter,v);
            break;
        }else if (objcType[0] == _C_PTR){                           //pointer ( and const pointer)
            void *v = va_arg(li, void*);
            ((void(*)(id,SEL,void*))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(char *)) == 0) {      //char* (and const char*)
            char * v = va_arg(li, char *);
            ((void(*)(id,SEL,char *))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(unsigned long)) == 0) {
            unsigned long v = va_arg(li, unsigned long);
            ((void(*)(id,SEL,unsigned long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(unsigned long long)) == 0) {
            unsigned long long v = va_arg(li, unsigned long long);
            ((void(*)(id,SEL,unsigned long long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(long)) == 0) {
            long v = va_arg(li, long);
            ((void(*)(id,SEL,long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(long long)) == 0) {
            long long v = va_arg(li, long long);
            ((void(*)(id,SEL,long long))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(int)) == 0) {
            int v = va_arg(li, int);
            ((void(*)(id,SEL,int))objc_msgSend)(act,setter,v);
            break;
        }else if (strcmp(objcType, @encode(unsigned int)) == 0) {
            unsigned int v = va_arg(li, unsigned int);
            ((void(*)(id,SEL,unsigned int))objc_msgSend)(act,setter,v);
            break;
        }else if ((strcmp(objcType, @encode(bool)) == 0           ||
                   strcmp(objcType, @encode(BOOL)) == 0           ||
                   strcmp(objcType, @encode(char)) == 0           ||
                   strcmp(objcType, @encode(short)) == 0          ||
                   strcmp(objcType, @encode(unsigned char)) == 0  ||
                   strcmp(objcType, @encode(unsigned short)) == 0)){
            short v = va_arg(li, int);
            ((void(*)(id,SEL,short))objc_msgSend)(act,setter,v);
            break;
        }else{
            //struct union and array
            if (strcmp(objcType, @encode(CGRect)) == 0){
                CGRect v = va_arg(li, CGRect);
                ((void(*)(id,SEL,CGRect))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(objcType, @encode(CGPoint)) == 0){
                CGPoint v = va_arg(li, CGPoint);
                ((void(*)(id,SEL,CGPoint))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(objcType, @encode(CGSize)) == 0){
                CGSize v = va_arg(li, CGSize);
                ((void(*)(id,SEL,CGSize))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(objcType, @encode(NSRange)) == 0){
                NSRange v = va_arg(li, NSRange);
                ((void(*)(id,SEL,NSRange))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(objcType, @encode(UIEdgeInsets)) == 0){
                UIEdgeInsets v = va_arg(li, UIEdgeInsets);
                ((void(*)(id,SEL,UIEdgeInsets))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(objcType, @encode(CGVector)) == 0){
                CGVector v = va_arg(li, CGVector);
                ((void(*)(id,SEL,CGVector))objc_msgSend)(act,setter,v);
                break;
            }else if (strcmp(objcType, @encode(UIOffset)) == 0){
                UIOffset v = va_arg(li, UIOffset);
                ((void(*)(id,SEL,UIOffset))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(objcType, @encode(CATransform3D)) == 0){
                CATransform3D v = va_arg(li, CATransform3D);
                ((void(*)(id,SEL,CATransform3D))objc_msgSend)(act,setter,v);
                break;
            }else if(strcmp(objcType, @encode(CGAffineTransform)) == 0){
                CGAffineTransform v = va_arg(li, CGAffineTransform);
                ((void(*)(id,SEL,CGAffineTransform))objc_msgSend)(act,setter,v);
                break;
            }
            if (@available(iOS 11.0, *)){
                if(strcmp(objcType, @encode(NSDirectionalEdgeInsets)) == 0){
                    NSDirectionalEdgeInsets v = va_arg(li, NSDirectionalEdgeInsets);
                    ((void(*)(id,SEL,NSDirectionalEdgeInsets))objc_msgSend)(act,setter,v);
                    break;
                }
            }
        }
    }while(0);
}
