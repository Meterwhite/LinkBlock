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
    btn.blockFrameSet(20,20,150,80).blockBGColor(@"0xff22cc".blockToColorFromHexStr()).blockAddToView(self.view);
    btn.blockTitleSet(@"no can no bb", UIControlStateNormal);
    
    UILabel* lab = [UILabel new];
    lab.blockText(@"2b || !2b").blockTextColor(@"ff2222".blockToColorFromHexStr());
    lab.blockFrameSet(0,200,80,80).blockBGColor(@"#00ff00".blockToColorFromHexStr());
    lab.blockNumberOfLines(0).blockAlignment(NSTextAlignmentCenter).blockAlignTop().blockAddToView(self.view);
    
    
    [lab blockBlockSet:@"Say" executeBlock:^id{
        @"My teacher is MJ.".blockNSLog();
        float r = arc4random_uniform(256)/255.0;
        float g = arc4random_uniform(256)/255.0;
        float b = arc4random_uniform(256)/255.0;
        UIColor* color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        return color;
    }];
    
    
    [btn blockAddTarget:self forControlEvents:UIControlEventTouchUpInside withBlock:^(UIControlEvents event) {
        if(event!=UIControlEventTouchUpInside)
            return ;
        UIColor* color = [lab blockBlockExecute:@"Say"];
        lab.blockTextColor(color);
    }];
    
    
    CGPoint point= @"{0,0}".blockToCGPoint();
    
    BOOL b = @"123.3".blockIsFloating();
    
    NSMutableArray* arr;
    @[].blockMutableCopy().blockAddObjs(@[@"1",@"2",@"3"]).blockValueTo(&arr);
    arr.blockNSLog();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
