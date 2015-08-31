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
    
    //去空格和换行，并打印
    @" 吴 倩 莲 的 风 和 欲 啊 \r\n 藏 了 多 少 梦 ".strClearSpaceAndWrap().nslog();
    //字符串比较大小
    @"123".strCompare(@"111");
    //对数字敏感的字符串比较
    @"abc1.txt".strCompareNumberSensitive(@"abc2.txt");

    
    
    //添加一个按钮到视图上
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.viewSetFrame(20,20,150,80).viewBGColor(@"0xff22cc".strToColorFromHexStr()).viewAddToView(self.view).btnTitle(@"click change color", UIControlStateNormal);
    
    //添加一个标签到视图上
    UILabel* lab = [UILabel new];
    lab.frame = @"{{20,150},{150,30}}".strToCGRect();
    lab.labText(@"color").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop().viewAddToView(self.view);
    
    //给标签添加一个block
    [lab objBlockSet:@"Say" block:^id{
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
        lab.viewAnimateShakeHorizental(0.5);  // animation
        btn.viewAnimateFlipFromTop(0.5,1,YES);// animation
    }];
    
    
    

    
    //正则表达式替换_xxx_为[xxx]
    @"name=_boom_".strRegexReplace(@"(_)(\\w+)(_)" , @"[$2]").nslog();
    //正则表达式验证是否为邮箱
    @"quxingyi@outlook.com".strRegexIsMatch(@"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$") ? @"YES email".nslog() : @"NO email".nslog();
    
    
    //数组过滤
    NSArray* arrForFilter = @[ @{@"name":@"ali", @"age":@(123)} ,
                               @{@"name":@"bli", @"age":@(0)}   ,
                               @{@"name":@"cli", @"age":@(12)}  ,
                               @{@"name":@"dli", @"age":@(-45)}  ];
    //过滤age<0的数据
    arrForFilter.arrFilter(@"age<0").nslog();
    //过滤age<0的数据
    [arrForFilter arrEnumerateWithPredicateFormat:@"age>-1 and age<100"
                                       usingBlock:^(NSObject* obj, NSUInteger idx, BOOL *stop) {
        obj.nslog();
    }];
    

}

@end
