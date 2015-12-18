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
    @" 吴 倩 莲 的 风 和 欲 啊 \r\n 唱 了 多 少 萌 ".strClearSpaceAndWrap().nslog();
    //字符串比较大小
    @"123".strCompare(@"111");
    //对数字敏感的字符串比较
    @"abc1.txt".strCompareNumberSensitive(@"abc2.txt");
    
    //查找最大数
    @"[12,43,534]".strToNSArrary(NSUTF8StringEncoding).arrMaxNumber().nslogTitle(@"最大数是:\n");
    
    
    //添加一个按钮到视图上
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    linkObj(btn).viewSetFrame(20,20,150,80).viewAddToView(self.view).btnTitle(@"Button", UIControlStateNormal);
    
    //安全使用KVC
    linkObj(btn).setValueForKeySafe(@"0xff22cc".strToUIColorFromHexStr() , @"backgroundColor");
    
    //添加一个标签到视图上
    UILabel* lab = [UILabel new];
    lab.frame = @"{{20,150},{150,30}}".strToCGRect();
    linkObj(lab).labText(@"Label").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop().viewAddToView(self.view);
    
    //字符串常量直接转颜色
    @"0xff22cc".strToUIColorFromHexStr();//0x.. ，#..，..
    
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
    //过滤age<100 并且 age>-1 的数据
    [arrForFilter arrEnumerateWithPredicateFormat:@"age>-1 and age<100"
                                       usingBlock:^(NSObject* obj, NSUInteger idx, BOOL *stop) {
        obj.nslog();
    }];
    
    //对象转json
    arrForFilter.objToJsonString();
    
    UIView* newView = [[UIView alloc] initWithFrame:CGRectMake(80, 280, 80, 80)].viewBGColor([UIColor grayColor]);
    newView.viewAddToView(self.view);

    NSString* strHaveNumbers = @"我有5元，用了-20.67元";
    [strHaveNumbers strEnumerateScanNumberUsingBlock:^(double num, NSUInteger idx, BOOL *stop) {
        NSLog(@"%f",num);
    }];
}
@end