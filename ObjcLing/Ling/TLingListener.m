//
//  TLingListener.m
//  ObjcLingDemo
//
//  Created by MeterWhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TLingListener.h"

@interface TLingListener ()
@property (nullable,nonatomic,copy) NSString *name;;
@end

@implementation TLingListener

- (instancetype)initWithNotice:(NSNotificationName)name
{
    self = [super init];
    if (self) {
        _name = name;
        [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(notified:) name:_name object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Objcling: listener -- dealoc ");
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)notified:(NSNotification *)ntf {
    if(_whenNotified) {
        _whenNotified(ntf);
    }
}

@end
