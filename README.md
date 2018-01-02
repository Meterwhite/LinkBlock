# LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## Introduce【介绍】
* LinkBlock是objc`链式编程`语法糖扩展，便于折叠冗余逻辑。
* 整合Fundation最基本功能。
* 持续维护，向后兼容。
* LinkBlock is objective-c Syntactic sugar , to `chain programming`.
* Frame encapsulation of native Foundation is the most basic and the most common functions...
* Continuously updated.Backward compatibility.

## Manually【手动导入】
- Drag all source files under floder `LinkBlock` to your project.【将`LinkBlock`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "LinkBlock.h"`【导入主头文件：`#import "LinkBlock.h"`】
- PS：Best not to use pch. to avoid the pollution of the entire project propertys tips.【提示：最好不要在pch文件中引用，避免污染整个项目的属性提示；在.h文件中查看注释；】
```objc
#import "LinkBlock.h"
```

## New!【新增！】
### DynamicLink - Call linkBlock using scriptDynamicLink-使用脚本的形式执行linkBlock】
- Add a label to view【添加一个标签到视图上】

## Basic grammar【基础语法】
### Does not get value:【不需要取值的情况如：】
- Add a label to view【添加一个标签到视图上】
```objc
UILabelNew
.labText(@"UILable").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter)
.viewSetFrame(20,200,150,80)
.viewBGColor(@"#CCCCCC".strToUIColorFromHex())
.viewAddToView(self.view);
```
### Need to get value:【需要取值的情况：】
- Using linkObj() if first object can be nil.Use linkEnd to get the safe value.【链首对象可能为空需要使用linkObj，使用linkEnd可以将链条中间可能的报错转为nil】
```objc
NSString* priceStr = linkObj(priceFromNet).strAppend(@"￥").linkEnd;
//priceFromNet为空这里控制台会报错，而不是崩溃
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
* 如果链条结尾返回的是“值类型”，那么该值是第一个对象的链条返回值
```objc
//1【写法一】
linkObjs(viewA, viewB).viewAddToView(self.view);

//2【写法二】
linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").linkEnds;

//3【写法三】
linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").linkEnds;

//4.Repeat the following code 100 times【写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了】
linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").linkEnds;

//Multiple controls one to display the other hidden【多个控件一个显示其他隐藏】
linkObjs(viewA,viewB,...).viewHidden(YES).linkAt(selectedIndex).viewHidden(NO);
```
## New! Call in other object【新增! 与项目外交互的方式】
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

