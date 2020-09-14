//
//  ObjclingRuntime.m
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ObjclingRuntime.h"
#import "DynamilingInfo.h"
#import <Foundation/Foundation.h>
#import <objc/NSObject.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "AlingAction.h"
#import "TlingErr.h"
#import "Tling.h"

static Class _class_Tling;

typedef id TlingBlock;

Tling *TlingAutoProperty(__kindof Tling *ling, SEL sel);

TlingBlock TlingAutoBlockProperty(__kindof Tling *ling, SEL sel);

bool setValue2Action(AlingAction<TActionParametric, TActionVariableParametric> *act, NSUInteger idx, const char *enc, va_list li);

bool sendMsgWork(id target, NSUInteger index, Tling *ling, SEL sel, Class act_classz);

bool sendMsgWork_va(id target, NSUInteger index, Tling *ling, SEL sel, Class act_classz, va_list li, const char *enc0, va_list li_self);

Class getActionClass(__kindof Tling *ling, SEL sel);

@implementation ObjclingRuntime

+ (void)load {
    _class_Tling = [Tling class];
    @autoreleasepool {
        [self registerActions];
    }
}

+ (void)registerActions {
    unsigned int count    = 0;
    Class    *cLi         = objc_copyClassList(&count);
    Class    cALingAction = [AlingAction class];
    Protocol *pArgsIn     = @protocol(TActionParametric);
    do {
        Class   cAct    = cLi[count - 1];
        if([cAct isSubclassOfClass:cALingAction] && cAct != cALingAction) continue;
        NSArray *infos  = [NSStringFromClass(cAct) componentsSeparatedByString:@"_"];
        if(infos.count != 2) continue;
        Class   cObj    = NSClassFromString([infos firstObject]);
        SEL     selObj  = NSSelectorFromString([infos lastObject]);
        IMP     actImp;
        if(class_conformsToProtocol(cAct, pArgsIn)) {
            actImp = (IMP)TlingAutoBlockProperty;
        } else {
            actImp = (IMP)TlingAutoProperty;
        }
        Method m = class_getInstanceMethod(cObj, selObj);
        method_setImplementation(m, actImp);
    }while(--count);
    free(cLi);
}

/// 所有属性形式方法的实现入口
Tling *TlingAutoProperty(__kindof Aling *ling, SEL sel) {
    /// Error pass
    if(ling->status == AlingStatusReturning || ling->error) {
        return ling;
    }
    if(ling->status != AlingStatusFuture) {
        if(![ling.target isKindOfClass:ling.dependentClass]) {
            [ling pushError:[[TlingErr allocWith:DelingWith(ling)] initForKind:ling.dependentClass sel:sel]];
            return ling;
        }
    }
    Class act_class = getActionClass(ling, sel);
    if(ling.itemCount == 1) {
        if(!sendMsgWork(ling.target, 0, ling, sel, act_class)) {
            return ling;
        }
    } else if(ling.itemCount > 1) {
        NSUInteger i = 0;
        for (id target in ling) {
            if(!sendMsgWork(target, i++, ling, sel, act_class)) {
                return ling;
            }
        }
    }
    ling->step++;
    return ling;
}

/// 所有闭包属性形式方法的实现入口
TlingBlock TlingAutoBlockProperty(__kindof Tling *ling, SEL sel) {
    do{
        Class act_class = getActionClass(ling, sel);
        if(!act_class) break;
        const char *enc = [act_class encodeAt:0];
        if (enc[0] == _C_CONST) enc++;
        if (enc[0] == _C_ID) { //id and block
            return ^Tling *(id at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(Class)) == 0) { //Class
            return ^Tling *(Class at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(IMP)) == 0) {         //IMP
            return ^Tling *(IMP at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(SEL)) == 0) {         //SEL
            return ^Tling *(SEL at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(double)) == 0) {       //double
            return ^Tling *(double at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(float)) == 0) {       //float
            return ^Tling *(double at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (enc[0] == _C_PTR) {                           //pointer ( and const pointer)
            return ^Tling *(void *at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(char *)) == 0) {      //char* (and const char*)
            return ^Tling *(char *at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(unsigned long)) == 0) {
            return ^Tling *(unsigned long at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(unsigned long long)) == 0) {
            return ^Tling *(unsigned long long at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(long)) == 0) {
            return ^Tling *(long at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(long long)) == 0) {
            return ^Tling *(long long at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(int)) == 0) {
            return ^Tling *(int at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if (strcmp(enc, @encode(unsigned int)) == 0) {
            return ^Tling *(unsigned int at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
            };
            break;
        } else if ((strcmp(enc, @encode(bool))  == 0         ||
                   strcmp(enc, @encode(BOOL))  == 0          ||
                   strcmp(enc, @encode(char))  == 0          ||
                   strcmp(enc, @encode(short)) == 0          ||
                   strcmp(enc, @encode(unsigned char)) == 0  ||
                   strcmp(enc, @encode(unsigned short)) == 0)) {
            return ^Tling *(int at0, ...) {
                va_list li;
                va_start(li, at0);
                return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, (short)at0);
            };
            break;
        } else{
            //struct union and array
            if (strcmp(enc, @encode(CGRect)) == 0) {
                return ^Tling *(CGRect at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if(strcmp(enc, @encode(CGPoint)) == 0) {
                return ^Tling *(CGPoint at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if (strcmp(enc, @encode(CGSize)) == 0) {
                return ^Tling *(CGSize at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if (strcmp(enc, @encode(NSRange)) == 0) {
                return ^Tling *(NSRange at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if (strcmp(enc, @encode(UIEdgeInsets)) == 0) {
                return ^Tling *(UIEdgeInsets at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if (strcmp(enc, @encode(CGVector)) == 0) {
                return ^Tling *(CGVector at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if (strcmp(enc, @encode(UIOffset)) == 0) {
                return ^Tling *(UIOffset at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if(strcmp(enc, @encode(CATransform3D)) == 0) {
                return ^Tling *(CATransform3D at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            } else if(strcmp(enc, @encode(CGAffineTransform)) == 0) {
                return ^Tling *(CGAffineTransform at0, ...) {
                    va_list li;
                    va_start(li, at0);
                    return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                };
                break;
            }
            if (@available(iOS 11.0, *)) {
                if(strcmp(enc, @encode(NSDirectionalEdgeInsets)) == 0) {
                    return ^Tling *(NSDirectionalEdgeInsets at0, ...) {
                        va_list li;
                        va_start(li, at0);
                        return TlingSubAutoBlockProperty(ling, sel, act_class, li, enc, at0);
                    };
                    break;
                }
            }
        }
    }while(0);
    /// Type error
    return ^Tling *(CATransform3D at0, ...) {
        [ling pushError:[[TlingErr allocWith:ling.target] initForUserDescription:@"Unsupported parameter type"]];
        return ling;
    };
}

/// 所有闭包属性形式方法的实现入口2
Tling *TlingSubAutoBlockProperty(__kindof Tling *ling, SEL sel, Class act_classz, va_list li, const char *enc0 , ...) {
    if(ling->error  || ling->status == AlingStatusReturning) {
        return ling;
    }
    if(ling->status != AlingStatusFuture) {
        if(![ling.target isKindOfClass:ling.dependentClass]) {
            [ling pushError:[[TlingErr allocWith:(ling.itemCount > 1) ? ling.targets : ling.target] initForKind:ling.dependentClass sel:sel]];
            return ling;
        }
    }
    va_list li_at0;
    va_start(li_at0, enc0);
    if(ling.itemCount == 1) {
        if(!sendMsgWork_va(ling.target, 0, ling, sel, act_classz, li, enc0, li_at0)) {
            return ling;
        }
    } else if(ling.itemCount > 1) {
        NSUInteger i = 0;
        for (id target in ling) {
            if(!sendMsgWork_va(target, i++, ling, sel, act_classz, li, enc0, li_at0)) {
                return ling;
            }
        }
    }
    ling->step++;
    return ling;
}

@end

/// 普通属性形式的发消息的工作
/// @param target 目标对象
/// @param index 链的游标
/// @param ling 链
/// @param sel 消息名
/// @param act_class 即将构造方法的类
bool sendMsgWork(id target, NSUInteger index, Tling *ling, SEL sel, Class act_class) {
    /// 参考：sendMsgWork_va()
    AlingAction *act = [[act_class alloc] init];
    [act setTarget:ling.target];
    [act setStep:ling->step];
    if(ling->status == AlingStatusFuture) {
        DynamilingInfo *info = [[DynamilingInfo alloc] init];
        info.dependentClass = ling.dependentClass;
        info.sel            = sel;
        act.dynamilingInfo  = info;
        [ling->dynamicActions addObject:act];
        return false;
    }
    TlingErr *err;
    id newTag = [act sendMsg:&err];
    if(err) {
        [ling pushError:err];
        return false;
    }
    if(newTag) {
        if(ling.itemCount == 1) {
            [ling switchTarget:newTag];
        } else {
            [ling.targets replaceObjectAtIndex:index withObject:newTag];
        }
    }
    return true;
}

/// 普通属性形式的发消息的工作
/// @param target 目标对象
/// @param index 链的游标
/// @param ling 链
/// @param sel 消息名
/// @param act_classz 即将构造方法的类
/// @param li_va 实际的第一个参数之后的参数列表
/// @param enc0 实际的第一个参数的类型编码
/// @param li_at0 实际的第一个参数被构造的参数列表
bool sendMsgWork_va(id target, NSUInteger index, Tling *ling, SEL sel, Class act_classz, va_list li_va, const char *enc0, va_list li_at0) {
    /// 构造方法
    AlingAction<TActionParametric,TActionVariableParametric> *act = [[act_classz alloc] init];
    [act setTarget:target];
    [act setStep:ling->step];
    /// 传参
    for (NSUInteger idx = 0; idx < act.count  ; idx++) {
        if(idx == 0) {
            setValue2Action(act, idx, enc0, li_at0);
        } else {
            const char *code = [act_classz encodeAt:idx];
            if(!code) break;
            setValue2Action(act, idx, code, li_va);
        }
    }
    /// 处理可变参数列表
    if(class_conformsToProtocol(act_classz, @protocol(TActionVariableParametric))) {
        while (setValue2Action(act, -1, @encode(id), li_va));
    }
    /// 动态链则仅存储后返回
    if(ling->status == AlingStatusFuture) {
        DynamilingInfo *info = [[DynamilingInfo alloc] init];
        info.dependentClass = ling.dependentClass;
        info.sel            = sel;
        act.dynamilingInfo  = info;
        [ling->dynamicActions addObject:act];
        return false;
    }
    TlingErr *err;
    /// 执行方法
    id newTag = [act sendMsg:&err];
    /// 处理异常
    if(err) {
        [ling pushError:err];
        return false;
    }
    if(newTag) {
        /// 更新目标对象
        if(ling.itemCount == 1) {
            [ling switchTarget:newTag];
        } else {
            [ling.targets replaceObjectAtIndex:index withObject:newTag];
        }
    }
    return true;
}

/// 方法的入参工作
/// @param act 方法
/// @param idx 参数的游标，-1指可变参数列表
/// @param enc 入参参数的类型编码
/// @param li 入参所属的参数列表
bool setValue2Action(AlingAction<TActionParametric, TActionVariableParametric> *act, NSUInteger idx, const char *enc, va_list li) {
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
        } else if (strcmp(enc, @encode(Class)) == 0) {       //Class
            Class v = va_arg(li, Class);
            ((void(*)(id,SEL,Class))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(IMP)) == 0 ) {         //IMP
            IMP v = va_arg(li, IMP);
            ((void(*)(id,SEL,IMP))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(SEL)) == 0) {         //SEL
            SEL v = va_arg(li, SEL);
            ((void(*)(id,SEL,SEL))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(double)) == 0) {      //double
            double v = va_arg(li, double);
            ((void(*)(id,SEL,double))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(float)) == 0) {       //float
            float v = va_arg(li, double);
            ((void(*)(id,SEL,float))objc_msgSend)(act,setter,v);
            break;
        } else if (enc[0] == _C_PTR) {                       //pointer ( and const pointer)
            void *v = va_arg(li, void*);
            ((void(*)(id,SEL,void*))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(char *)) == 0) {     //char* (and const char*)
            char *v = va_arg(li, char *);
            ((void(*)(id,SEL,char *))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(unsigned long)) == 0) {
            unsigned long v = va_arg(li, unsigned long);
            ((void(*)(id,SEL,unsigned long))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(unsigned long long)) == 0) {
            unsigned long long v = va_arg(li, unsigned long long);
            ((void(*)(id,SEL,unsigned long long))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(long)) == 0) {
            long v = va_arg(li, long);
            ((void(*)(id,SEL,long))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(long long)) == 0) {
            long long v = va_arg(li, long long);
            ((void(*)(id,SEL,long long))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(int)) == 0) {
            int v = va_arg(li, int);
            ((void(*)(id,SEL,int))objc_msgSend)(act,setter,v);
            break;
        } else if (strcmp(enc, @encode(unsigned int)) == 0) {
            unsigned int v = va_arg(li, unsigned int);
            ((void(*)(id,SEL,unsigned int))objc_msgSend)(act,setter,v);
            break;
        } else if ((strcmp(enc, @encode(bool)) == 0          ||
                   strcmp(enc, @encode(BOOL)) == 0           ||
                   strcmp(enc, @encode(char)) == 0           ||
                   strcmp(enc, @encode(short)) == 0          ||
                   strcmp(enc, @encode(unsigned char)) == 0  ||
                   strcmp(enc, @encode(unsigned short)) == 0)) {
            short v = va_arg(li, int);
            ((void(*)(id,SEL,short))objc_msgSend)(act,setter,v);
            break;
        } else{
            //struct union and array
            if (strcmp(enc, @encode(CGRect)) == 0) {
                CGRect v = va_arg(li, CGRect);
                ((void(*)(id,SEL,CGRect))objc_msgSend)(act,setter,v);
                break;
            } else if(strcmp(enc, @encode(CGPoint)) == 0) {
                CGPoint v = va_arg(li, CGPoint);
                ((void(*)(id,SEL,CGPoint))objc_msgSend)(act,setter,v);
                break;
            } else if (strcmp(enc, @encode(CGSize)) == 0) {
                CGSize v = va_arg(li, CGSize);
                ((void(*)(id,SEL,CGSize))objc_msgSend)(act,setter,v);
                break;
            } else if (strcmp(enc, @encode(NSRange)) == 0) {
                NSRange v = va_arg(li, NSRange);
                ((void(*)(id,SEL,NSRange))objc_msgSend)(act,setter,v);
                break;
            } else if (strcmp(enc, @encode(UIEdgeInsets)) == 0) {
                UIEdgeInsets v = va_arg(li, UIEdgeInsets);
                ((void(*)(id,SEL,UIEdgeInsets))objc_msgSend)(act,setter,v);
                break;
            } else if (strcmp(enc, @encode(CGVector)) == 0) {
                CGVector v = va_arg(li, CGVector);
                ((void(*)(id,SEL,CGVector))objc_msgSend)(act,setter,v);
                break;
            } else if (strcmp(enc, @encode(UIOffset)) == 0) {
                UIOffset v = va_arg(li, UIOffset);
                ((void(*)(id,SEL,UIOffset))objc_msgSend)(act,setter,v);
                break;
            } else if(strcmp(enc, @encode(CATransform3D)) == 0) {
                CATransform3D v = va_arg(li, CATransform3D);
                ((void(*)(id,SEL,CATransform3D))objc_msgSend)(act,setter,v);
                break;
            } else if(strcmp(enc, @encode(CGAffineTransform)) == 0) {
                CGAffineTransform v = va_arg(li, CGAffineTransform);
                ((void(*)(id,SEL,CGAffineTransform))objc_msgSend)(act,setter,v);
                break;
            }
            if (@available(iOS 11.0, *)) {
                if(strcmp(enc, @encode(NSDirectionalEdgeInsets)) == 0) {
                    NSDirectionalEdgeInsets v = va_arg(li, NSDirectionalEdgeInsets);
                    ((void(*)(id,SEL,NSDirectionalEdgeInsets))objc_msgSend)(act,setter,v);
                    break;
                }
            }
        }
    }while(0);
    return true;
}

Class getActionClass(__kindof Tling *ling, SEL sel) {
    Class act_class = nil;
    for (Class lingC = object_getClass(ling); act_class == nil && lingC != _class_Tling ; lingC = class_getSuperclass(lingC)) {
        act_class = NSClassFromString([NSString stringWithFormat:@"%@_%@",NSStringFromClass(lingC),NSStringFromSelector(sel)]);
    }
    return act_class;
}

#pragma mark - Public

NSDecimalNumber *ocling_get_decimal(id x) {
    if([x isKindOfClass:NSNumber.class]) {
        return [NSDecimalNumber decimalNumberWithDecimal:[x decimalValue]];
    }
    if([x isKindOfClass:NSString.class]) {
        return [NSDecimalNumber decimalNumberWithString:x];
    }
    if([x isKindOfClass:NSDecimalNumber.class]) return x;
    return nil;
}

NSSet *ocling_mutable_class_map(void) {
    static NSSet *_value;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _value = [NSSet setWithObjects:
                  NSMutableArray.class,
                  NSMutableDictionary.class,
                  NSMutableSet.class,
                  NSMutableData.class,
                  NSMutableIndexSet.class,
                  NSMutableAttributedString.class,
                  NSMutableParagraphStyle.class,
                  NSMutableOrderedSet.class,
                  NSMutableURLRequest.class,
                  NSMutableCharacterSet.class,
                  nil];
    });
    return _value;
}

/// 常用方法，提速
id ocling_mutablecopy_ifneed(id x) {
    if(!x) return nil;
    Class c = object_getClass(x);
    if([ocling_mutable_class_map() containsObject:c]) {
        return x;
    }
    if([c isSubclassOfClass:NSString.class]) {
        // 可变字符串的特殊判断
        if([x copy] != x) return x;
    }
    return [x mutableCopy];
}

bool ocling_is_mutableobject(id x) {
    Class c = object_getClass(x);
    if([ocling_mutable_class_map() containsObject:c]) {
        return x;
    }
    if([c isSubclassOfClass:NSString.class]) {
        // 可变字符串的特殊判断
        if([x copy] != x) return true;
    }
    return false;
}

NSString *_Nullable ocling_to_string(id x) {
    if(!x) return nil;
    Class c = object_getClass(x);
    if([c isSubclassOfClass:NSString.class]) {
        return x;
    }
    if(class_respondsToSelector(c, @selector(stringValue))) {
        return [x stringValue];
    }
    return [x description];
}

NSNumber *_Nullable ocling_to_number(id x) {
    if(!x) return nil;
    Class c = object_getClass(x);
    if([c isSubclassOfClass:NSNumber.class]) {
        return x;
    }
    if([c isSubclassOfClass:NSString.class]) {
        return [NSDecimalNumber decimalNumberWithString:x];
    }
    return nil;
}
