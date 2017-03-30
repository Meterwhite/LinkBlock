//
//  LinkBlockDefine.h
//  LinkBlockProgram
//
//  Created by NOVO on 17/3/14.
//  Copyright © 2017年 NOVO. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 定义LinkBlock属性
 */
#ifndef LBDeclare
#define LBDeclare @property (nonatomic,copy,readonly)
#endif
/**
 定义LinkBlock方法
 */
#ifndef LBDeclare_F
#define LBDeclare_F @property (nonatomic,readonly)
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
    return (id)self;\
}else if(((LinkInfo*)self).infoType == LinkInfoReturn){\
    return (id)self;\
}\
}\
if(![_self isKindOfClass:[currType class]]&&\
![_self isKindOfClass:[LinkInfo class]]){\
    LinkError* error = [LinkError new];\
    error.needClass = NSStringFromClass([currType class]);\
    error.errorClass = NSStringFromClass([_self class]);\
    error.inFunc = [NSString stringWithUTF8String:__func__];\
    return (id)error;\
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

#define LBObjcValue(value) _LinkObjcValue(@encode(__typeof__((value))), (value))
static inline id _LinkObjcValue(const char *type, ...) {
    va_list v;
    va_start(v, type);
    id obj;
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
    return obj?obj:[NSNull null];
}
