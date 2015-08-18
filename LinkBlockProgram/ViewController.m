//
//  ViewController.m
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import "ViewController.h"
#import "LinkBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.blockFrameSet(20,20,50,50).blockBGColor(@"0xff22cc".blockToColorFromHexStr()).blockAddToView(self.view);

//    [btn blockAddTarget:self forControlEvents:UIControlEventTouchUpInside withBlock: block];
//    [btn blockRemoveTarget:self forControlEvents:UIControlEventTouchUpInside withBlock:block];

    [btn blockBlockSet:nil executeBlock:^id{
        NSLog(@"im your father");
        return @"he";
    }];
    NSString* re= [btn blockBlockGet:@"log223"]();
//    NSString* rere= [btn blockBlockExecute:@"log2"];
    NSLog(@"%@", re);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
