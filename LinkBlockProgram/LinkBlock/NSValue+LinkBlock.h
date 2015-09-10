//
//  NSValue+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/7.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSValueLinkBlock)
@property (nonatomic,copy) NSValue*         (^valueSetSizeToViews)(NSArray* views);
@property (nonatomic,copy) NSValue*         (^valueSetPointToViews)(NSArray* views);
@end