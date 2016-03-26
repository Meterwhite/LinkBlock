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
    
    //创建属性字典
    AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15]).makeAttrDictTextColor([UIColor blackColor]);
    
    //添加一个按钮到视图上
    UIButtonNew
    .viewAddToView(self.view)
    .btnTitle(@"Button", UIControlStateNormal)
    .btnTitleColor([UIColor lightGrayColor],UIControlStateNormal)
    .viewBGColor(@"f0f0f0".strToUIColorFromHexStr())
    .frame= @"{{20,20},{150,80}}".strToCGRect();
    
    //添加一个标签到视图上，并且文本顶部对齐，中间对齐
    UILabelNew
    .labText(@"中间对齐顶部对齐")
    .viewSetFrame(20,200,150,80)
    .labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop()
    .viewAddToView(self.view)
    .viewBGColor(@"#f0f0f0".strToUIColorFromHexStr());
    
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
    arrForFilter.objToJsonString().nslog();


    //遍历字符串中的所有数字
    NSString* strHaveNumbers = @"我有5元，用了-20.67元";
    [strHaveNumbers strEnumerateScanNumberUsingBlock:^(double num, NSUInteger idx, BOOL *stop) {
        NSLog(@"%f",num);
    }];
    
    
    NSDictionary* dictNeesReplaceKey = @{
                              @"description":@"123",
                              @"dict":@{
                                      @"description":@"123",
                                      @"arr":@[
                                              @{
                                                  @"dict2":@{
                                                          @"description":@"123"
                                                          }
                                                  },
                                              @{
                                                  @"description":@"123123"
                                                  },
                                              @"adf"
                                              ]
                                      }
                              };
    //替换字典中的键，重新赋值，再打印
    dictNeesReplaceKey.dictReplaceKey(@"description", @"DESCRIPTION").setTo(&dictNeesReplaceKey).nslog();
    
    //高效阅读的sql编码方式，易查错，易修改
    BOOL sex = NO;
    [[[SQLNew SQLSelect:^(NSMutableString *makeSQL) {
        
        [makeSQL SQLIf:sex==0 using:^(NSMutableString *makeSQL) {
            makeSQL.SQLStr(@"*");
        } elseUsing:^(NSMutableString *makeSQL) {
            makeSQL.SQLArr(@[@"id",@"name",@"age",@"sex",@"nickName",@"address",@"point"]);
        }];
    }] SQLFrom:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLArr(@[@"Student" , @"Teacher", @"Foods"]);
    }] SQLWhere:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLStr( @"id >").SQLIntInStr(1000);
    }].nslog();

    //2
    [[SQLNew SQLCreate:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLStr(@"table if not exists");
    }].SQLStr(@"Person") SQLValues:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLStr(@"id integer primary key").SQL_Comma();
        makeSQL.SQLStr(@"name text").SQL_Comma();
        makeSQL.SQLStr(@"sex integer").SQL_Comma();
        makeSQL.SQLStr(@"address text");
    }].nslog();
    
    //便捷测试按钮
    [self.view viewAddTestBtn:CGRectMake(20,370,150,80) block:^void (NSInteger idx , UIButton* testButton) {
        
        testButton.titleLabel.numberOfLines=2;
        testButton.titleLabel.font=[UIFont systemFontOfSize:16];
        testButton.titleLabel.textAlignment=NSTextAlignmentCenter;
        if(idx%2==0){//偶数
            
            testButton.viewBGColor([UIColor redColor])
            .btnTitleColor([UIColor greenColor],UIControlStateNormal);
            [testButton setTitle:[NSString stringWithFormat:@"添加测试按钮\n%d",idx] forState:UIControlStateNormal];
        }else{//奇数
            
            testButton.viewBGColor([UIColor greenColor])
            .btnTitleColor([UIColor redColor],UIControlStateNormal);;
            [testButton setTitle:[NSString stringWithFormat:@"添加测试按钮\n%d",idx] forState:UIControlStateNormal];
        }
    }];
    
}
@end