//
//  ViewController.m
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "ViewController.h"
#import "LinkBlock.h"
#import "Person.h"
#import "Man.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //【New】支持多对象链式编程
    //1.如果使用多个对象的链式编程，需要取值的时候请调用ends()获取多个结果
    //2.如果调用end()只会取得第一个对象的链条返回值
    //3.使用endsAt()可以获取指定index对象的链条返回值
    //4.如果链条结尾返回的是“值类型”，那么该值是第一个对象的链条返回值
    //5.使用项目中的“方法”对多对象的链式编程不起作用
    //写法一
    UIView* viewA = UIViewNew.viewSetFrame(45,100,20,20);
    UIView* viewB = UIViewNew.viewSetFrame(120,100,20,20);
    
    linkObjs(viewA, viewB).viewAddToView(self.view).viewBGColor([UIColor lightGrayColor]);
    //写法二
    NSMutableArray* arrA = [NSMutableArray arrayWithObjects:@"A", nil];
    NSMutableArray* arrB = [NSMutableArray arrayWithObjects:@"B", nil];
    NSMutableArray* arrC = [NSMutableArray arrayWithObjects:@"C", nil];
    NSArray* linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").ends();
    //写法三
    linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").ends();
    //写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了
    linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").ends();
    
    /** *** ** *** ** *** ** *** ** *** ** *** ** *** ** *** ** *** ** *** ** *** ** */
    //去空格和换行，并打印
    @" 五 千 年 的 风 和 雨 啊 \r\n 唱 了 多 少 萌 ".strClearSpaceAndWrap().nslog();
    //字符串比较大小
    @"123".strCompare(@"111");
    //对数字敏感的字符串比较
    @"abc1.txt".strCompareNumberSensitive(@"abc2.txt");
    
    //查找最大数
    @"[12,43,534]".strToNSArrary(NSUTF8StringEncoding).arrMaxNumber().nslogTitle(@"最大数是:\n");
    //遍历元字符和自定义规则元字符
    NSString* strForEnumerateComposed = @"[海贼王]になる男だ[微笑]\n😈😴ABC";
    [strForEnumerateComposed strEnumerateComposedAndCustom:@"\\[[\u4E00-\u9FA5]+\\]" usingBlock:^(NSString *string, NSRange range, BOOL isCustom, BOOL *stop) {
        //...
    }];
    
    //对象转字典
    Man* man = [Man new];
    man.name = @"old jack";
    Man* jack = [Man new];
    jack.name = @"jack";
    Man* grandFather = [Man new];
    grandFather.name = @"jackson";
    man.sun = jack;
    man.family = @[jack,grandFather];
    man.objToNSDictionaryDeep(NO);
    //将对象解析为字典在控制台打印
    man.poDeep();
    
    //创建属性字典
    AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15]).makeAttrDictTextColor([UIColor blackColor]);
    
    //添加一个按钮到视图上
    UIButtonNew
    .viewAddToView(self.view)
    .btnTitle(@"Button", UIControlStateNormal)
    .btnTitleColor([UIColor brownColor],UIControlStateNormal)
    .btnTitleColor([UIColor brownColor].colorHighlightDarkColor(),UIControlStateHighlighted)
    .viewBGColor(@"f0f0f0".strToUIColorFromHexStr())
    .frame= @"{{20,20},{150,80}}".strToCGRect();
    
    
    //添加一个标签到视图上，并且文本顶部对齐，中间对齐
    UILabelNew
    .viewSetFrame(20,200,150,80)
    .labText(@"中间对齐顶部对齐")
    .labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop()
    .viewAddToView(self.view)
    .viewBGColor(@"#f0f0f0".strToUIColorFromHexStr());
    
    //字符串常量直接转颜色
    @"0xff22cc".strToUIColorFromHexStr();//0x.. ，#..，..
    
    //正则表达式替换_xxx_为[xxx]
    @"name=_boom_".strRegexReplace(@"(_)(\\w+)(_)" , @"[$2]");
    //正则表达式验证是否为邮箱
    @"quxingyi@outlook.com".strRegexIsMatch(@"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$") ? @"is email".nslog() : @"not email".nslog();
    
    //数组过滤
    NSArray* arrForFilter = @[ @{@"name":@"ali", @"age":@(123)} ,
                               @{@"name":@"bli", @"age":@(0)}   ,
                               @{@"name":@"cli", @"age":@(12)}  ,
                               @{@"name":@"dli", @"age":@(-45)}  ];
    //过滤age<0的数据
    arrForFilter.arrFilter(@"age<0").setTo(&arrForFilter);
    //过滤age<100 并且 age>-1 的数据
    [arrForFilter arrEnumerateWithPredicateFormat:@"age>-1 and age<100"
                                       usingBlock:^(NSObject* obj, NSUInteger idx, BOOL *stop) {
        //...
    }];
    
    //对象转json
    arrForFilter.objToJsonString().nslog();


    //遍历字符串中的所有数字
    NSString* strHaveNumbers = @"有5元，用了-20.67元";
    [strHaveNumbers strEnumerateScanNumberUsingBlock:^(double num, NSUInteger idx, BOOL *stop) {
        //...
    }];
    
    
    //替换字典中的键，再赋值
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
    dictNeesReplaceKey.dictReplaceKey(@"description", @"DESCRIPTION").setTo(&dictNeesReplaceKey).nslog();
    
    //高效阅读的sql编码方式，易查错，易修改
    /** 
        if(sex == 0){
            select * from Student,Teacher,Foods where id > 1000
        }else{
            select id,name,age,sex from Student,Teacher,Foods where id > 1000
        }
        如下：
     */
    BOOL sex = NO;
    [[[SQLNew SQLSelect:^(NSMutableString *makeSQL) {
        
        [makeSQL SQLIf:sex==0 using:^(NSMutableString *makeSQL) {
            makeSQL.SQLStr(@"*");
        } elseUsing:^(NSMutableString *makeSQL) {
            makeSQL.SQLArr(@[@"id",@"name",@"age",@"sex"]);
        }];
    }] SQLFrom:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLArr(@[@"Student" , @"Teacher", @"Foods"]);
    }] SQLWhere:^(NSMutableString *makeSQL) {
        
        makeSQL.SQLStr( @"id >").SQLIntInStr(1000);
    }].nslog();
    
    //便捷测试按钮
    UIButton* testButtont = [self.view viewAddTestBtn:CGRectMake(20,370,150,80) block:^void (NSInteger idx , UIButton* testButton) {
        
        testButton.titleLabel.numberOfLines=2;
        testButton.titleLabel.font=[UIFont systemFontOfSize:16];
        testButton.titleLabel.textAlignment=NSTextAlignmentCenter;
        if(idx%2==0){
            
            testButton
            .btnTitleColor(@"42a7f4".strToUIColorFromHexStr(),UIControlStateNormal)
            //设置按钮字体高亮色为系统高亮色
            .btnTitleColor(@"42a7f4".strToUIColorFromHexStr().colorHighlightDarkColor(),UIControlStateHighlighted)
            .btnTitle([NSString stringWithFormat:@"添加测试按钮\n%ld",(long)idx],UIControlStateNormal);
        }else{
            
            testButton
            .btnTitleColor([UIColor orangeColor],UIControlStateNormal)
            .btnTitleColor([UIColor orangeColor].colorHighlightDarkColor(),UIControlStateHighlighted)
            .btnTitle([NSString stringWithFormat:@"添加测试按钮\n%ld",(long)idx],UIControlStateNormal);
        }
    }];
    
#warning PS
    //起手写宏linkObj(obj)，确保对象为nil时不报错
    //end()取值时过滤掉链接错误并返回nil或者正确的对象
    id value = linkObj(nil).end();
}
@end
