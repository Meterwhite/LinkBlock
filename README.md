#LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## What is this?
* 这是一个objc扩展集合`链式编程`，为了减少换行和中括号的干扰，让我们尽量专注于编码的逻辑。
* 提炼Fundation最基本功能和最常见功能。
* 持续维护。
* This is objective-c link block , to `chain programming`.
* Frame encapsulation of native Foundation is the most basic and the most common functions...
* Continuously updated

##Simple to use LinkBlock
```objc
//1.将整个文件夹拖入项目
//2.在使用的地方引用。提示：最好不要在pch文件中引用，避免污染整个项目的属性提示
//3.查看注释在.h文件（command+左键@方法名 跳转两次）
#import "LinkBlock.h"
```
##【新增】多个对象的链式编程
```objc
//写法一，多个对象并列
UIView* viewA = UIViewNew.viewSetFrame(45,100,20,20);
UIView* viewB = UIViewNew.viewSetFrame(120,100,20,20);
linkObjs(viewA, viewB).viewAddToView(self.view).viewBGColor([UIColor lightGrayColor]);
//写法二，数组对象
NSMutableArray* arrA = [NSMutableArray arrayWithObjects:@"A", nil];
NSMutableArray* arrB = [NSMutableArray arrayWithObjects:@"B", nil];
NSMutableArray* arrC = [NSMutableArray arrayWithObjects:@"C", nil];
NSArray* result = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"D").ends();
//写法三，逐个添加到链条中
NSArray* result = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").ends();
//写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环和int i了
NSArray* result = arrA.linkLoop(100).m_arrAddObj(@"F").ends();
//1.如果使用多个对象的链式编程，需要取值的时候请调用ends()获取多个结果
//2.对于多对象链式编程如果调用end()只会取得第一个对象的链条返回值
//3.使用endsAt(index)可以获取指定index对象的链条返回值
//4.如果链条结尾返回值是“值类型”，那么该值是第一个对象的链条返回值
//5.使用项目中的“方法”对多对象的链式编程不起作用
//...//...//...//...//...//...//...//...//...//...//...
```

##麻烦的CGRectMake()
```objc
//绘制UI常创建多个变量
UIButton* btn;
UIImageView* img;
CGRect rect1;
CGRect rect2;
[btn addSubview:img];
```
##使用链式的方式完成一件事情
```objc
//如果使用链式编程的方式，大部分工作可以在思路连续的情况下进行
UIButtonNew.viewSetFrame(20,20,150,80)
.viewBGColor(@"0xff22cc".strToColorFromHexStr())
.viewAddToView(self.view)
.btnTitle(@"Button", UIControlStateNormal);
```
##一些样例
```objc
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

//添加一个标签到视图上，并且文本顶部对齐，中间对齐
UILabelNew
.labText(@"中间对齐顶部对齐")
.viewSetFrame(20,200,150,80)
.labNumberOfLines(0).labAlignment(NSTextAlignmentCenter).labAlignTop()
.viewAddToView(self.view)
.viewBGColor(@"#f0f0f0".strToUIColorFromHexStr());

//字符串常量直接转颜色
@"0xff22cc".strToColorFromHexStr();

//正则表达式替换_xxx_为[xxx]
@"name=_boom_".strRegexReplace(@"(_)(\\w+)(_)" , @"[$2]").nslog();
//正则表达式验证是否为邮箱
@"abc@abc.com".strRegexIsMatch(@"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*
[a-z0-9]+.){1,63}[a-z0-9]+$") ? @"YES email".nslog() : @"NO email".nslog();


//数组过滤
NSArray* arrForFilter = @[ @{@"name":@"ali", @"age":@(123)} ,
                            @{@"name":@"bli", @"age":@(0)}   ,
                            @{@"name":@"cli", @"age":@(12)}  ,
                            @{@"name":@"dli", @"age":@(-45)}  ];

//过滤age<0的数据
arrForFilter.arrFilter(@"age<0").setTo(&arrForFilter);

//遍历age<100 并且 age>-1 的数据
[arrForFilter arrEnumerateWithPredicateFormat:@"age>-1 and age<100"
    usingBlock:^(NSObject* obj, NSUInteger idx, BOOL *stop) {
    //...
}];

//替换字典中的键
NSDictionary* dictToReplace = @{
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
dictToReplace.dictReplaceKey(@"description", @"DESCRIPTION").setTo(&dictToReplace);
```

##安全写法linkObj(obj)和end()
```objc
//起手写宏linkObj(obj)，确保对象为nil时不报错。若不使用则不能像享受nil调用方法时不报错的待遇。
//end()取值时过滤掉链接错误(LinkError)并返回nil或者正确的对象。
id value = linkObj(nil).end();
NSString *str2 = linkObj(str1).strAppend(str0).strAt(15).end();
```

##LinkError
* 由于objc是有弱类型语言特征的语言，block是作为了扩展的属性，才可以被'.'出来。当中间一个链条返回的对象是nil，或者非预期的类型，那么下一根链条就会断裂，报错。为了让链条能够在安全的情况下容错走通，那么引入一个新的单例的类型LinkError
。这个对象响应所有扩展属性的调用，功能仅仅返回自己到下一根链条以供传递。所以end()方法的使用对于获取链条末尾的返回值很关键。

##关于
* 目前xcode还没能给block有尚好的参数提示，所以使用起来还是略微不便，需要去头文件查看参数。提供者也将参数名赋予准确的意义。

##Mail address quxingyi@outlook.com
* 一朝做鸟程序员
