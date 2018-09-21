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

#pragma mark - 动态解析 DynamicLink
/**
 @param ... 参数以nil,NSNotFond结尾，以其可以区分结构体
 */
LBDeclare NSObject*            (^linkEvalCode)(NSString* code , ...);

#pragma mark - 基础 Basic
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
- (NSObject*)linkFrom:(NSUInteger)from to:(NSUInteger)to block:(void(^)(NSUInteger idx , NSObject* obj))block;


/**
 该方法不会像linkFirstObj，linkLastObj，linkAt一样中断多对象链条

 @param idx 对象索引
 @param block code...
 @return 原对象
 */
- (NSObject*)linkAt:(NSUInteger)idx block:(void(^)(NSObject* obj))block;

#pragma mark - 功能
/**
 <^(id* toObject)>将当前对象赋值到变量
 ...objSetTo(&...);
 */
LBDeclare NSObject*    (^objSetTo)(id* toObject);

/** <^()>NSLog()打印对象 */
LBDeclare NSObject*    (^nslog)(void);
/** <^(NSString* key)>输出对象Key对应的值 */
LBDeclare NSObject*    (^nslogValueForKey)(NSString* key);
/** <^(NSString* key)> */
LBDeclare NSObject*    (^nslogValueForKeyPath)(NSString* key);

/** <^()>打印对象引用计数器 */
LBDeclare_F NSObject*  logRetainCount;
/** <^()>将对象以字典的形式进行打印，其中对所有容器类型进行遍历转换 */
LBDeclare NSObject*    (^po)(void);
/** <^()>将对象以字典的形式进行打印 */
LBDeclare NSObject*    (^poNoDeep)(void);


#pragma mark - Runtime
/** <^(NSString* key)>返回值为nil时返回NSNull，可使用linkEnd获取nil值 */
LBDeclare NSObject*    (^objValueForKey)(NSString* key);
/** <^(NSString* key)>返回值为nil时返回NSNull，可使用linkEnd获取nil值 */
LBDeclare NSObject*    (^objValueForKeyPath)(NSString* key);
/** <^(id value,NSString* key)> */
LBDeclare NSObject*    (^objSetValueForKey)(id value,NSString* key);
/** <^(id value,NSString* key)> */
LBDeclare NSObject*    (^objSetValueForKeyPath)(id value,NSString* key);
/** <^(NSDictionary<NSString *,id> * kvs)> */
LBDeclare NSObject*    (^objSetValuesWithKeyValues)(NSDictionary<NSString *,id> * keyValues);
/** <^(NSArray<NSString *> *keys)> */
LBDeclare NSDictionary<NSString *, id>* (^objKeyValueWithKeys)(NSArray<NSString *> *keys);
/** <^(NSString* key)> */
LBDeclare NSObject*    (^objSetNilForKey)(NSString* key);
/** <^(id key, NSUInteger len)>key<NSString|NSArray> */
LBDeclare NSObject*    (^objSetRandomStringForKey)(id key, NSUInteger len);
/** <^(id key, NSUInteger len)>key<NSString|NSArray> */
LBDeclare NSObject*    (^objSetRandomStringzh_CNForKey)(id key, NSUInteger len);
/** <^(id key, NSUInteger len)>key<NSString|NSArray>随机数字字符串，不会以'0'作为开始 */
LBDeclare NSObject*    (^objSetRandomStringNumberForKey)(id key, NSUInteger len);
/** <^(id key, NSUInteger max)>key<NSString|NSArray> set integer value */
LBDeclare NSObject*    (^objSetRandomNumberForKey)(id key, uint32_t max);
/** <^(id key, NSUInteger max)>key<NSString|NSArray> set double value */
LBDeclare NSObject*    (^objSetRandomDoubleForKey)(id key, uint32_t max, NSUInteger len);
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsKindOf)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsKindOf_n)( __unsafe_unretained Class clazz);
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsSubClassOf)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsSubClassOf_n)( __unsafe_unretained Class clazz);
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsMemberOfClass)( __unsafe_unretained Class clazz);
LBDeclare NSNumber*    (^objIsMemberOfClass_n)( __unsafe_unretained Class clazz);
/** <^(SEL theSEL)> */
LBDeclare BOOL         (^objIsRespondsSEL)(SEL sel);
LBDeclare NSNumber*    (^objIsRespondsSEL_n)(SEL sel);
/** <^()> */
LBDeclare NSString*    (^objClassName)(void);
/** <^()> */
LBDeclare NSString*    (^objSuperclassName)(void);

/** <^(id value)>设置'delegate' */
LBDeclare NSObject*    (^objSetValueForKey_delegate)(id value);
/** <^(id value)>设置'dataSource' */
LBDeclare NSObject*    (^objSetValueForKey_dataSource)(id value);
/** <^(id value)>设置'text' */
LBDeclare NSObject*    (^objSetValueForKey_text)(id value);
/** <^(SEL sel)>  */
LBDeclare NSObject*    (^objPerformSelector)(SEL sel);
/** <^(SEL sel , id arg)> */
LBDeclare NSObject*    (^objPerformSelectorWithArg)(SEL sel , id arg);
/** <^(SEL sel0 , ...)>宏定义下该方法代码无需以nil结尾； */
LBDeclare NSObject*    (^objPerformSelectors)(SEL sel0 , ...);
/** 
 <^(SEL sel0 , NSArray* args0 , ...)> 入参方法和参数数组循环间隔；在参数数组中使用NSNull来代替nil。不要在参数中间传递nil，若想调用无参方法或者想给全部参数传递nil可以使用空数组。方法内会自动适配参数个数；宏定义下该方法无需手工以nil结尾；
 */
LBDeclare NSObject*    (^objPerformSelectorsWithArgs)(SEL sel0 , NSArray* args0 , ...);
/** <^(SEL sel)>返回结果 */
LBDeclare NSObject*    (^objPerformSelector_linkToReturnValue)(SEL sel);
/** <^(SEL sel , id arg)>该方法会返回调用结果，调用void返回方法时返回结果为NSNull，所有nil的返回值也都装箱为NSNull； */
LBDeclare NSObject*    (^objPerformSelectorWithArg_linkToReturnValue)(SEL sel , id arg);
/** <^(SEL sel0 , ...)>该方法会返回调用结果，调用void返回方法时返回结果为NSNull，所有nil的返回值也都装箱为NSNull；宏定义下该方法无需手工以nil结尾； */
LBDeclare NSArray*     (^objPerformSelectors_linkToReturnValues)(SEL sel0 , ...);
/** 
 <^(SEL sel0 , NSArray* args0 , ...)>该方法会返回调用结果，调用void返回方法时返回结果为NSNull，所有nil的返回值也都装箱为NSNull；方法内会自动适配参数个数；在参数数组中使用NSNull来代替nil。不应在参数中间位置传递nil，若想调用无参方法或者想给全部参数传递nil可以使用空数组；宏定义下该方法无需手工以nil结尾；
 */
LBDeclare NSArray*     (^objPerformSelectorsWithArgs_linkToReturnValues)(SEL sel0 , NSArray* args0 , ...);
/** <^()>获取对象的引用计数器 */
LBDeclare_F CFIndex    objRetainCount;

/** 是否是常见基础类型 */
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
 *
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
 *  遍历所有类
 *
 *  @param includeFoundation 遍历时是否包含基础类型
 */
+ (void)classEnumerateUsingBlock:(void(^)(Class clazz , BOOL* stop))block
               includeFoundation:(BOOL)includeFoundation;

/**
 *  遍历所有属性（propertyType：属性类型的字符串；基本类型数据形如：i,q,l...(参考：property type encodings或objValueRandom内部实现)
 *
 *  @param includeFoundation 遍历时是否包含基础类型
 */
+ (void)classPropertysEnumerateUsingBlock:(void(^)(Class clazz,NSString* propertyName,NSString* propertyType,BOOL* stop))block
               includeFoundation:(BOOL)includeFoundation;

#pragma mark - NSObject
/** <^(id obj)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAdd)(id obj);
/** <^(id obj)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAddTo)(id obj);
/** <^(id obj)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项，返回为入参对象 */
LBDeclare NSObject*    (^objAddTo_linkTo)(id obj);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsert)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsertTo)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项，返回为入参对象 */
LBDeclare NSObject*    (^objInsertTo_linkTo)(id obj , NSUInteger idx);
/** <^(id obj)>弱类型化移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项, */
LBDeclare NSObject*    (^objRemove)(id obj);
/** <^(id obj)>弱类型化移除;<UIView>时为移除子视图,<String>时为移除字符串,<Array>等集合类型为移除子项,<Dictionary>时为移除键相关的项.<UILable|UITextFild|UITextView|UISearchBar>时为清除文本内容 */
LBDeclare NSObject*    (^objRemoveAll)(void);
/** <^(id obj)>弱类型化判断对象是否有内容
 检查项为：
 字符串是否有内容
 NSValue是否有内容，其中NSNumber对0检查，结构体对默认值进行检查，其他队NULL进行检查
 容器类对象是否有内容
 控件是否有子控件
 用户模型是否赋值
 */
LBDeclare BOOL         (^objIsBlank)(void);
/** <^(id obj)>弱类型化移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项 */
LBDeclare NSObject*    (^objRemoveFrom)(id obj);
/** <^(id obj)>弱类型化移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项，返回为入参对象 */
LBDeclare NSObject*    (^objRemoveFrom_linkTo)(id obj);

LBDeclare NSObject*    (^objCopy)(void);
LBDeclare NSObject*    (^objMutableCopy)(void);
/** <^()> 不可变对象转为可变对象，否则不会发生任何事 */
LBDeclare NSObject*    (^objNeedMutable)(void);
/** <^()> 通过序列化的方式复制一份完全独立的对象 */
LBDeclare NSObject*    (^objCopyByArchive)(void);
/** <^()> 是否是可变类型*/
LBDeclare BOOL         (^objIsMutable)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfNSString)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfNSArray)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfNSDictionary)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfUIView)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfNSValue)(void);
/** <^()> */
LBDeclare NSNumber*    (^objIsKindOfNSNumber)(void);
/** <^()> 判断是否是数字类型或数字的字符串 */
LBDeclare NSNumber*    (^objIsNumber)(void);
/** <^()> 判断是否是集合类型 */
LBDeclare NSNumber*    (^objIsCollection)(void);
/** 可变拷贝并且操作到子项 */
LBDeclare NSObject*    (^objMutableCopyEnumerable)(void);


LBDeclare BOOL         (^objIsNSNull)(void);
LBDeclare NSNumber*    (^objIsNSNull_n)(void);

LBDeclare BOOL         (^objIsEqual)(id obj);
LBDeclare NSNumber*    (^objIsEqual_n)(id obj);
/** <^(id obj,...)> */
LBDeclare BOOL         (^objIsEqualToEach)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToEach_n)(id obj,...);

LBDeclare BOOL         (^objIsEqualToEachInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToEachInArray_n)(NSArray* arr);

LBDeclare BOOL         (^objIsEqualToSomeone)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToSomeone_n)(id obj,...);

LBDeclare BOOL         (^objIsEqualToSomeoneInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToSomeoneInArray_n)(NSArray* arr);

/** <^(NSString* key)>
 *  bool取反: bool type=<YES/NO>,NSNumber 同理<@YES/@NO>,
 *  相反数: number type = <1/-1> .NSNumber 同理,<@(1),@(-1)>
 *  字符串逆序: <@"abc"/@"cba">
 *  width和height的交换: CGRect和CGSize
 *  CGPoint,CGVector,UIOffset 交换值
 *  UIEdgeInsets,NSDirectionalEdgeInsets 交换上下值,交换左右值
 *  特别的：属性类型是c的直接量属性时,无法区分这三种类型<bool,char,xyShort>,此处按bool对待
 */
LBDeclare NSObject*    (^objReverseValueForKey)(NSString* key);
/** <^(NSArray* withoutKeys)>将自定义对象的字符串类型和数字类型随机赋值，排除readonly和无'_成员变量'的属性 */
LBDeclare NSObject*    (^objSetValuesRandom)(void);
/** <^()> 清空所有可访问的属性的值为默认值，排除readonly和无'_成员变量'的属性 */
LBDeclare NSObject*    (^objValuesClean)(void);
#pragma mark - About NSString
/** <^()>NSDate,NSString,NSArray,NSDictionary等对象转成json的字符串 */
LBDeclare NSString*    (^objToJsonString)(void);
/** <^()> <JSValue & NSString> to nsnumber */
LBDeclare NSNumber*    (^objToNSNumber)(void);

#pragma mark - About NSMutableArray
/** <^(NSMutableArray* arr)>将对象添加到 */
LBDeclare NSObject*    (^objAddToArr)(NSMutableArray* arr);
/** <^(NSMutableArray* arr)> */
LBDeclare NSObject*    (^objRemoveFromArr)(NSMutableArray* arr);
/** <^(NSArray* inArr)>在数组中的前一个元素 */
LBDeclare NSObject*    (^objBeforeInArr)(NSArray* inArr);
/** <^(NSArray* inArr)>在数组中的后一个元素 */
LBDeclare NSObject*    (^objNextInArr)(NSArray* inArr);
/** <^(NSArray* inArr)>对象是否在数组中 */
LBDeclare BOOL         (^objIsInArr)(NSArray* inArr);
LBDeclare NSNumber*    (^objIsInArr_n)(NSArray* inArr);
#pragma mark - About NSMutableDictionary
/** <^(NSMutableDictionary* dict, id<NSCopying> key)>将对象设置到字典 */
LBDeclare NSObject*    (^objSetToDict)(NSMutableDictionary* dict, id<NSCopying> key);
/** <^(NSMutableDictionary* dict)>对象是否在字典值的集合中 */
LBDeclare BOOL         (^objIsInDictValues)(NSMutableDictionary* dict);
LBDeclare NSNumber*    (^objIsInDictValues_n)(NSMutableDictionary* dict);
/** <^(NSMutableDictionary* dict)>对象是否在字典键的集合中 */
LBDeclare BOOL         (^objIsInDictKeys)(NSMutableDictionary* dict);
LBDeclare NSNumber*    (^objIsInDictKeys_n)(NSMutableDictionary* dict);
/**
 *  <^(BOOL includeFoundation)>
 *  将当前对象转字典（如果对象为容器类型则对值进行一次转换）
 *  includeFoundationProperty：是否包含基础类型的属性
 */
LBDeclare NSDictionary*(^objToNSDictionaryNoDeep)(BOOL includeFoundation);
/**
 *  <^(BOOL includeFoundation)>
 *  对象转字典（对所有属性进行层次遍历，对容器对象的值也是）
 *  includeFoundationProperty：是否包含基础类型的属性
 */
LBDeclare NSDictionary*(^objToNSDictionary)(BOOL includeFoundation);


#pragma mark - of block
/** <^()>是否是block对象 */
LBDeclare BOOL          (^objIsKindOfNSBlock)(void);
/** <^()>block的参数个数 */
LBDeclare NSUInteger    (^blockArgsCount)(void);
/** <^()>block的返回类型 */
LBDeclare const char *  (^blockReturnType)(void);

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
