//
//  TLingListener.h
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TLingListener : NSObject
- (instancetype)initWithNotice:(NSNotificationName)name;
@property (nonatomic,copy) void(^whenNotified)(NSNotification *ntf);
@end

NS_ASSUME_NONNULL_END
