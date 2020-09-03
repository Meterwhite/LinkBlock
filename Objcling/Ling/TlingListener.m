//
//  TlingListener.m
//  Objcling
//
//  Created by meterwhite on 2020/8/23.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TlingListener.h"

@interface TlingListener ()
@property (nullable,nonatomic,copy) NSString *name;;
@end

@implementation TlingListener

- (instancetype)initWithNotice:(NSNotificationName)nam
{
    self = [super init];
    if (self) {
        _name = nam;
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
