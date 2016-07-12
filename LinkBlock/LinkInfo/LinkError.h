//
//  LinkError.h
//
//  Created by NOVO on 15/8/20.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkInfo.h"

@interface LinkError : LinkInfo
@property (nonatomic,copy) NSString* needClass;
@property (nonatomic,assign) char* inFunc;

- (NSString *)description;
- (NSString *)debugDescription;
@end
