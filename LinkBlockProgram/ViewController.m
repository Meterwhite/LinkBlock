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
    
    //////////////////////////////////////////////////////////////////////
    //【一】基础语法
    //////////////////////////////////////////////////////////////////////
    //不需要取值的情况如：
    //添加一个标签到视图上
    UILabelNew
    .labText(@"UILable").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter)
    .viewSetFrame(20,200,150,80)
    .viewBGColor(@"#f0f0f0".strToUIColorFromHex())
    .viewAddToView(self.view);
    
    //需要取值的情况：
    //链首对象为空需要使用linkObj，报错则需要使用end获取真实的值
    NSString* priceFromNet = nil;//如果网络获取的对象为空
    NSString* priceStr = linkObj(priceFromNet).strAppend(@"￥").linkEnd;//这里控制台会报错
    
    //////////////////////////////////////////////////////////////////////
    //【二】条件语法
    //////////////////////////////////////////////////////////////////////
    //...linkIf(...)...linkIf(...)...linkElse()...
    NSNumber* aNumber = @(arc4random_uniform(100));//设置随机数
    //判断并打印随机数的奇偶性
    //if(aNumber.integerValue%2 == 0){
    //    NSLog(@"%@是奇数",aNumber);
    //}else{
    //    NSLog(@"%@是偶数",aNumber);
    //}
    //上方代码可写成如下形式
    aNumber.description
    .linkIf(aNumber.numIsOdd()).strAppend(@"是奇数").nslog()
    .linkElse.strAppend(@"是偶数").nslog();
    

    //////////////////////////////////////////////////////////////////////
    //【三】多链条语法
    //////////////////////////////////////////////////////////////////////
    //1.如果使用多个对象的链式编程，需要取值的时候请调用ends()获取多个结果
    //2.如果调用end只会取得第一个对象的链条返回值
    //3.使用endsAt()可以获取指定index对象的链条返回值
    //4.如果链条结尾返回的是“值类型”，那么该值是第一个对象的链条返回值
    //5.使用项目中的“方法”对多对象的链式编程不起作用
    //写法一
    UIView* viewA = UIViewNew.viewSetFrame(45,100,20,20);
    UIView* viewB = UIViewNew.viewSetFrame(120,100,20,20);
    
    linkObjs(viewA, viewB).viewAddToView(self.view).viewBGColor(@(0xdcdcdc).numToUIColorFromHex());
    //写法二
    NSMutableArray* arrA = [NSMutableArray arrayWithObjects:@"A", nil];
    NSMutableArray* arrB = [NSMutableArray arrayWithObjects:@"B", nil];
    NSMutableArray* arrC = [NSMutableArray arrayWithObjects:@"C", nil];
    NSArray* linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").linkEnds;
    //写法三
    linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").linkEnds;
    //写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了
    linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").linkEnds;
    
    //多个控件一个显示其他隐藏
    //linkObjs(viewA,viewB,...).viewHidden(YES).linkAt(selectedIndex).viewHidden(NO);
    
    //////////////////////////////////////////////////////////////////////
    //【四】快捷语法
    //////////////////////////////////////////////////////////////////////
    //对象随机赋值，并将对象作为字典打印
    [Person new].objValueRandom().po();

    //创建属性字典
    AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15])
    .makeAttrDictTextColor([UIColor blackColor]);
    
    //连续比较
    //objIsEqualToEach和objIsEqualToSomeone
    //if( [name isEqual:@"Jack"] || [name isEqual:@"Tom"] || ... )
    //=>
    //if( name.objIsEqualToEach(@"Jack" , @"Tom" , ...) )
    
    //... ...
}
@end
