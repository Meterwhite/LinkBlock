//
//  LinkBlock.h
//
//  Created by NOVO on 15/8/13.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkInfo.h"
#import "LinkGroup.h"
#import "LinkError.h"
#import "LinkReturn.h"
#import "Others+LinkBlock.h"

#import "NSArray+LinkBlock.h"
#import "NSAttributedString+LinkBlock.h"
#import "NSDictionary+LinkBlock.h"
#import "NSMutableArray+LinkBlock.h"
#import "NSMutableAttributedString+LinkBlock.h"
#import "NSMutableDictionary+LinkBlock.h"
#import "NSMutableString+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "NSString+LinkBlock.h"
#import "NSNumber+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "NSDate+LinkBlock.h"
#import "NSURL+LinkBlock.h"
#import "NSValue+LinkBlock.h"
#import "NSError+LinkBlock.h"
#import "JavaScriptCore+LinkBlock.h"

#import "UIImage+LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "UIControl+LinkBlock.h"
#import "UIColor+LinkBlock.h"
#import "UIView+LinkBlock.h"
#import "UIButton+LinkBlock.h"
#import "UIScrollView+LinkBlock.h"
#import "UIImageView+LinkBlock.h"
#import "UIViewController+LinkBlock.h"
#import "UITextView+LinkBlock.h"
#import "UITextField+LinkBlock.h"
#import "CALayer+LinkBlock.h"
#import "CAShapeLayer+LinkBlock.h"
#import "UIBezierPath+LinkBlock.h"
#import "UIWebView+LinkBlock.h"
#import "UITableView+LinkBlock.h"

//////////////////////////////////////////////////////////////////////
//MARK:基础
//////////////////////////////////////////////////////////////////////
//安全的起始（不取值可不需要）
#ifndef linkObj
#define linkObj(object) (object?object:[LinkError new])
#endif
/**
 <^()>获取链条返回值，并将链条信息对象和错误转nil
 ... = linkObj(..)...end;
 ... = linkObj(..)...linkIF(...)...end;
 */
#ifndef linkEnd
#define linkEnd linkEnd
#endif
/**
 <^(id* toObject)>将当前对象赋值到变量
 ...setTo(&...);
 */
#ifndef setTo
#define setTo setTo
#endif
//////////////////////////////////////////////////////////////////////
//MARK:条件
//////////////////////////////////////////////////////////////////////
/**
 <^(id obj)>以新对象执行其后链条，可以与linkIf，linkElse配合
 linkObjs(,,)...linkTo(aNewObj)...
 ...linkIf(...)...linkTo(aNewObj)...linkElse(...)...
 */
#ifndef linkTo
#define linkTo linkTo
#endif
/**
 <^()>根据条件是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 ...linkIF(...)...linkIF(...)...linkELSE()...
 ... = ...linkLoop(...)...linkIF(...)...ends();
 */
#ifndef linkIf
#define linkIf linkIf
#endif
/**
 <^()>从中断语句中恢复执行其后语句，与前一个linkIf配合使用
 ...linkIF(...)...linkIF(...)...linkELSE()...
 */
#ifndef linkElse
#define linkElse linkElse
#endif
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_YES...LinkElse....
 */
#ifndef linkIf_YES
#define linkIf_YES linkIf_YES
#endif
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_NO...LinkElse...
 */
#ifndef linkIf_NO
#define linkIf_NO linkIf_NO
#endif
/**
 <^()>使其后语句跳空;可与分支配合
 ...[aNewLink:^(NSObject* fromObj){
 if(...){
 ...linkReturn;
 }
 }]...
 */
#ifndef linkReturn
#define linkReturn linkReturn
#endif

//////////////////////////////////////////////////////////////////////
//MARK:多对象链式编程
//////////////////////////////////////////////////////////////////////
//多对象链式编程
#ifndef linkObjs
#define linkObjs(object , args...) (object?[LinkGroup groupWithObjs:object,##args,nil]:[LinkError new])
#endif
/**
 使数组内对象执行多个链式编程，使用ends()可获取结果集合，
 如果结尾返回值为值型则该结果为第一个对象的链式执行结果，效果同使用end
 Arr.makeLinkObjs....
 */
#ifndef makeLinkObjs
#define makeLinkObjs makeLinkObjs
#endif
/**
 <^(id obj)>使新对象加入链条
 ...linkAnd(aObj)...linkAnd(bObj)...
 ... = ...linkAnd(aObj)...linkAnd(bObj)...ends();
 */
#ifndef linkAnd
#define linkAnd linkAnd
#endif
/**
 <^(NSUInteger idx)>使多链条中移除一个
 linkObjs(,,,)...linkOut(index)...
 */
#ifndef linkOut
#define linkOut linkOut
#endif
/**
 <^(NSUInteger idx)>取出多链条中一个
 linkObjs(,,,)...linkAt(index)...
 */
#ifndef linkAt
#define linkAt linkAt
#endif
/**
 <^()>取出多链条中第一个
 linkObjs(,,,)...linkFirstObj()...
 */
#ifndef linkFirstObj
#define linkFirstObj linkFirstObj
#endif
/**
 <^()>取出多链条中最后一个
 linkObjs(,,,)...linkLastObj()...
 */
#ifndef linkLastObj
#define linkLastObj linkLastObj
#endif
/**
 <^(NSUInteger count)>使其后的链条执行多次
 ...linkLoop(10)...
 */
#ifndef linkLoop
#define linkLoop linkLoop
#endif
/**
 <^()>多对象链式编程获取多个链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...ends();
 */
#ifndef linkEnds
#define linkEnds linkEnds
#endif
/**
 <^(NSUInteger idx)>多对象链式编程获取某一链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...endAt(index);
 */
#ifndef linkEndsAt
#define linkEndsAt linkEndsAt
#endif

//////////////////////////////////////////////////////////////////////
//MARK:控制
//////////////////////////////////////////////////////////////////////
//引用类型的返回值时的预处理
#ifndef LinkHandle_REF
#define LinkHandle_REF(currType)\
__kindof currType* _self = (currType*)self;\
if([_self isKindOfClass:[LinkInfo class]]){\
    if(((LinkInfo*)_self).infoType == LinkInfoError){\
        ((LinkError*)_self).throwCount++;\
        return _self;\
    }else if(((LinkInfo*)self).infoType == LinkInfoReturn){\
        return _self;\
    }\
}\
if(![_self isKindOfClass:[currType class]]&&\
   ![_self isKindOfClass:[LinkInfo class]]){\
    LinkError* error = [LinkError new];\
    error.needClass = NSStringFromClass([currType class]);\
    error.errorClass = NSStringFromClass([_self class]);\
    error.inFunc = [NSString stringWithUTF8String:__func__];\
    return error;\
}
#endif

//值类型的返回值时的预处理
#ifndef LinkHandle_VAL_IFNOT
#define LinkHandle_VAL_IFNOT(currType) \
__kindof currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]] || (![self isKindOfClass:[currType class]]&&![self isKindOfClass:[LinkGroup class]]))
#endif

//多对象链式编程控制引用返回类型时
#ifndef LinkGroupHandle_REF
#define LinkGroupHandle_REF(blockName , ...)\
if([self isKindOfClass:[LinkGroup class]]){\
    LinkGroup* group = (LinkGroup*)self;\
    NSMutableArray* returnObjs = [NSMutableArray new];\
    for (int i=0; i<group.linkObjects.count; i++) {\
        id re = group.linkObjects[i].blockName(__VA_ARGS__);\
        [returnObjs addObject:re];\
    }\
    [group.linkObjects setArray:returnObjs];\
    return (id)group;\
}
#endif
//多对象链式编程控制值返回类型时
#ifndef LinkGroupHandle_VAL
#define LinkGroupHandle_VAL(blockName , ...) \
if([self isKindOfClass:[LinkGroup class]]){\
    LinkGroup* group = (LinkGroup*)self;\
    return [group.linkObjects firstObject].blockName(__VA_ARGS__);\
}
#endif

//////////////////////////////////////////////////////////////////////
//MARK:其他
//////////////////////////////////////////////////////////////////////
#ifndef objIsEqualToEach
#define objIsEqualToEach(obj, args...) objIsEqualToEach(obj,##args,nil)
#endif
#ifndef objIsEqualToEach_n
#define objIsEqualToEach_n(obj, args...) objIsEqualToEach_n(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeone
#define objIsEqualToSomeone(obj, args...) objIsEqualToSomeone(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeone_n
#define objIsEqualToSomeone_n(obj, args...) objIsEqualToSomeone_n(obj,##args,nil)
#endif

#ifndef strAppendFormat
#define strAppendFormat(formatStr, args...) strAppendFormat(formatStr,##args,nil)
#endif

#ifndef numIsEqualToNum
#define numIsEqualToNum(...) numIsEqualToNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsEqualToNum_n
#define numIsEqualToNum_n(...) numIsEqualToNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatThanNum
#define numIsGreatThan(...) numIsGreatThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatThanNum_n
#define numIsGreatThanNum_n(...) numIsGreatThanNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatEqualNum_n
#define numIsGreatEqualNum_n(...) numIsGreatEqualNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(__VA_ARGS__);
#endif
#ifndef numIsGreatEqualNum_n
#define numIsGreatEqualNum_n(...) numIsGreatEqualNum_n(__VA_ARGS__);
#endif

#ifndef numIsLessThanNum
#define numIsLessThanNum(...) numIsLessThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsLessThanNum_n
#define numIsLessThanNum_n(...) numIsLessThanNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNum
#define numIsLessEqualNum(...) numIsLessEqualNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsLessEqualNum_n
#define numIsLessEqualNum_n(...) numIsLessEqualNum_n(LBBoxValue((__VA_ARGS__)))
#endif

//MARK:装箱
#define LBBoxValue(value) _LinkBoxValue(@encode(__typeof__((value))), (value))
static inline id _LinkBoxValue(const char *type, ...) {
    va_list v;
    va_start(v, type);
    id obj = nil;
    if (strcmp(type, @encode(id)) == 0) {
        id actual = va_arg(v, id);
        obj = actual;
    } else if (strcmp(type, @encode(CGPoint)) == 0) {
        CGPoint actual = (CGPoint)va_arg(v, CGPoint);
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(CGSize)) == 0) {
        CGSize actual = (CGSize)va_arg(v, CGSize);
        obj = [NSValue value:&actual withObjCType:type];
    } else if (strcmp(type, @encode(double)) == 0) {
        double actual = (double)va_arg(v, double);
        obj = [NSNumber numberWithDouble:actual];
    } else if (strcmp(type, @encode(float)) == 0) {
        float actual = (float)va_arg(v, double);
        obj = [NSNumber numberWithFloat:actual];
    } else if (strcmp(type, @encode(int)) == 0) {
        int actual = (int)va_arg(v, int);
        obj = [NSNumber numberWithInt:actual];
    } else if (strcmp(type, @encode(long)) == 0) {
        long actual = (long)va_arg(v, long);
        obj = [NSNumber numberWithLong:actual];
    } else if (strcmp(type, @encode(long long)) == 0) {
        long long actual = (long long)va_arg(v, long long);
        obj = [NSNumber numberWithLongLong:actual];
    } else if (strcmp(type, @encode(short)) == 0) {
        short actual = (short)va_arg(v, int);
        obj = [NSNumber numberWithShort:actual];
    } else if (strcmp(type, @encode(char)) == 0) {
        char actual = (char)va_arg(v, int);
        obj = [NSNumber numberWithChar:actual];
    } else if (strcmp(type, @encode(bool)) == 0) {
        bool actual = (bool)va_arg(v, int);
        obj = [NSNumber numberWithBool:actual];
    } else if (strcmp(type, @encode(unsigned char)) == 0) {
        unsigned char actual = (unsigned char)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedChar:actual];
    } else if (strcmp(type, @encode(unsigned int)) == 0) {
        unsigned int actual = (unsigned int)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedInt:actual];
    } else if (strcmp(type, @encode(unsigned long)) == 0) {
        unsigned long actual = (unsigned long)va_arg(v, unsigned long);
        obj = [NSNumber numberWithUnsignedLong:actual];
    } else if (strcmp(type, @encode(unsigned long long)) == 0) {
        unsigned long long actual = (unsigned long long)va_arg(v, unsigned long long);
        obj = [NSNumber numberWithUnsignedLongLong:actual];
    } else if (strcmp(type, @encode(unsigned short)) == 0) {
        unsigned short actual = (unsigned short)va_arg(v, unsigned int);
        obj = [NSNumber numberWithUnsignedShort:actual];
    }
    va_end(v);
    return obj;
}
