//
//  LinkBlock.h
//
//  Created by NOVO on 15/8/13.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

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

#import "UIImage+LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "UIControl+LinkBlock.h"
#import "UIColor+LinkBlock.h"
#import "UIView+LinkBlock.h"
#import "UIButton+LinkBlock.h"
#import "UIScrollView+LinkBlock.h"
#import "UIImageView+LinkBlock.h"
#import "UIViewController+LinkBlock.h"
#import "UITextField+LinkBlock.h"
#import "CALayer+LinkBlock.h"
#import "CAShapeLayer+LinkBlock.h"

//起手写宏
#ifndef linkObj
#define linkObj(object) (object?object:[LinkError share])
#endif

//引用类型返回值宏定义
#define LinkError_REF_AUTO(returnType , currType)\
currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]])\
    return (returnType *)self;\
if(![self isKindOfClass:[currType class]])\
    return (returnType *)[LinkError share]\

//值类型返回值宏定义
#define LinkError_VAL_IF(currType) \
currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]] || ![self isKindOfClass:[currType class]])

