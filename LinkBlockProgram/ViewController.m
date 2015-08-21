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
    //添加一个按钮到视图上
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.viewSetFrame(20,20,150,80).viewBGColor(@"0xff22cc".strToColorFromHexStr()).viewAddToView(self.view).btnTitle(@"click change color", UIControlStateNormal);
    
    //添加一个标签到视图上
    UILabel* lab = [UILabel new];
    lab.frame = @"{{20,150},{150,30}}".strToCGRect();
    lab.labText(@"color").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop().viewAddToView(self.view);
    
    //给标签添加一个block
    [lab objBlockSet:@"Say" executeBlock:^id{
        @"log()".nslog();

        UIColor* color = [UIColor redColor];
        color = color.colorRedSet(arc4random_uniform(256)/255.0).colorGreenSet(arc4random_uniform(256)/255.0).colorBlueSet(arc4random_uniform(256)/255.0).end();
        return color;
    }];
    
    //添加按钮点击事件
    [btn controlAddTarget:self forControlEvents:UIControlEventTouchUpInside withBlock:^(UIControlEvents event) {
        if(event!=UIControlEventTouchUpInside)
            return ;
        UIColor* color = [lab objBlockExecute:@"Say"];
        lab.labTextColor(color);
        lab.viewAnimateShakeHorizental(0.5);
        btn.viewAnimateFlipFromTop(0.5,1,YES);
    }];
    
    
    
    NSString* str;
    NSComparisonResult result = @"".setTo(&str).strAppend(@"abc1.txt").strCompareNumberSensitive(@"abc2.txt");
    
    NSMutableArray* arr= @[].objMutableCopy().m_arrAddObjs(@[@"1",@"2",@"3"]).end();
    arr.nslog();
    @(123).objToString().nslog();
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
