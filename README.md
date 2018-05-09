# LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## Introduce【介绍】
* LinkBlock是objc`链式编程`语法糖扩展，逻辑简明，结构清晰
* 整理Fundation常用功能
* 持续维护，向后兼容
* LinkBlock is objective-c Syntactic sugar , to `chain programming`
* Organize Fundation functions.
* Continuously updated.Backward compatibility

## Manually【导入】
- Drag all source files under floder `LinkBlock` to your project.【将`LinkBlock`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "LinkBlock.h"`【导入主头文件：`#import "LinkBlock.h"`】
- PS：Best not to use pch. to avoid the pollution of the entire project propertys tips.【提示：最好不要在pch文件中引用，避免污染整个项目的属性提示；在.h文件中查看注释；】
```objc
#import "LinkBlock.h"
//or use pod
```

## New!【新增！】
### DynamicLink - Execute the LinkBlock code in a NSString-【以字符串的方式执行LinkBlock代码】
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
## Basic【基础】
### Centralizes multiple calls to the same object.【将同一个对象的多个调用集中】
- Below is an example of adding a tag to the view.【下方是添加一个标签到视图上的示例】
```objc
UILabelNew
.labText(@"文本")
.viewSetFrame(20,200,150,80)
.viewBGColor(@"#CCCCCC".strToUIColorFromHex())
.viewAddToView(self.view);
```
### Execute the code and get the results.【执行代码并且获取结果】
- Use linkObj to prevent the first object from being nil. Using linkEnd to get the call result, which is standard practice, if the chain goes wrong it converts it to nil instead of an ErrorObject.【使用linkObj防止第一个对象是nil的情况。使用linkEnd获取调用结果，这是标准的做法，如果链条出错它会将其转化为nil而不是一个ErrorObject】
```objc
//Take the operation of a splicing string.
//我们以进行一次拼接字符串的操作为例

//1.crash happend
//1.崩溃发生
NSString* priceStr = aStringIsNil.strAppend(@"￥");

//2.return a LinkError object
//2.返回一个LinkError错误对象
NSString* priceStr = linkObj(aUIViewObject).strAppend(@"￥");

//3.Standard practice,we get nil and the console will report the errors.
//3.这是标准的做法；这里返回nil并且控制台打印出现的问题；
NSString* priceStr = linkObj(aStringIsNil).strAppend(@"￥").linkEnd;
```

## Conditional grammar【条件语法】
### ...linkIf(...)...linkIf(...)...linkElse...
- 判断并打印随机数的奇偶性
```objc
//
//NSNumber* aNumber = ...
if(aNumber.integerValue%2 == 0){
    NSLog(@"%@是奇数",aNumber);
}else{
    NSLog(@"%@是偶数",aNumber);
}
```
- The above code can be written in the following form【上方代码可写成如下形式】
```objc
aNumber.description
.linkIf(aNumber.numIsOdd()).strAppend(@"是奇数").nslog()
.linkElse.strAppend(@"是偶数").nslog();
```

## Multi Chain grammar【多链条语法】
* 多链条需要取值的时候使用linkEnds()获取多个结果,如果使用linkEnd只会取得第一个对象的链条返回值
* 如果链条结尾返回的是“值类型”，那么该值是第一个链条的返回值
```objc
//1【写法一】
linkObjs(viewA, viewB).viewAddToView(self.view);
//同时移除数组和视图的子项
linkObjs(view.subviews, self.imageViewArray).objRemoveAll();

//2【写法二】
linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").linkEnds;

//3【写法三】
linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").linkEnds;

//4.Repeat the following code 100 times【写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了】
linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").linkEnds;

//Multiple controls one to display the other hidden【多个控件一个显示其他隐藏】
linkObjs(viewA,viewB,...).viewHiddenYES().linkAt(selectedIndex).viewHiddenNO();
```
## New! Call in other object【与项目外交互的方式】
- Set delegate and use kvc 【设置代理和使用KVC等】
```objc
person.objSetValueForKey_delegate(self).objSetValueForKey(@"Jack",@"name");
```
- call functions 【调用其它对象的方法组】
```objc
person.objPerformSelectorsWithArgs(
                     @selector(answerQuestion:),@[@"how big"],
                     @selector(answerQuestion:question2:),@[@"how long",[NSNull null],@"what color"],
                     @selector(answerQuestion:question2:question3:),@[],
                     @selector(viewDidLoad),@[]//此处会在控制台打印未能找到方法的错误
                     );
```

## Shortcut syntax【快捷语法】
- Set random value to object, print the object as a dictionary 【对象清空属性再随机赋值，并将对象作为字典打印】
```objc
person.objValuesClean().objValuesRandom().po();
```

- Create NSAttrubuteDictionary【创建属性字典】
```objc
AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15])
.makeAttrDictTextColor([UIColor blackColor]);
```

- Continuous comparison【连续比较】
```objc
//objIsEqualToEach和objIsEqualToSomeone
//if( [name isEqual:@"Jack"] || [name isEqual:@"Tom"] || ... )
//=>
//if( name.objIsEqualToEach(@"Jack" , @"Tom" , ...) )
```

- 更多参见API
```objc
//... ...
```

## 其他
- 目前项目内的功能性方法不支持传递链条对象
- Mail:quxingyi@outlook.com

