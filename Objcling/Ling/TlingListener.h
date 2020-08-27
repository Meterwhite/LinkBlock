//
//  TlingListener.h
//  Objcling
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TlingListener : NSObject
- (instancetype)initWithNotice:(NSNotificationName)nam;
@property (nonatomic,copy) void(^whenNotified)(NSNotification *ntf);
@end

NS_ASSUME_NONNULL_END
