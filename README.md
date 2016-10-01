#LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## Introduce【介绍】
* LinkBlock是objc`链式编程`语法糖扩展，使我们专注于编码的逻辑。
* 将同一个对象的多种操作整合，使代码结构清晰。
* 整合Fundation最基本功能。
* 持续维护。
* LinkBlock is objective-c Syntactic sugar , to `chain programming`.
* Integration of the various operations of the one object, so that the code structure is clear
* Frame encapsulation of native Foundation is the most basic and the most common functions...
* Continuously updated

##Manually【手动导入】
```objc
//1.Drag all source files under floder `LinkBlock` to your project.【将`LinkBlock`文件夹中的所有源代码拽入项目中】
//2.Import the main header file：`#import "LinkBlock.h"`【导入主头文件：`#import "LinkBlock.h"`】
//PS：Best not to use pch. to avoid the pollution of the entire project propertys tips.【提示：最好不要在pch文件中引用，避免污染整个项目的属性提示；查看注释在.h文件（command+左键@方法名 跳转两次）】

#import "LinkBlock.h"
```
##Basic grammar【基础语法】
```objc
//Does not get the value:【不需要取值的情况如：】
//Add a label to the view【添加一个标签到视图上】
UILabelNew
.labText(@"UILable").labNumberOfLines(0).labAlignment(NSTextAlignmentCenter)
.viewSetFrame(20,200,150,80)
.viewBGColor(@"#f0f0f0".strToUIColorFromHex())
.viewAddToView(self.view);

//Need to get value:【需要取值的情况：】
//Using linkObj() if first object can be nil.Use end to get the true value.【链首对象可能为空需要使用linkObj，报错则需要使用end获取真实的值】
NSString* priceStr = linkObj(priceFromNet).strAppend(@"￥").linkEnd;
//priceFromNet为空这里控制台会报错，而不是崩溃
```

##Conditional grammar【条件语法】
```objc
//...linkIf(...)...linkIf(...)...linkElse...

//判断并打印随机数的奇偶性
//NSNumber* aNumber = ...
if(aNumber.integerValue%2 == 0){
    NSLog(@"%@是奇数",aNumber);
}else{
    NSLog(@"%@是偶数",aNumber);
}
//The above code can be written in the following form【上方代码可写成如下形式】
aNumber.description
.linkIf(aNumber.numIsOdd()).strAppend(@"是奇数").nslog()
.linkElse.strAppend(@"是偶数").nslog();
```

##Multi Chain grammar【多链条语法】
```objc
//1.如果使用多个对象的链式编程，需要取值的时候请调用ends()获取多个结果
//2.如果调用end只会取得第一个对象的链条返回值
//3.使用endsAt()可以获取指定index对象的链条返回值
//4.如果链条结尾返回的是“值类型”，那么该值是第一个对象的链条返回值
//5.使用项目中的“方法”对多对象的链式编程不起作用

//1【写法一】
linkObjs(viewA, viewB).viewAddToView(self.view);

//2【写法二】
linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").linkEnds;

//3【写法三】
linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").linkEnds;

//4.Repeat the following code 100 times like papapa【写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了】
linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").linkEnds;

//Multiple controls one to display the other hidden【多个控件一个显示其他隐藏】
linkObjs(viewA,viewB,...).viewHidden(YES).linkAt(selectedIndex).viewHidden(NO);
```

##Shortcut syntax【快捷语法】
```objc
//Set random value to object, print the object as a dictionary 【对象随机赋值，并将对象作为字典打印】
[Person new].objValueRandom().po();

//Create NSAttrubuteDictionary【创建属性字典】
AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15])
.makeAttrDictTextColor([UIColor blackColor]);

//Continuous comparison【连续比较】
//objIsEqualToEach和objIsEqualToSomeone
//if( [name isEqual:@"Jack"] || [name isEqual:@"Tom"] || ... )
//=>
//if( name.objIsEqualToEach(@"Jack" , @"Tom" , ...) )

//... ...
```

##Mail address quxingyi@outlook.com
* 一朝做鸟程序员
