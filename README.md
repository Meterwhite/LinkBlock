# LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## 【介绍】
* LinkBlock是objc`链式编程`语法糖扩展，目的压缩重复动作
* 有大量的代码都是不需要阅读的，使用Linkblock可以`整理废话`
* Fundation的搬运工
* 持续维护，向后兼容
* 作废API将保留半年

## 【导入】
- 【将`LinkBlock`文件夹中的所有源代码拽入项目中】
- 【导入主头文件：`#import "LinkBlock.h"`】
- 【提示：最好不要在pch文件中引用，避免污染整个项目的属性提示；在.h文件中查看注释；貌似最新的xcode智能提示有问题】
```objc
#import "LinkBlock.h"
//Or use pod
```


## 【概览】
### 【同一个对象的同一类动作的压缩】
- 【示例】
```objc

NSLog(@"%@",object); 
==> object.nslog();

view.frame = CGRectMake(1, 2, 3, 4);
==> view.viewSetFrame(1, 2, 3, 4);

[self.view addSubview:view];
==> view.viewAddToView(self.view);

CGSize screenSize = [UIScreen mainScreen].bounds.size;
CGRect frame = view.frame;
frame.size.width = screenSize.width;
view.frame = frame;
==> view.objSetScreenValueForFullPath(@"frame->size->width");

[button setTitle:@"Normal Text" forState:UIControlStateNormal];
==> button.btnTitleUIControlStateNormal(@"Normal Text");
```

### 【细节】
- 【调用】
```
任意对象像属性一样直接使用点语法
anyObject.linkBlock0();

如果对应的原生的Fundation方法没有返回值，在LinkBlock中会返回自身，所以可以连续书写
anyObject.linkBlock0().linkBlock1().linkBlock2();


如果对应的原生的Fundation方法有返回的对象
id obj = anyObject.linkBlockReturnObj().linkEnd;
/*
* linkEnd:
* 不使用linkEnd取值，则无法保证结果的类型正确，
* 因为中间可能发生错误，这之后一个错误对象会沿着链条传
* 递，linkEnd可以过滤改对象返回nil
*/

对应的原生的Fundation方法返回数值，直接获取即可
int value = anyObject.linkBlockReturnInt();
```

- 【命名】
```
使用前应该清楚原方法所属的类
规则：
anyObject.<originalClassName+functionName[+EnumName][+parameterName][+others]>
描述：
LinkBlock的命名由2大部分组成：类缩写名和方法名
UIButton+Title+UIControlStateNormal 对应 btnTitleUIControlStateNormal

入参顺序：
和原生Fundation一致，和方法名描述的一致
```
- 【写法规范】
```
_NonnullObject.linkBlock()...;

<linkObj(_NullableObject)>.linkBlock()...;

id getResultObj = ...linkBlockRerutnObj().<linkEnd>;

...linkBlockRerutnOtherObj().<thisValue>.someBlock()...;

...linkBlockRerutnANumber<As>().<aBOOLValue>...;

...linkBlockRerutn<AsWahtSet>(parameterToSet).whatSet.someBlock()...;

```

- 【错误】
```
由于LinkBlock主要是处理`废话`的，所以它是尽量不崩溃的
对于逻辑错误，例如：
anyObject.arrRemoveAt(errorIndex)...;
LinkBlock内部遇到简单的不合法的参数一般选择`不执行`而不是崩溃。

产生的错误：
LinkBlock在执行的时候可能产生三种错误
1.类型错误。2.内部错误。3.起始对象为nil
1、2的处理方式：
在控制台打印错误，明确在链条第几处
3的处理方式：
起始对象为nil报错的原因是把nil当做block调用：nil();
3是LinkBlock最常见的错误，如果我们不能保证起始对象为不为空都应该使用linkObj()
```

## 【多对象】
- 【多个对象操作的合并，更进一步的压缩】
```
linkObjs(viewA,viewB,...)...viewAddToView(self.view);

示例：多个控件一个显示其他隐藏
linkObjs(viewA,viewB,...).viewHiddenYES().linkAt(selectedIndex).viewHiddenNO();
```
- 【写法规范】
```objc

//联结
linkObjs(a,b,c...).linkBlock()...;//主要

@[a,b,c...].makeLinkObjs.linkBlock()...;//次要

a.linkAnd(b).linkAnd(c)...linkBlock()...;//次要


//取值
NSArray *getResultInArray = linkObjs...linkEnds;//主要

id getFirstResult = linkObjs...linkEnd;//次要

int getFirstResultInt = linkObjs...linkBlockReturnInt();//次要

```

- 【操作多对象的链条】
```
链条索引以0为开始计：
//移除一根
...linkOut(index)...

//取出一根
...linkAt(index)...

//第一根
...linkFirstObj...

//最后一根
...linkLastObj...


//取某一根链条的返回值
id getFirstResult = linkObjs...linkEndsAt(index);

//简单重复执行之后的
 ...linkLoop(count)...
/*注意不要在后面创建对象：
...linkLoop(count).arrAddObj([NSObject new])...
这里添加的只是同一个对象并没有多次创建新对象
复杂的重复执行由方法[object linkLoopIn:block:]完成
*/
```

## 【简单条件】
- 【线性折叠简单的判断逻辑】
```objc

//判断
...linkIf...codeA...linkElse...codeB...;

//两择
...<@YES/@NO>.linkIf_YES...codeA...LinkElse...codeB...;
...<@YES/@NO>.linkIf_NO...codeA...LinkElse...codeB...;

//强返
id resultFromLinkBlock0 = ...linkBlock0().linkReturn...linkEnd;
```

## 【其他】
- 【强制类型声明】
```
一般用于父与子类型声明的还原
规则：as+<ClassName>
UITableView *table = ...asUITableView;
```
- 【弱类型】
```objc
...objAdd(<View>|<String>|<Array>|<Collection>)...

...objInsert...

...objRemoveAll...

...objRemoveFrom...

...objIsBlank...

一般的arrAddObj 等同于 m_arrAddObj，另外不可变对象会默认的被转换为可变
```



- 【调用其它对象的方法组】
```objc
person.objPerformSelectorsWithArgs(
                     @selector(answerQuestion:),@[@"how big"],
                     @selector(answerQuestion:question2:),@[@"how long",[NSNull null],@"what color"],
                     @selector(answerQuestion:question2:question3:),@[],
                     @selector(viewDidLoad),@[]//此处会在控制台打印未能找到方法的错误
                     );
```
-  【测试】
```objc
//清除模型值
...objValuesClean()...
//模型随机值
...objValuesRandom()...
//模型随机字符串
...objSetRandomStringForKey(...)...
//模型随机数字
...objSetRandomNumberForKey(...)...
//打印对象的字典
...po()...

//简单重复执行
...linkLoop(count)...
//复杂重复执行
[linkLoopIn:count block:^(NSObject* link, NSUInteger index){
    link...
}]...
```

- 【创建字符串属性字典】
```objc
AttrDictNew.makeAttrDictFont...makeAttrDictTextColor...
```

- 【连续比较】
```objc
...objIsEqualToEach(...)...
...objIsEqualToSomeone(...)...
```

- 更多参见API
```objc
//... ...
```

## 其他
- Mail:quxingyi@outlook.com

## 【实验性的】
### 【以字符串的方式执行LinkBlock代码】
- Describe【描述】
```objc
//动态脚本(DynamicLink)解析的4种使用方式
//1
@"代码".linkCodeEval(目标对象 , 参数列表);
//2
目标对象.linkEvalCode(@"代码" , 参数列表);
//3 执行一段脚本
EvalLinkBlock(@"代码");
//4 使用目标对象执行一段脚本
EvalLinkBlockWithTarget(目标对象 , @"代码");

/*
*DynamicLink概览:
*@"代码".linkCodeEval(目标对象,参数列表....);
*
*
*命令：
*DynamicLink脚本使用linkBlock的原生调用方式，还支持属性样式的调用
*1.当调用名称后跟随"()"时："actionName().actionName()..."，系统会把actionName当成linkBlock去调用
*2.如果调用中没有"()"，"actionName.actionName..."会被系统解释为属性样式的调用；将调用当成对象的属性、对象的无参方法、类名、或者LinkBlock命令
*其中LinkBlock命令目前包括:1.创建对象命令："ClassName+New";2.LinkBlock宏定义:"NSNil","AttrDictNew"
*
*注意！动态链条并不支持不定参数的block调用，使用中会报出警告。系统认为所有不定参数的block的参数个数为1个，这会造成潜在的分歧。
*
*
*字面参数：
*字面参数是在DynamicLink中通过字面创建的值，它写在"()"内；形如："ActionName(3.1415926)"
*支持类型：数字，十六进制的数字，字符串，布尔值，c字符串，字符，NSNumber，SEL，struct in NSValue，Class；参考:DynamicLinkArgument.h
*字面量参数暂时不能是可以接受参数的linkBlock调用
*字符串中不能再有双引号
*
*
*入参顺序：
*参数的入参顺序和脚本中调用的入参顺序完全一一对应；
*传参目前只能给在第一层的调用传参，下层调用只能通过字面量传参
*如果脚本中存在一个字面参数则参数列表中不再需要传递这个参数；
*如果要通过参数列表传递nil，可以使用NSNil。或者在脚本中使用字面量"nil","NULL"
*
*/
```
