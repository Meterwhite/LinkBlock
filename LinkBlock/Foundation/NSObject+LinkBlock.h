//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"
#import "LinkInfo.h"
#import "LinkGroup.h"
#import "LinkError.h"
#import "LinkReturn.h"
#import "Others+LinkBlock.h"

@interface NSObject(LinkBlock)
#pragma mark - links
/** 
 <- linkEnd>获取链条返回值，并将错误转nil
 ... = linkObj(..)...linkEnd;
 ... = linkObj(..)...linkIf(...)...linkEnd;
 */
LBDeclare_F id              linkEnd;
/**
 <- linkEnds>多对象链式编程获取多个链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...linkEnds;
 */
LBDeclare_F NSArray*        linkEnds;
/** 
 <^(NSUInteger idx)>多对象链式编程获取某一链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...linkEndsAt(index);
 */
LBDeclare id                (^linkEndsAt)(NSUInteger idx);
/** 
 <^(id obj)>使新对象加入链条
 ...linkAnd(obj1)...linkAnd(obj2)...
 ... = ...linkAnd(obj1)...linkAnd(obj2)...linkEnds;
 */
LBDeclare NSObject*         (^linkAnd)(id obj);
/**
 <^(id obj)>以新对象执行其后链条，可以与linkIf，linkElse配合
 linkObjs...linkTo(aNewObj)...
 ...linkIf(...)...linkTo(aNewObj)...linkElse...
 */
LBDeclare NSObject*         (^linkTo)(id obj);
/** 
 <^(NSUInteger idx)>使多对象链条中移除一个
 linkObjs...linkOut(index)...
 */
LBDeclare NSObject*         (^linkOut)(NSUInteger idx);
/** 
 <^(NSUInteger idx)>取出多对象链条中一个对象作为当前链条对象
 linkObjs...linkAt(index)...
 */
LBDeclare NSObject*         (^linkAt)(NSUInteger idx);
/**
 <^()>取出多对象链条中第一个
 linkObjs...linkFirstObj...
 */
LBDeclare_F NSObject*       linkFirstObj;
/**
 <^()>取出多对象链条中最后一个
 linkObjs...linkLastObj...
 */
LBDeclare_F NSObject*       linkLastObj;
/** 
 <^(NSUInteger count)>使其后的链条复制指定次数的重复执行效果。所以...linkLoop(...)...m_arrAddObj([NSObject new])...添加的是同一个对象。这里添加不同对象应使用方法linkLoopIn:block:。
 ...linkLoop(count)...
 */
LBDeclare NSObject*         (^linkLoop)(NSUInteger count);
/** 
 <^()>根据条件是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行；取值需使用linkEnd
 ...linkIf(...)...linkIf(...)...linkElse...
 ... = ...linkLoop(...)...linkIf(...)...linkEnds();
 */
LBDeclare NSObject*         (^linkIf)(BOOL condition);
/** 
 <^()>从中断语句中恢复执行其后语句，与前一个linkIf配合使用；取值需使用linkEnd
 ...linkIf(...)...linkIf(...)...linkElse...
 */
LBDeclare_F NSObject*       linkElse;
/**
 <^()>使其后语句跳空至末尾（优先级高于其他条件）；可与分支配合；取值需使用linkEnd
 ...[linkInBlock:^(NSObject* fromObj){
    if(...){
        ...linkReturn;
    }
 }]...linkEnd;
 */
LBDeclare_F NSObject*       linkReturn;
/** 
 链条分支，返回源对象，在链条内处理新分支
 ...[linkInBlock:^(NSObject* link){
    link...
 }]...
 */
- (NSObject*)linkInBlock:(void(^)(NSObject* link))block;

/**
 异步在主队列中执行block
 */
- (NSObject*)linkAsy_main_queue:(void(^)(NSObject* link))block;

/**
 异步在全局队列中执行block
 */
- (NSObject*)linkAsy_global_queue:(void(^)(NSObject* link))block;

/**
 执行指定次数block
 */
- (NSObject*)linkLoopIn:(NSUInteger)count block:(void(^)(NSObject* link, NSUInteger index))block;

/**
 在主队列中延迟执行block
 */
- (NSObject*)linkAfterIn:(double)time block:(void(^)(NSObject* link))block;


/**
 该方法不会像linkFirstObj，linkLastObj，linkAt一样中断多对象链条

 @param from 设置多对象链条中的对象起始索引
 @param to 设置多对象链条中的结束对象的索引
 @param block code...
 @return 原对象
 */
- (NSObject*)linkFrom:(NSUInteger)fromIdx
                   to:(NSUInteger)toIdx
                block:(void(^)(NSUInteger idx , NSObject* obj))block;


/**
 该方法不会像linkFirstObj，linkLastObj，linkAt一样中断多对象链条

 @param idx 对象索引
 @param block code...
 @return 原对象
 */
- (NSObject*)linkAt:(NSUInteger)idx block:(void(^)(NSObject* obj))block;


#pragma mark - Foundation Mirror
LBDeclare NSObject*    (^objCopy)(void);
LBDeclare NSObject*    (^objMutableCopy)(void);
/** NSLog(@"%@",self); */
LBDeclare NSObject*    (^nslog)(void);
LBDeclare BOOL         (^objIsEqual)(id obj);
LBDeclare NSNumber*    (^objIsEqualAs)(id obj);
LBDeclare NSString*    (^objClassName)(void);
LBDeclare NSString*    (^objSuperclassName)(void);

LBDeclare BOOL         (^objIsRespondsSEL)(SEL sel);
LBDeclare NSNumber*    (^objIsRespondsSELAs)(SEL sel);
LBDeclare BOOL         (^objIsKindOf)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsKindOfAs)( __unsafe_unretained Class clazz);
LBDeclare BOOL         (^objIsSubClassOf)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsSubClassOfAs)( __unsafe_unretained Class clazz);
LBDeclare BOOL         (^objIsMemberOfClass)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsMemberOfClassAs)( __unsafe_unretained Class clazz);

/** result nil==>NSNull , NSNull.linkEnd == nil */
LBDeclare NSObject*    (^objValueForKey)(NSString* key);
/** result nil==>NSNull , NSNull.linkEnd == nil */
LBDeclare NSObject*    (^objValueForKeyPath)(NSString* key);
LBDeclare NSObject*    (^objSetValueForKey)(id value,NSString* key);
LBDeclare NSObject*    (^objSetValueForKeyPath)(id value,NSString* key);
LBDeclare NSObject*    (^objSetValuesWithKeyValues)(NSDictionary<NSString *,id> * keyValues);
LBDeclare NSDictionary*(^objKeyValueWithKeys)(NSArray<NSString*>*keys);
LBDeclare NSObject*    (^objPerformSelector)(SEL sel);

#pragma mark - Foundation Fast
/** 是否是block对象 */
LBDeclare BOOL         (^objIsKindOfNSBlock)(void);
LBDeclare NSNumber*    (^objIsKindOfNSStringAs)(void);
LBDeclare NSNumber*    (^objIsKindOfNSArrayAs)(void);
LBDeclare NSNumber*    (^objIsKindOfNSDictionaryAs)(void);
LBDeclare NSNumber*    (^objIsKindOfUIViewAs)(void);
LBDeclare NSNumber*    (^objIsKindOfNSValueAs)(void);
LBDeclare NSNumber*    (^objIsKindOfNSNumberAs)(void);
LBDeclare NSObject*    (^objSetValueForKdelegate)(id value);
LBDeclare NSObject*    (^objSetValueForKdataSource)(id value);
LBDeclare NSObject*    (^objSetValueForKtext)(id value);
/** 打印对象引用计数器 */
LBDeclare_F NSObject*  logRetainCount;
/** <^()>获取对象的引用计数器 */
LBDeclare_F CFIndex    objRetainCount;


#pragma mark - Foundation Extent
/** 是否是可变类型*/
LBDeclare BOOL         (^objIsMutable)(void);
LBDeclare NSNumber*    (^objIsMutableAs)(void);
/** 可变拷贝并且操作到子项 */
LBDeclare NSObject*    (^objMutableCopyEnumerate)(void);
/** <^()> 不可变对象转为可变对象，否则不会发生任何事 */
LBDeclare NSObject*    (^objNeedMutable)(void);
/** <^(NSString* key)>输出对象Key对应的值 */
LBDeclare NSObject*    (^nslogValueForKey)(NSString* key);
/** <^(NSString* key)> */
LBDeclare NSObject*    (^nslogValueForKeyPath)(NSString* key);
/** asKey∈{NSString,NSArray} */
LBDeclare NSObject*    (^objSetNilForKey)(id asKey);
/** asKey∈{NSString,NSArray} */
LBDeclare NSObject*    (^objSetRandomStringForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray} */
LBDeclare NSObject*    (^objSetRandomStringzh_CNForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray}随机数字字符串，不会以'0'作为开始 */
LBDeclare NSObject*    (^objSetRandomStringNumberForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray} set integer value */
LBDeclare NSObject*    (^objSetRandomNumberForKey)(id asKey, uint32_t max);
/** asKey∈{NSString,NSArray} set double value */
LBDeclare NSObject*    (^objSetRandomDoubleForKey)(id asKey, uint32_t max, NSUInteger len);
/**
 *  asKey∈{NSString,NSArray} set NSDate
 *  days∈{NSNumber,NSArray<NSNumber>}
 *  days == @(-30) or @[@(-30)]random in the past 30 days；Otherwise opposite
 *  days == @[@(-30) , @(30)]，random in the past 30 days or next 30 days
 *  days == nil or @0，random in the past 24 hours
 */
LBDeclare NSObject*    (^objSetRandomDateForKey)(id asKey,id days);
/**
 *  <^(NSString* key)>
 *  bool取反: bool type=<YES/NO>,NSNumber 同理<@YES/@NO>,
 *  相反数: number type = <1/-1> .NSNumber 同理,<@(1),@(-1)>
 *  字符串逆序: <@"abc"/@"cba">
 *  width和height的交换: CGRect和CGSize
 *  CGPoint,CGVector,UIOffset 交换值
 *  UIEdgeInsets,NSDirectionalEdgeInsets 交换上下值,交换左右值
 *  特别的：属性类型是c的直接量属性时,无法区分这三种类型<bool,char,xyShort>,此处按bool对待
 */
LBDeclare NSObject*    (^objReverseValueForKey)(NSString* key);
/** 字符串类型和数字类型随机赋较短的值，排除readonly和无'_成员变量'的属性 */
/** <^()> 清空所有可访问的属性的值为默认值，排除readonly和无'_成员变量'的属性 */
LBDeclare NSObject*    (^objSetAllValuesBlank)(void);

LBDeclare NSObject*    (^objPerformSelectors)(SEL sel0,...);
LBDeclare NSObject*    (^objPerformSelectorArgument)(SEL sel,id arg);
LBDeclare NSObject*    (^objPerformsSelectorArguments)(SEL sel0,NSArray* args0,...);
/**
 *返回调用结果的形式
 *调用void返回方法时返回结果为NSNull,所有nil的返回值也都装箱为NSNull；
 **/
LBDeclare NSObject*    (^objPerformSelectorAsWhatReturn)(SEL sel);
LBDeclare NSArray*     (^objPerformSelectorsAsWhatReturns)(SEL sel0,...);
LBDeclare NSObject*    (^objPerformSelectorArgumentAsWhatReturn)(SEL sel,id arg);
LBDeclare NSArray*     (^objPerformsSelectorArgumentsAsWhatReturns)(SEL sel0,NSArray*args0,...);



#pragma mark - weaken strong type/类型弱化
/** for NSJSONSerialization */
LBDeclare NSString*    (^objToJsonString)(void);
/** retrun value can be used to NSJSONSerialization  */
LBDeclare NSObject*    (^objToNSJsonObject)();
LBDeclare NSObject*    (^objToNSJsonObjectDepth)();
LBDeclare NSObject*    (^objToNSJsonObjectFoundation)();
LBDeclare NSObject*    (^objToNSJsonObjectDepthAndFoundation)();
/** self is not a collection object  */
LBDeclare NSDictionary*(^objToNSDictionary)();
LBDeclare NSDictionary*(^objToNSDictionaryWithKeys)(NSArray* asKey);
/** <^()> <JSValue & NSString> to nsnumber */
LBDeclare NSNumber*    (^objToNSNumber)(void);
/** 集合中的前一个元素 objs∈{NSArray,NSOrderedSet} */
LBDeclare NSObject*    (^objGetPrevItemFromObjs)(id objs);
/** 集合中的后一个元素 */
LBDeclare NSObject*    (^objGetNextItemFromObjs)(id objs);
/** 判断子项;obs∈{UIView,CALayer,UIViewController,NSIndexSet,.objectEnumerator} */
LBDeclare NSNumber*    (^objIsSubitemOfObjAs)(id obj);
/** 判断集合子项;objs∈{.objectEnumerator,NSIndexSet} */
LBDeclare BOOL         (^objIsSubitemOfObjs)(id objs);
LBDeclare NSNumber*    (^objIsSubitemOfObjsAs)(id objs);
/** 判断集合子项;objs∈{.keyEnumerator} */
LBDeclare BOOL         (^objIsKeyOfObjs)(id objs);
LBDeclare NSNumber*    (^objIsKeyOfObjsAs)(id objs);
/** 判断是否是数字类型或数字的字符串 */
LBDeclare NSNumber*    (^objIsNumberAs)(void);
/** 判断集合类型∈{<NSFastEnumeration>,NSIndexSet,NSIndexPath} */
LBDeclare NSNumber*    (^objIsCollectionAs)(void);
/** <^(id obj)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAdd)(id obj);
/** <^(id obj)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAddTo)(id obj);
/** objAddTo调用后，将链条切换到参数 */
LBDeclare NSObject*    (^objAddToAsWhatSet)(id obj);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsert)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsertTo)(id obj , NSUInteger idx);
/** objInsertTo调用后，将链条切换到参数 */
LBDeclare NSObject*    (^objInsertToAsWhatSet)(id obj , NSUInteger idx);
/** <^(id obj)>弱类型化移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项, */
LBDeclare NSObject*    (^objRemove)(id obj);
/** <^(id obj)>弱类型化移除;<UIView>时为移除子视图,<String>时为移除字符串,<Array>等集合类型为移除子项,<Dictionary>时为移除键相关的项.<UILable|UITextFild|UITextView|UISearchBar>时为清除文本内容 */
LBDeclare NSObject*    (^objRemoveAll)(void);

/** <^(id obj)>弱类型化移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项 */
LBDeclare NSObject*    (^objRemoveFrom)(id obj);
/** objRemoveFrom调用后，将链条切换到参数 */
LBDeclare NSObject*    (^objRemoveFromAsWhatSet)(id obj);



#pragma mark - LinkBlock
/** 打印json形式的对象 */
LBDeclare NSObject*    (^po)(void);
/** 打印json形式的对象，深度遍历的，展开的 */
LBDeclare NSObject*    (^poDetail)(void);
/** <^(id obj)>弱类型化判断对象是否有内容
 检查项为：
 字符串是否有内容
 NSValue是否有内容，其中NSNumber对0检查，结构体对默认值进行检查，其他队NULL进行检查
 容器类对象是否有内容
 控件是否有子控件
 用户模型是否赋值
 */
LBDeclare BOOL         (^objIsBlank)(void);
LBDeclare BOOL         (^objIsNSNull)(void);
LBDeclare NSNumber*    (^objIsNSNullAs)(void);

/** <^()> 通过序列化的方式复制一份完全独立的对象 */
LBDeclare NSObject*    (^objCopyByArchive)(void);

LBDeclare BOOL         (^objIsEqualToEach)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToEachAs)(id obj,...);
LBDeclare BOOL         (^objIsEqualToEachInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToEachInArrayAs)(NSArray* arr);
LBDeclare BOOL         (^objIsEqualToSomeone)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToSomeoneAs)(id obj,...);
LBDeclare BOOL         (^objIsEqualToSomeoneInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToSomeoneInArrayAs)(NSArray* arr);




#pragma mark - Block
/** <^()>block的参数个数 */
LBDeclare NSUInteger    (^blockArgsCount)(void);
/** <^()>block的返回类型 */
LBDeclare const char *  (^blockReturnType)(void);
#pragma mark - Class
/** 判断Foundation类型 */
+ (BOOL)classIsFoundation;
/** 当前类型是否包含属性（@property value），不包括父类 */
+ (BOOL)classContainProperty:(NSString*)property;
/** 当前类型是否包含成员变量（_value）不包括父类 */
+ (BOOL)classContainIvar:(NSString*)ivarName;
/** 获取当前类型的成员变量名列表 */
+ (NSArray<NSString*>*)classGetIvarList;
/** 获取当前类型的属性名列表（@property value） */
+ (NSArray<NSString*>*)classGetPropertyList;
/**
 获取当前类型属性的类型字符串
 @param key 属性名
 @return 属性类型的字符串；基本类型数据返回形如：i,q,l...(参考：property type encodings)
 */
+ (NSString*)classGetPropertyType:(NSString*)key;
/**
 *  获取当前类型及父类的属性名列表（不包含NSObject以及NSObject扩展属性）
 *  @param includeFoundation 是否包含基础类型
 */
+ (NSArray<NSString*>*)classGetAllPropertyList:(BOOL)includeFoundation;
/** 获取实例方法名列表 */
- (NSArray<NSString*>*)objGetInstanceMethodList;
/** 获取类方法名列表 */
+ (NSArray<NSString*>*)classGetClassMethodList;
/** 获取协议名列表 */
+ (NSArray<NSString*>*)classGetProtocolList;
/**
 *  向上遍历所有类
 *  @param includeFoundation 遍历时是否包含Foundation类型
 */
+ (void)classEnumerateUsingBlock:(void(^)(Class clazz , BOOL* stop))block
               includeFoundation:(BOOL)includeFoundation;

/**
 *  遍历所有属性（propertyType：属性类型的字符串；基本类型数据形如：i,q,l...(参考：property type encodings或objValueRandom内部实现)
 *
 *  @param includeFoundation 遍历时是否包含Foundation类型
 */
+ (void)classPropertysEnumerateUsingBlock:(void(^)(Class clazz,NSString* propertyName,NSString* propertyType,BOOL* stop))block
                        includeFoundation:(BOOL)includeFoundation;

//MARK: 强制类型声明
-                  (NSString*)                  asNSString;
-                  (NSMutableString*)           asNSMutableString;
-                  (NSArray*)                   asNSArray;
-                  (NSMutableArray*)            asNSMutableArray;
-                  (NSDictionary*)              asNSDictionary;
-                  (NSMutableDictionary*)       asNSMutableDictionary;
-                  (NSAttributedString*)        asNSAttributedString;
-                  (NSMutableAttributedString*) asNSMutableAttributedString;
-                  (NSURL*)                     asNSURL;
-                  (NSUserDefaults*)            asNSUserDefaults;
-                  (NSNumber*)                  asNSNumber;
-                  (NSValue*)                   asNSValue;
-                  (NSDate*)                    asNSDate;
-                  (NSData*)                    asNSData;
-                  (NSSet*)                     asNSSet;
-                  (NSMutableSet*)              asNSMutableSet;
-                  (NSCalendar*)                asNSCalendar;
-                  (UIView*)                    asUIView;
-                  (UIImage*)                   asUIImage;
-                  (UILabel*)                   asUILabel;
-                  (UIControl*)                 asUIControl;
-                  (UIButton*)                  asUIButton;
-                  (UIScrollView*)              asUIScrollView;
-                  (UIImageView*)               asUIImageView;
-                  (UITableView*)               asUITableView;
-                  (UIColor*)                   asUIColor;
-                  (UIViewController*)          asUIViewController;
-                  (UITextField*)               asUITextField;
-                  (UITextView*)                asUITextView;
-                  (UIWebView*)                 asUIWebView;
-                  (CALayer*)                   asCALayer;


#pragma mark - 动态解析 DynamicLink
/**
 @param ... 参数以nil,NSNotFond结尾，以其可以区分结构体
 */
LBDeclare NSObject*            (^linkEvalCode)(NSString* code , ...);
@end




/**
 包装一个对象为安全链条起始对象
 */
NS_INLINE id _LB_MakeObj(id object){
    return object?object:[LinkError new];
}
/**
 包装多个对象为多对象链条起始对象

 @param object0 必要的参数
 @param ... 该函数需要以nil作为结尾
 */
NS_INLINE LinkInfo* _LB_MakeObjs(id object0, ...){
    va_list args;
    return object0?(va_start(args, object0),[LinkGroup groupWithObjs:object0 args:args]):[LinkError new];
}
/**
 默认值对象
 */
NS_INLINE id _LB_DefaultObj(id obj , id instead){
    return obj?obj:instead;
}

/**
 非空对象
 */
NS_INLINE id _LB_NotNilObj(id obj){
    return obj?obj:[NSNull null];
}
