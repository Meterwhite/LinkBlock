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
#pragma mark - 方式
/** 
 <- linkEnd>获取链条返回值，并将错误转nil
 ... = linkObj(..)...linkEnd;
 ... = linkObj(..)...linkIf(...)...linkEnd;
 */
LBDeclare_F id              linkEnd;
/**
 <- ends>多对象链式编程获取多个链条返回值，并将错误转nil
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
 linkObjs(,,,)...linkTo(aNewObj)...
 ...linkIf(...)...linkTo(aNewObj)...linkElse...
 */
LBDeclare NSObject*         (^linkTo)(id obj);
/** 
 <^(NSUInteger idx)>使多链条中移除一个
 linkObjs(,,,)...linkOut(index)...
 */
LBDeclare NSObject*         (^linkOut)(NSUInteger idx);
/** 
 <^(NSUInteger idx)>取出多链条中一个
 linkObjs(,,,)...linkAt(index)...
 */
LBDeclare NSObject*         (^linkAt)(NSUInteger idx);
/**
 <^()>取出多链条中第一个
 linkObjs(,,,)...linkFirstObj...
 */
LBDeclare_F NSObject*       linkFirstObj;
/**
 <^()>取出多链条中最后一个
 linkObjs(,,,)...linkLastObj...
 */
LBDeclare_F NSObject*       linkLastObj;
/** 
 <^(NSUInteger count)>使其后的链条复制指定次数的重复执行效果。所以...linkLoop(...)...m_arrAddObj([NSObject new])...添加的是同一个对象。这里添加不同对象应使用方法linkLoopIn:block:。
 ...linkLoop(count)...
 */
LBDeclare NSObject*         (^linkLoop)(NSUInteger count);
/** 
 <^()>根据条件是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行；取值需使用end
 ...linkIf(...)...linkIf(...)...linkElse...
 ... = ...linkLoop(...)...linkIf(...)...linkEnds();
 */
LBDeclare NSObject*         (^linkIf)(BOOL condition);
/** 
 <^()>从中断语句中恢复执行其后语句，与前一个linkIf配合使用；取值需使用end
 ...linkIf(...)...linkIf(...)...linkElse...
 */
LBDeclare_F NSObject*       linkElse;
/**
 <^()>使其后语句跳空至末尾（优先级高于其他条件）；可与分支配合；取值需使用end
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

#pragma mark - 功能
/**
 <^(id* toObject)>将当前对象赋值到变量
 ...objSetTo(&...);
 */
LBDeclare NSObject*    (^objSetTo)(id* toObject);
/** <^()>NSLog() */
LBDeclare NSObject*    (^nslog)();
/** <^(NSString* title)>输出对象前增加标识语 */
LBDeclare NSObject*    (^nslogTitle)(NSString* title);
/** <^(NSString* title)>独立在语句中输出信息，并不打印对象 */
LBDeclare NSObject*    (^logInfo)(NSString* info);
/** <^()>将对象以字典的形式进行打印，其中对所有容器类型进行遍历转换 */
LBDeclare NSObject*    (^po)();
/** <^()>将对象以字典的形式进行打印 */
LBDeclare NSObject*    (^poNoDeep)();
/** <^(NSString* key)>输出对象Key对应的值 */
LBDeclare NSObject*    (^nslogValueForKey)(NSString* key);
/** <^(NSString* key)> */
LBDeclare NSObject*    (^nslogValueForKeyPath)(NSString* key);

#pragma mark - Runtime
/** <^(NSString* key)> */
LBDeclare NSObject*    (^objValueForKey)(NSString* key);
/** <^(NSString* key)> */
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
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsKindOf)( __unsafe_unretained Class classKind);
LBDeclare NSNumber*    (^objIsKindOf_n)( __unsafe_unretained Class classKind);
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsSubClassOf)( __unsafe_unretained Class classKind);
LBDeclare NSNumber*    (^objIsSubClassOf_n)( __unsafe_unretained Class classKind);
/** <^(Class classKind)> */
LBDeclare BOOL         (^objIsMemberOfClass)( __unsafe_unretained Class classKind);
LBDeclare NSNumber*    (^objIsMemberOfClass_n)( __unsafe_unretained Class classKind);
/** <^(SEL theSEL)> */
LBDeclare BOOL         (^objIsRespondsSEL)(SEL theSEL);
LBDeclare NSNumber*    (^objIsRespondsSEL_n)(SEL theSEL);
/** <^()> */
LBDeclare NSString*    (^objClassName)();
/** <^()> */
LBDeclare NSString*    (^objSuperclassName)();

/** <^(id value)>代理设置delegate */
LBDeclare NSObject*    (^objSetValueForKey_delegate)(id value);
/** <^(id value)>数据源设置dataSource */
LBDeclare NSObject*    (^objSetValueForKey_dataSource)(id value);
/** <^(id value)>文本设置text */
LBDeclare NSObject*    (^objSetValueForKey_text)(id value);
/** <^(SEL sel)> */
LBDeclare NSObject*    (^objPerformSelector)(SEL sel);
/** <^(SEL sel , id arg)> */
LBDeclare NSObject*    (^objPerformSelectorWithArg)(SEL sel , id arg);
/** <^(SEL sel0 , ...)>宏定义下该方法无需手工以nil结尾； */
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
/** <^(id obj)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAdd)(id obj);
/** <^(id obj)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objAddTo)(id obj);
/** <^(id obj)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项，返回为入参对象 */
LBDeclare NSObject*    (^objAddTo_linkTo)(id obj);
/** <^(id obj , NSUInteger idx)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsert)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
LBDeclare NSObject*    (^objInsertTo)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>复合功能的添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项，返回为入参对象 */
LBDeclare NSObject*    (^objInsertTo_linkTo)(id obj , NSUInteger idx);
/** <^(id obj)>复合功能的移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项 */
LBDeclare NSObject*    (^objRemoveAll)(id obj);
/** <^(id obj)>复合功能的移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项 */
LBDeclare NSObject*    (^objRemoveFrom)(id obj);
/** <^(id obj)>复合功能的移除;UIView时为移除子视图,String时为移除字符串,Array等集合类型为移除子项,Dictionary时为移除键相关的项，返回为入参对象 */
LBDeclare NSObject*    (^objRemoveFrom_linkTo)(id obj);
/** <^()> */
LBDeclare NSObject*    (^objCopy)();
/** <^()> */
LBDeclare NSObject*    (^objMutableCopy)();
/** <^()> 通过序列化的方式复制一份完全独立的对象 */
LBDeclare NSObject*    (^objCopyByArchive)();
/** <^()> 是否是可变类型*/
LBDeclare BOOL         (^objIsMutableType)();
/**
 *  <^()>
 *  对象及可能包含的子项全部转为json相关的可变类型(String,Array,Dictionary)
 * （NSMutableArray,NSMutableDictionary,NSMutableString）
 */
LBDeclare NSObject*    (^objMutableCopyDeep)();
/** <^()> */
LBDeclare BOOL         (^objIsNSNull)();
LBDeclare NSNumber*    (^objIsNSNull_n)();
/** <^(id obj)> */
LBDeclare BOOL         (^objIsEqual)(id obj);
LBDeclare NSNumber*    (^objIsEqual_n)(id obj);
/** <^(id obj,...)> */
LBDeclare BOOL         (^objIsEqualToEach)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToEach_n)(id obj,...);
/** <^(NSArray* arr)> */
LBDeclare BOOL         (^objIsEqualToEachInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToEachInArray_n)(NSArray* arr);
/** <^(id obj,...)> */
LBDeclare BOOL         (^objIsEqualToSomeone)(id obj,...);
LBDeclare NSNumber*    (^objIsEqualToSomeone_n)(id obj,...);
/** <^(NSArray* arr)> */
LBDeclare BOOL         (^objIsEqualToSomeoneInArray)(NSArray* arr);
LBDeclare NSNumber*    (^objIsEqualToSomeoneInArray_n)(NSArray* arr);
/** <^(Class theCalss)>必须获取该类型的对象，若类型不符则返回该类型的初始化对象 */
LBDeclare NSObject*    (^objMustType)(Class theCalss);
/** <^(NSString* key)>将BOOL或NSNumber(BOOL)属性字段值反转 */
LBDeclare NSObject*    (^objBoolReverseForKey)(NSString* key);
/** <^(NSArray* withoutKeys)>将自定义对象随机赋值，只包含字符串类型和数字类型，排除readonly和无'_成员变量'的属性 */
LBDeclare NSObject*    (^objValuesRandom)();
/** <^()> 清空所有可访问的属性的值为默认值，排除readonly和无'_成员变量'的属性 */
LBDeclare NSObject*    (^objValuesClean)();
#pragma mark - About NSString
/** <^()>NSDate,NSString,NSArray,NSDictionary等对象转成json的字符串 */
LBDeclare NSString*    (^objToJsonString)();

#pragma mark - About NSMutableArray
/** <^(NSMutableArray* arr)>将对象添加到 */
LBDeclare NSObject*    (^objAddToArr)(NSMutableArray* arr);
/** <^(NSMutableArray* arr)> */
LBDeclare NSObject*    (^objRemoveFromArr)(NSMutableArray* arr);
/** <^(NSArray* inArr)>在数组中的前一个元素，越界返回NSNuull */
LBDeclare NSObject*    (^objBeforeInArr)(NSArray* inArr);
/** <^(NSArray* inArr)>在数组中的后一个元素,空数组或越界返回NSNuull */
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



//MARK: 明确对象类型
-                  (NSString*)                  ofNSString;
-                  (NSMutableString*)           ofNSMutableString;
-                  (NSArray*)                   ofNSArray;
-                  (NSMutableArray*)            ofNSMutableArray;
-                  (NSDictionary*)              ofNSDictionary;
-                  (NSMutableDictionary*)       ofNSMutableDictionary;
-                  (NSAttributedString*)        ofNSAttributedString;
-                  (NSMutableAttributedString*) ofNSMutableAttributedString;
-                  (NSURL*)                     ofNSURL;
-                  (NSUserDefaults*)            ofNSUserDefaults;
-                  (NSNumber*)                  ofNSNumber;
-                  (NSValue*)                   ofNSValue;
-                  (NSDate*)                    ofNSDate;
-                  (NSData*)                    ofNSData;
-                  (NSSet*)                     ofNSSet;
-                  (NSMutableSet*)              ofNSMutableSet;
-                  (UIView*)                    ofUIView;
-                  (UIImage*)                   ofUIImage;
-                  (UILabel*)                   ofUILabel;
-                  (UIControl*)                 ofUIControl;
-                  (UIButton*)                  ofUIButton;
-                  (UIScrollView*)              ofUIScrollView;
-                  (UIImageView*)               ofUIImageView;
-                  (UITableView*)               ofUITableView;
-                  (UIColor*)                   ofUIColor;
-                  (UIViewController*)          ofUIViewController;
-                  (UITextField*)               ofUITextField;
-                  (UITextView*)                ofUITextView;
-                  (UIWebView*)                 ofUIWebView;
@end

/**
 包装一个对象为安全链条起始对象
 */
static inline id _LK_MakeObj(id object){
    return object?object:[LinkError new];
}
/**
 包装多个对象为多链条起始对象

 @param object0 必要的参数
 @param ... 该函数需要以nil作为结尾
 */
static inline LinkInfo* _LK_MakeObjs(id object0, ...){
    va_list args;
    return object0?(va_start(args, object0),[LinkGroup groupWithObjs:object0 args:args]):[LinkError new];
}
/**
 默认对象
 */
static inline id _LK_DefaultObj(id obj , id instead){
    return obj?obj:instead;
}

/**
 非空对象
 */
static inline id _LK_NotNilObj(id obj){
    return obj?obj:[NSNull null];
}
