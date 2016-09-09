//
//  LinkBlock.h
//
//  Created by NOVO on 15/8/13.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkInfo.h"
#import "LinkGroup.h"
#import "LinkError.h"

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

//////////////////////////////////////////////////////////////////////
//MARK:基础
//////////////////////////////////////////////////////////////////////
//安全的起始对象
#ifndef linkObj
#define linkObj(object) (object?object:[LinkError new])
#endif
//获取链条返回值，并将链条信息对象和错误转nil
#ifndef end
#define end end
#endif
//将当前对象赋值到变量
#ifndef setTo
#define setTo setTo
#endif

//////////////////////////////////////////////////////////////////////
//MARK:多对象链式编程
//////////////////////////////////////////////////////////////////////
//多对象链式编程
#ifndef linkObjs
#define linkObjs(object , args...) (object?[LinkGroup groupWithObjs:object,##args,nil]:[LinkError new])
#endif
//使数组多对象链式编程
#ifndef makeLinkObjs
#define makeLinkObjs makeLinkObjs
#endif
//使新对象加入链条
#ifndef linkAnd
#define linkAnd linkAnd
#endif
//使多链条中移除一个
#ifndef linkOut
#define linkOut linkOut
#endif
//取出多链条中一个
#ifndef linkAt
#define linkAt linkAt
#endif
//使其后的链条执行多次
#ifndef linkLoop
#define linkLoop linkLoop
#endif
//多对象链式编程获取多个链条返回值，并将错误转nil
#ifndef ends
#define ends ends
#endif
//多对象链式编程获取某一链条返回值，并将错误转nil
#ifndef endsAt
#define endsAt endsAt
#endif

//////////////////////////////////////////////////////////////////////
//MARK:控制
//////////////////////////////////////////////////////////////////////
//引用类型的返回值时的预处理
#ifndef LinkHandle_REF
#define LinkHandle_REF(returnType , currType)\
__kindof currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]]){\
    ((LinkError*)self).throwCount++;\
    return (returnType *)self;\
}\
if(![self isKindOfClass:[currType class]]&&\
    ![self isKindOfClass:[LinkGroup class]]){\
    LinkError* error = [LinkError new];\
    error.needClass = NSStringFromClass([currType class]);\
    error.errorClass = NSStringFromClass([self class]);\
    error.inFunc = [NSString stringWithUTF8String:__func__];\
    return (returnType *)error;\
}
#endif

//值类型的返回值时的预处理
#ifndef LinkHandle_VAL_IFNOT
#define LinkHandle_VAL_IFNOT(currType) \
__kindof currType* _self = (currType*)self;\
if(![self isKindOfClass:[LinkInfo class]]&&![self isKindOfClass:[currType class]])
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

#ifndef objIsEqualToSomeone
#define objIsEqualToSomeone(obj, args...) objIsEqualToSomeone(obj,##args,nil)
#endif

#ifndef strAppendFormat
#define strAppendFormat(formatStr, args...) strAppendFormat(formatStr,##args,nil)
#endif

#ifndef numIsEqualToNum
#define numIsEqualToNum(...) numIsEqualToNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatThanNum
#define numIsGreatThan(...) numIsGreatThanNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(__VA_ARGS__);
#endif

#ifndef numIsLessThanNum
#define numIsLessThanNum(...) numIsLessThanNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNum
#define numIsLessEqualNum(...) numIsLessEqualNum(LBBoxValue((__VA_ARGS__)))
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