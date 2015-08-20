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
    btn.viewSetFrame(20,20,150,80).viewBGColor(@"0xff22cc".strToColorFromHexStr()).viewAddToView(self.view);
    btn.btnTitle(@"no can no bb", UIControlStateNormal);
    
    UILabel* lab = [UILabel new];
    lab.labText(@"2b || !2b").labTextColor(@"ff2222".strToColorFromHexStr());
    lab.viewSetFrame(0,200,80,80).viewBGColor(@"#00ff00".strToColorFromHexStr());
    lab.labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop().viewAddToView(self.view);
    
    
    [lab objBlockSet:@"Say" executeBlock:^id{
        @"My teacher is MJ.".log();
        float r = arc4random_uniform(256)/255.0;
        float g = arc4random_uniform(256)/255.0;
        float b = arc4random_uniform(256)/255.0;
        UIColor* color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
        return color;
    }];
    
    
    [btn controlAddTarget:self forControlEvents:UIControlEventTouchUpInside withBlock:^(UIControlEvents event) {
        if(event!=UIControlEventTouchUpInside)
            return ;
        UIColor* color = [lab objBlockExecute:@"Say"];
        lab.labTextColor(color);
    }];
    
    CGPoint point= @"{0,0}".strToCGPoint();
    
    BOOL b = @"123.3".strIsFloating();
    
    NSString* str;
    @"".strAppend(@"123").strReplace(@"2",@",").setTo(&str);
    
    
    NSMutableArray* arr= @[].objMutableCopy().m_arrAddObjs(@[@"1",@"2",@"3"]).end();
    arr.log();
    
    
//    @{@"fdafda%@%,%@,%@",a,b,c}
//    a.blockNSLog(@"asdf:%@");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
