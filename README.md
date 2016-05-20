#LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## What is this?
* 这是一个objc扩展集合`链式编程`，为了减少换行和中括号的干扰，让我们可以专注于编码的逻辑。
* 提炼Fundation最基本功能和最常见功能。
* 持续维护。
* This is objective-c link block , to `chain programming`.
* Frame encapsulation of native Foundation is the most basic and the most common functions...
* Continuously updated
##Simple to use LinkBlock ;
```objc
LinkBlock.h
```

##CGRectMake()不友好
```objc
//Such written before 
//手绘UI常要创建4，5个变量
UIButtonNew
.viewAddToView(self.view)
.btnTitle(@"Button", UIControlStateNormal)
.btnTitleColor([UIColor lightGrayColor],UIControlStateNormal)
.viewBGColor(@"f0f0f0".strToUIColorFromHexStr())
.frame= @"{{20,20},{150,80}}".strToCGRect();
```
##使用链式的方式完成一件事情
```objc
//如果使用链式编程的方式，大部分工作可以在思路连续的情况下进行
//now just using one line.Most work can be wrapped up in the idea of ​​ongoing cases
btn.viewSetFrame(20,20,150,80)
.viewBGColor(@"0xff22cc".strToColorFromHexStr())
.viewAddToView(self.view)
.btnTitle(@"click change color", UIControlStateNormal);
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
@"NOVO@outlook.com".strRegexIsMatch(@"^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*
[a-z0-9]+.){1,63}[a-z0-9]+$") ? @"YES email".nslog() : @"NO email".nslog();


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
```
##对字典的操作
```objc
//替换字典中的键
NSDictionary* 需要替换的字典 = @{
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
需要替换的字典 = 需要替换的字典.dictReplaceKey(@"description", @"DESCRIPTION");
NSLog(@"%@",需要替换的字典);

```

##SQL拼接的易读和易查错
```objc
//高效阅读的sql编码方式，易查错，易修改
BOOL sex = NO;
NSString* sql0 =
[[[SQLNew SQLSelect:^(NSMutableString *makeSQL) {

    [makeSQL SQLIf:sex==0 using:^(NSMutableString *makeSQL) {

        makeSQL.SQLStr(@"*");
    } elseUsing:^(NSMutableString *makeSQL) {

        makeSQL.SQLArr(@[@"id",@"name",@"age",@"sex",@"nickName",@"address",@"point"]);
    }];
}] SQLFrom:^(NSMutableString *makeSQL) {

    makeSQL.SQLArr(@[@"Student" , @"Teacher", @"Foods"]);
}] SQLWhere:^(NSMutableString *makeSQL) {
    
    makeSQL.SQLStr( @"id =").SQLIntInStr(1000);
}];
NSLog(@"%@", sql0);

NSString* sql1 = 
[[SQLNew SQLCreate:^(NSMutableString *makeSQL) {

    makeSQL.SQLStr(@"table if not exists");
}].SQLStr(@"Person") SQLValues:^(NSMutableString *makeSQL) {

    makeSQL.SQLStr(@"id integer primary key").SQL_Comma();
    makeSQL.SQLStr(@"name text").SQL_Comma();
    makeSQL.SQLStr(@"sex integer").SQL_Comma();
    makeSQL.SQLStr(@"address text");
}];
NSLog(@"%@", sql1);
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
```

##Mail address  *[quxingyi@outlook.com]*
##希望大家都支持链式编程这种编程方式
* 一朝做鸟程序员
