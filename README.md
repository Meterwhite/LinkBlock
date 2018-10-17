# LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## 【Introduction/介绍】
* LinkBlock是objc`链式编程`语法糖扩展，可以压缩大量不需要阅读的代码
* 低学习成本，因为它是Fundation API的搬运工
* 持续维护，向后兼容
* 作废API将保留半年
* Syntactic sugar of objc , it use block to reduce code that you don't need to read.
* Easy to use,it is the porter of the Fundation API
* Continuous maintenance, backward compatibility
* Deprecate API will remain for 0.5 year

## 【Import/导入】
* Drag directory `LinkBlock` into project
* `#import "LinkBlock.h"`
* Pod is suported.
```objc
#import "LinkBlock.h"
```


## 【Overview/概览】
### Examples/示例
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

[button setTitle:@"Text" forState:UIControlStateNormal];
==> button.btnTitleUIControlStateNormal(@"Text");

[self.view addSubview:viewA];
[self.view addSubview:viewB];
[self.view addSubview:viewC];
==> linkObjs(viewA,viewB,viewC).viewAddToView(self.view);

```

## 【A-B-C-D】
### A Foundation-mirror
- These blocks are copied from Foundation.
- Have the same parameters and return values.
```objc
...strAppend(~)...
...objValueForKey(value,key)...
```
### B Foundation-speed
- Some common parameters has been filled for you.
- It has some of the most basic functions.
```objc
...viewHiddenYES()...
...arrSort(~)...
```
### C Foundation-extend
- Provide some APIs that should have.
- It has some of the most basic functions.
```objc
...strLengthASCII()...
...imgOrientationFix(~)...
...viewAddToView(~)...
```
### D Weak-coding/弱类型编码
- These APIs make the object type no longer important, but only need to care about the function.
- Some APIs provide cross-type conversion capabilities.
```objc
...objAdd(~)...
...strToUIImage()...
```

## 【Call/调用】
### Linkblock will return self or what value method retuend.
```objc
_NonnullObject.linkBlock0().linkBlock1().linkBlock2()...

linkObj(_NullableObject).linkBlock0().linkBlock1().linkBlock2()...
```
### Use linkEnd when getting the return value.If not the result is unexpected.
```objc
id getTheValue = ...linkBlockReturnAValue().linkEnd;
```
## 【Name/命名】
### linkObject.<KindOfClass+Function[+Enum][+parameter][+others]>
```objc
_NonnullObject.btnTitleUIControlStateNormal()...
```
### Order of parameters/参数顺序
- Order of parameters are the same as Foundation or described by method name.

### Standard/写法规范
```objc
///Important content is in '<>';

_NonnullObject.linkBlock()...;

<linkObj(_NullableObject)>.linkBlock()...;

id getValue = ...linkBlockRerutnValue().<linkEnd>;
```
### Force type declaration/强制类型声明
- Rule:as+ClassName
```objc
NSString text = ...linkBlockRerutnUIView().asUILable.text;
[idObject asUILable].text;
```

### Link Indicate/链条指示
- When linkBlock object has changed,use this block to draw attention and it easy to read./指示,便于阅读
- Link Indicate will do noting, it just return self.
```objc
1.
...linkBlockReturnNotSelf().<thisValue>.someBlock()...;
Use `thisValue`,`thisValues`,`thisNumber` to indicate that linkBlock object has changed.
/指示链条对象变更

2.
linkObjs(...).thisLinkObjs...
Use `thisLinkObjs`,`thisLinkObj` to indicate state of link./指示链条状态

3.
...linkBlockRerutnANumber<As>().<aBOOLValue>...;
All linkBlock return NSNumber value it has suffix 'As'.
Use block named `a+TypeObject` to draw attention./指示NSNumber类型

4.
...linkBlockRerutn<AsWhatSet>(parameterToSet).whatSet...;
If linkBlock return value is parameters of itself ,it has suffix 'AsWhatSet'.
Use `whatSet` to indicate that next linkObj is the parameters of previous linkObj. 
/指示链条对象被切换到参数

Refer to `NSObject+LinkBlock.h`
```

## 【Link objects/多对象】
### Combine link objects into one,more efficient./超效率
```
linkObjs(viewA,viewB,...)...viewAddToView(self.view);

//Hide one view and show others.
linkObjs(viewA,viewB,...).viewHiddenYES().linkAt(selectedIndex).viewHiddenNO();
```
### Code of linkObjs
```objc

Create linkObjs
linkObjs(a,b,c...).thisLinkObjs...;//Main/主要

@[a,b,c...].makeLinkObjs.thisLinkObjs...;//Minor/次要

a.linkPush(b).linkPush(c).thisLinkObjs...;//Minor/次要

Get result
NSArray *getResultInArray = linkObjs...linkEnds;//主要
```
### Modify link obejcts
```
1.
...<linkPop()>.thisLinkObjs...
Remove last link object from linkObjs

2.
linkObjs...<linkAt(index)>.thisLinkObj...
Get linkObj from linkObjs and return it as next linkObj.

3.
...linkLoop(count,^(NSObject* link,NSUInteger idx){
    thisLinkObj.objAdd(~);
})...
Repeat execute the code using block.

*/
```

## 【Simple Conditional/简单条件】
```objc

...aNumberValue.linkIf...linkElse...;

...aNumberValue.linkIf_YES...LinkElse...;

///Force return/强制返回
id resultFromLinkBlock0 = ...linkIf_YES...linkReturn...LinkElse...linkEnd;
```

## 【Others/其他】
- 【调用项目外方法】
```objc
person.objPerformSelectorsWithArgs(~);
```

- 【LinkError】
```objc
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

## Author
- Contact me : quxingyi@outlook.com



-



-



-



## 【实验性的】
### 以脚本的方式执行LinkBlock
- Describe/描述
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
