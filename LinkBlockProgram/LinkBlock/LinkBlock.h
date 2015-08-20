//
//  LinkBlock.h
//
//  Created by NOVO on 15/8/13.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
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
#import "UIImage+LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "UIControl+LinkBlock.h"
#import "UIColor+LinkBlock.h"
#import "UIView+LinkBlock.h"
#import "UIButton+LinkBlock.h"


#define LinkError_REF_AUTO_IF(returnType , currType)\
currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]])\
    return (returnType *)self;\
if(![self isKindOfClass:[currType class]])\
    return (returnType *)[LinkError share]\

#define LinkError_VAL_IF(currType) \
currType* _self = (currType*)self;\
if([self isKindOfClass:[LinkError class]] || ![self isKindOfClass:[currType class]])

