//
//  ViewController.m
//  Objcling
//
//  Created by meterwhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "ViewController.h"
#import "ObjcLing.h"

@interface ViewController ()
@property (nullable,nonatomic,strong) TObjectling *ling;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ling =
    @"AK".ling.will.more(@"QQ").moreN(@"JJ",@"PP",nil).log.notifiedIN(@"嘿嘿", ^(id  _Nonnull x, NSNotification * _Nonnull ntf) {
        NSLog(@"通知了");
    }).notifiedGo(@"哈哈");
    
    self.ling.moreN(@"1",@"2");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NSNotificationCenter.defaultCenter postNotificationName:@"嘿嘿" object:nil];
        [NSNotificationCenter.defaultCenter postNotificationName:@"嘿嘿" object:nil];
        [NSNotificationCenter.defaultCenter postNotificationName:@"哈哈" object:nil];
        [NSNotificationCenter.defaultCenter postNotificationName:@"哈哈" object:nil];
        self.ling = nil;
    });
    NSLog(@"");
}


@end
