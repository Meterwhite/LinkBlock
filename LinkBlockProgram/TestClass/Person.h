//
//  Person.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/24.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSNumber* tall;
@property (nonatomic,assign) BOOL live;
@property (nonatomic,strong) id info;
@end
