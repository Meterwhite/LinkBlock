//
//  ViewController.m
//  ObjcLing
//
//  Created by MeterWhite on 2020/8/15.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "ViewController.h"
#import "ObjcLing.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @"AK".ling.more(@"QQ").moreN(@"JJ",@"PP",nil).log.done();
    
    NSLog(@"");
}


@end
