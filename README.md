#LinkBlock
![LinkBlock icon](http://ico.ooopic.com/ajax/iconpng/?id=98399.png)

## What can do?
* 这是一个objc`链式编程`框架，为的是告别换行和[]，我会不断维护，不断更新最好的，让代码更快，更持久...西湖美景三月天嘞
* This is objective-c link block , to `chain programming`.
* One line code will tell you, how quik KF coding.

##Simple to use LinkBlock ;
```objc
LinkBlock.h
```

##Bye bye CGRectMake(xxxx);

```objc
btn.frame= CGRectMake(20, 20, 150, 80);
UIColor *color = [UIColor colorWithRed:255/255.0 green:22/255.0 blue:150/255.0 alpha:1.0];
btn.backgroundColor = color;
[btn setTitle:@"no can no bb" forState:UIControlStateNormal];
[self.view addSubview:btn];
```

##Now like this , just a.b.c...

```objc
UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];

btn.blockFrameSet(20,20,150,80).blockBGColor(@"0xff22cc".blockToColorFromHexStr())
.blockAddToView(self.view);

btn.blockTitleSet(@"no can no bb", UIControlStateNormal);

UILabel* lab = [UILabel new];
lab.blockText(@"2b || !2b").blockTextColor(@"ff2222".blockToColorFromHexStr());

lab.blockFrameSet(0,200,80,80).blockBGColor(@"#00ff00".blockToColorFromHexStr());

lab.blockNumberOfLines(0).blockAlignment(NSTextAlignmentCenter).blockAlignTop()
.blockAddToView(self.view);

//add block to object.
[lab blockBlockSet:@"Say" executeBlock:^id{
    @"My teacher is MJ.".blockNSLog();
    float r = arc4random_uniform(256)/255.0;
    float g = arc4random_uniform(256)/255.0;
    float b = arc4random_uniform(256)/255.0;
    UIColor* color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    return color;
}];


[btn blockAddTarget:self forControlEvents:UIControlEventTouchUpInside 
withBlock:^(UIControlEvents event) {
    if(event!=forControlEvents:UIControlEventTouchUpInside)
        return;
    UIColor* color = [lab blockBlockExecute:@"Say"];
    lab.blockTextColor(color);
}];


CGPoint point= @"{0,0}".blockToCGPoint();

BOOL b = @"123.3".blockIsFloating();

NSMutableArray* arr;
@[].blockMutableCopy().blockAddObjs(@[@"1",@"2",@"3"]).blockValueTo(&arr);//not arr=....
arr.blockNSLog();//not like NSLog(@"......");
```



##邮箱    *[emal>quxingyi@outlook.com](quxingyi@outlook.com)*
