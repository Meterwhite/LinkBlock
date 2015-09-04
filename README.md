#LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## What is this?
* 这是一个objc扩展集合`链式编程`，为的是告别换行和[]，用最简短的一句话尽可能多的完成功能。
* 框架封装原生Fundation最基本功能和最常见功能。
* 持续更新
* This is objective-c link block , to `chain programming`.
* Frame encapsulation of native Foundation is the most basic and the most common functions.
* Continuously updated
##Simple to use LinkBlock ;
```objc
LinkBlock.h
```

##Shit CGRectMake()
```objc
//Such written before 
//手绘UI动不动就要创建4，5个变量，而这明明是可以省略的步骤
UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
btn.frame= CGRectMake(20, 20, 150, 80);
UIColor *color = [UIColor colorWithRed:255/255.0 green:22/255.0 blue:150/255.0 alpha:1.0];
btn.backgroundColor = color;
[btn setTitle:@"click change color" forState:UIControlStateNormal];
[self.view addSubview:btn];
```
##Bye CGRectMake(),just a.b.c...
```objc
//如果使用链式编程的方式，大部分工作可以在思路不断的情况下一气呵成
//now just using one line.Most work can be wrapped up in the idea of ​​ongoing cases
btn.viewSetFrame(20,20,150,80).viewBGColor(@"0xff22cc".strToColorFromHexStr())
.viewAddToView(self.view).btnTitle(@"click change color", UIControlStateNormal);
```
##Example
```objc
//去空格和换行，并打印
@" 吴 倩 莲 的 风 和 欲 啊 \r\n 唱 了 多 少 萌 ".strClearSpaceAndWrap().nslog();
//字符串比较大小
@"123".strCompare(@"111");
//对数字敏感的字符串比较
@"abc1.txt".strCompareNumberSensitive(@"abc2.txt");


//添加一个按钮到视图上
UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
btn.viewSetFrame(20,20,150,80).viewAddToView(self.view).btnTitle(@"click change color", UIControlStateNormal);

//安全使用KVC
btn.setValueForKeySafe(@"0xff22cc".strToColorFromHexStr() , @"backgroundColor");

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
     UIColor* color = [lab objBlockExecute:@"Say"];//执行设置的block代码段
     lab.labTextColor(color);
     lab.viewAnimateShakeHorizental(0.5);  // animation
     btn.viewAnimateFlipFromTop(0.5,1,YES);// animation
}];


//字符串常量直接转颜色
@"0xff22cc".strToColorFromHexStr();
@"#ff22cc".strToColorFromHexStr();
@"ff22cc".strToColorFromHexStr();


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
```
##NSDictionary get value safely
```objc
dict.dictGetNoNSNull(@"key");
dict.dictGetBOOLNoNullType(@"key");
dict.dictGetArrNoNullType(@"key");
dict.dictGetViewNoNullType(@"key");
```
##Do animation quickly
```objc
view.viewAnimateShakeHorizental(0.5);
btn.viewAnimateRemove();
btn.viewAnimateFlipFromTop(0.5,1,YES);
... ...
```
##end()
```objc
//如果你想在链条结尾获取绝对真实的对象值(继承NSObject)你需要在最后使用end()
//因为你可能得到的是LinkError对象
//If you want get real type of vale.you should using 'end()' at chain end.
//Because you may get LinkError
NSString *str2 = str1.strAppend(str0).strAt(15).end();
```

##What is LinkError
* 由于objc是有弱类型语言特征的语言，block是作为了扩展的属性，才可以被'.'出来。当中间一个链条返回的对象是nil，或者非预期的类型，那么下一根链条就会断裂，报错。为了让链条能够在安全的情况下容错走通，那么引入一个新的单例的类型LinkError
。这个对象响应所有扩展属性的调用，功能仅仅返回自己到下一根链条以供传递。所以end()方法的使用对于获取链条末尾的返回值至关重要。
* LinkError can respond to all extension property,it just return self to next chain.And not break,not throw an exception.

##Bug-mail address，join us address  *[quxingyi@outlook.com](quxingyi@outlook.com)*
##希望大家都支持链式编程这种编程方式
* 做天朝良好的程序员