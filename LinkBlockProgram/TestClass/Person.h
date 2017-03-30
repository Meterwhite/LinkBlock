//
//  Person.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/8/24.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@protocol PersonDelegate <NSObject>

- (id)delegatePerson:(id)info;

@end

@interface Person : NSObject
@property (nonatomic,copy) NSString* name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,strong) NSNumber* tall;
@property (nonatomic,assign,readonly) BOOL sex;
@property (nonatomic,strong) id info;
@property (nonatomic,assign) CGRect frame;
@property (nonatomic,strong) NSArray* friends;
@property (nonatomic,weak) id<PersonDelegate> delegate;
@property  NSRange range;

- (instancetype)initWithSex:(BOOL)sex;

- (void)say;
- (void)say2;
- (NSString*)myNameIs;
- (NSString*)answerQuestion:(NSString*)question;
- (NSString*)answerQuestion:(NSString*)question question2:(NSString*)question2;
- (NSString*)answerQuestion:(NSString*)question question2:(NSString*)q2 question3:(NSString*)question3;
- (double)compute:(double)num1 num2:(double)num2;
@end
