//
//  TLingErr.h
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLingErr<__covariant ObjectType> : NSException

@property (nonatomic,nullable) ObjectType sender;

@property (nonatomic) NSUInteger step;

@property NSMutableDictionary *info;

+ (instancetype)allocWith:(ObjectType)sender;

- (instancetype)initForUserDescription:(NSString *)udes;

- (instancetype)initForKind:(Class)clz sel:(SEL)sel;

- (instancetype)initForMissingAct:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
