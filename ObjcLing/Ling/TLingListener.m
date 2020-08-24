//
//  TLingListener.m
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TLingListener.h"

@implementation TLingListener

- (instancetype)initWithNotice:(NSNotificationName)name
{
    self = [super init];
    if (self) {
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(noticed:) name:name object:nil];
    }
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)noticed:(NSNotification *)ntf {
    if(_whenNoticed) {
        _whenNoticed(ntf);
    }
}

@end
