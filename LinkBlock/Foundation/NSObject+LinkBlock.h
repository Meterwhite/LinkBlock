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

#pragma mark - Foundation Mirror
@property LB_BK NSObject*    (^objCopy)(void);
@property LB_BK NSObject*    (^objMutableCopy)(void);
/** NSLog(@"%@",self); */
@property LB_BK NSObject*    (^nslog)(void);
@property LB_BK BOOL         (^objIsEqual)(id obj);
@property LB_BK NSNumber*    (^objIsEqualAs)(id obj);
@property LB_BK NSString*    (^objClassName)(void);
@property LB_BK NSString*    (^objSuperclassName)(void);

@property LB_BK BOOL         (^objIsRespondsSEL)(SEL sel);
@property LB_BK NSNumber*    (^objIsRespondsSELAs)(SEL sel);
@property LB_BK BOOL         (^objIsKindOf)( __unsafe_unretained Class clazz);
@property LB_BK NSNumber*    (^objIsKindOfAs)( __unsafe_unretained Class clazz);
@property LB_BK BOOL         (^objIsSubClassOf)( __unsafe_unretained Class clazz);
@property LB_BK NSNumber*    (^objIsSubClassOfAs)( __unsafe_unretained Class clazz);
@property LB_BK BOOL         (^objIsMemberOfClass)( __unsafe_unretained Class clazz);
@property LB_BK NSNumber*    (^objIsMemberOfClassAs)( __unsafe_unretained Class clazz);

/** result nil==>NSNull , NSNull.linkEnd == nil */
@property LB_BK NSObject*    (^objValueForKey)(NSString* key);
/** result nil==>NSNull , NSNull.linkEnd == nil */
@property LB_BK NSObject*    (^objValueForKeyPath)(NSString* key);
@property LB_BK NSObject*    (^objSetValueForKey)(id value,NSString* key);
@property LB_BK NSObject*    (^objSetValueForKeyPath)(id value,NSString* key);
@property LB_BK NSObject*    (^objSetValuesWithKeyValues)(NSDictionary<NSString *,id> * keyValues);
@property LB_BK NSDictionary*(^objKeyValueWithKeys)(NSArray<NSString*>*keys);
@property LB_BK NSObject*    (^objPerformSelector)(SEL sel);

#pragma mark - Foundation Fast
/** 是否是block对象 */
@property LB_BK BOOL         (^objIsKindOfNSBlock)(void);
@property LB_BK NSNumber*    (^objIsKindOfNSStringAs)(void);
@property LB_BK NSNumber*    (^objIsKindOfNSArrayAs)(void);
@property LB_BK NSNumber*    (^objIsKindOfNSDictionaryAs)(void);
@property LB_BK NSNumber*    (^objIsKindOfUIViewAs)(void);
@property LB_BK NSNumber*    (^objIsKindOfNSValueAs)(void);
@property LB_BK NSNumber*    (^objIsKindOfNSNumberAs)(void);
@property LB_BK NSObject*    (^objSetValueForKdelegate)(id value);
@property LB_BK NSObject*    (^objSetValueForKdataSource)(id value);
@property LB_BK NSObject*    (^objSetValueForKtext)(id value);
/** 打印对象引用计数器 */
@property LB_F NSObject*  logRetainCount;
/** <^()>获取对象的引用计数器 */
@property LB_F CFIndex    objRetainCount;


#pragma mark - Foundation Extent
/** 是否是可变类型*/
@property LB_BK BOOL         (^objIsMutable)(void);
@property LB_BK NSNumber*    (^objIsMutableAs)(void);
/** 可变拷贝并且操作到子项 */
@property LB_BK NSObject*    (^objMutableCopyEnumerate)(void);
/** <^()> 不可变对象转为可变对象，否则不会发生任何事 */
@property LB_BK NSObject*    (^objNeedMutable)(void);
/** <^(NSString* key)>输出对象Key对应的值 */
@property LB_BK NSObject*    (^nslogValueForKey)(NSString* key);
/** <^(NSString* key)> */
@property LB_BK NSObject*    (^nslogValueForKeyPath)(NSString* key);
/** asKey∈{NSString,NSArray} */
@property LB_BK NSObject*    (^objSetNilForKey)(id asKey);
/** asKey∈{NSString,NSArray} */
@property LB_BK NSObject*    (^objSetRandomStringForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray} */
@property LB_BK NSObject*    (^objSetRandomStringzh_CNForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray}随机数字字符串，不会以'0'作为开始 */
@property LB_BK NSObject*    (^objSetRandomStringNumberForKey)(id asKey, NSUInteger len);
/** asKey∈{NSString,NSArray} set integer value */
@property LB_BK NSObject*    (^objSetRandomNumberForKey)(id asKey, uint32_t max);
/** asKey∈{NSString,NSArray} set double value */
@property LB_BK NSObject*    (^objSetRandomDoubleForKey)(id asKey, uint32_t max, NSUInteger len);
/**
 *  asKey∈{NSString,NSArray} set NSDate
 *  days∈{NSNumber,NSArray<NSNumber>}
 *  days == @(-30) or @[@(-30)]random in the past 30 days；Otherwise opposite
 *  days == @[@(-30) , @(30)]，random in the past 30 days or next 30 days
 *  days == nil or @0，random in the past 24 hours
 */
@property LB_BK NSObject*    (^objSetRandomDateForKey)(id asKey,id days);
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
@property LB_BK NSObject*    (^objReverseValueForKey)(NSString* key);
/** 字符串类型和数字类型随机赋较短的值，排除readonly和无'_成员变量'的属性 */
/** <^()> 清空所有可访问的属性的值为默认值，排除readonly和无'_成员变量'的属性 */
@property LB_BK NSObject*    (^objSetAllValuesBlank)(void);

@property LB_BK NSObject*    (^objPerformSelectors)(SEL sel0,...);
@property LB_BK NSObject*    (^objPerformSelectorArgument)(SEL sel,id arg);
@property LB_BK NSObject*    (^objPerformsSelectorArguments)(SEL sel0,NSArray* args0,...);
/**
 *返回调用结果的形式
 *调用void返回方法时返回结果为NSNull,所有nil的返回值也都装箱为NSNull；
 **/
@property LB_BK NSObject*    (^objPerformSelectorAsWhatReturn)(SEL sel);
@property LB_BK NSArray*     (^objPerformSelectorsAsWhatReturns)(SEL sel0,...);
@property LB_BK NSObject*    (^objPerformSelectorArgumentAsWhatReturn)(SEL sel,id arg);
@property LB_BK NSArray*     (^objPerformsSelectorArgumentsAsWhatReturns)(SEL sel0,NSArray*args0,...);



#pragma mark - Weak coding/弱类型编码
/** for NSJSONSerialization */
@property LB_BK NSString*    (^objToJsonString)(void);
/** retrun value can be used to NSJSONSerialization  */
@property LB_BK NSObject*    (^objToNSJsonObject)(void);
@property LB_BK NSObject*    (^objToNSJsonObjectDepth)(void);
@property LB_BK NSObject*    (^objToNSJsonObjectFoundation)(void);
@property LB_BK NSObject*    (^objToNSJsonObjectDepthAndFoundation)(void);
/** self is not a collection object  */
@property LB_BK NSDictionary*(^objToNSDictionary)(void);
@property LB_BK NSDictionary*(^objToNSDictionaryWithKeys)(NSArray* asKey);
/** <^()> <JSValue & NSString> to nsnumber */
@property LB_BK NSNumber*    (^objToNSNumber)(void);
/** objs∈{NSArray,NSOrderedSet} */
@property LB_BK NSObject*    (^objGetPrevItemFromObjs)(id objs);
@property LB_BK NSObject*    (^objGetNextItemFromObjs)(id objs);
/** obs∈{UIView,CALayer,UIViewController,NSIndexSet,.objectEnumerator} */
@property LB_BK NSNumber*    (^objIsSubitemOfObjAs)(id obj);
/** objs∈{.objectEnumerator,NSIndexSet} */
@property LB_BK BOOL         (^objIsSubitemOfObjs)(id objs);
@property LB_BK NSNumber*    (^objIsSubitemOfObjsAs)(id objs);
/** objs∈{.keyEnumerator} */
@property LB_BK BOOL         (^objIsKeyOfObjs)(id objs);
@property LB_BK NSNumber*    (^objIsKeyOfObjsAs)(id objs);
/** Determine object if is NSNumber or number of string */
@property LB_BK NSNumber*    (^objIsNumberAs)(void);
/** Determine type or protocol{<NSFastEnumeration>,NSIndexSet,NSIndexPath} */
@property LB_BK NSNumber*    (^objIsCollectionAs)(void);

@property LB_BK NSObject*    (^objAdd)(id obj);
@property LB_BK NSObject*    (^objAddTo)(id obj);
/** objAddTo调用后，将链条切换到参数 */
@property LB_BK NSObject*    (^objAddToAsWhatSet)(id obj);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
@property LB_BK NSObject*    (^objInsert)(id obj , NSUInteger idx);
/** <^(id obj , NSUInteger idx)>弱类型化添加;UIView时为添加子视图,String时为拼接字符串,Array等集合类型为添加子项 */
@property LB_BK NSObject*    (^objInsertTo)(id obj , NSUInteger idx);
/** objInsertTo调用后，将链条切换到参数 */
@property LB_BK NSObject*    (^objInsertToAsWhatSet)(id obj , NSUInteger idx);
/** self,obj∈{NSString , .responseToSelector(removeObject:,removeFromSuperview,removeFromSuperlayer,removeFromParentViewController,removeIndex:) } */
@property LB_BK NSObject*    (^objRemove)(id obj);
@property LB_BK NSObject*    (^objRemoveFrom)(id obj);
/** call objRemoveFrom then switch link to your paramiter */
@property LB_BK NSObject*    (^objRemoveFromAsWhatSet)(id obj);
@property LB_BK NSObject*    (^objRemoveAll)(void);


#pragma mark - LinkBlock
/** print object as json string */
@property LB_BK NSObject*    (^po)(void);
@property LB_BK NSObject*    (^poDetail)(void);
/** Determine if object contain info/对象是否有内容
 check：
 String Type - Empty
 NSValue Type(NSNumber-0，Struct-DefaultValue，Others-NULL)
 Collection contains item
 UIView contains subview
 Custom Type - nil
 */
@property LB_BK BOOL         (^objIsBlank)(void);
@property LB_BK BOOL         (^objIsNSNull)(void);
@property LB_BK NSNumber*    (^objIsNSNullAs)(void);

@property LB_BK NSObject*    (^objCopyByArchive)(void);

@property LB_BK BOOL         (^objIsEqualToEach)(id obj,...);
@property LB_BK NSNumber*    (^objIsEqualToEachAs)(id obj,...);
@property LB_BK BOOL         (^objIsEqualToEachInArray)(NSArray* arr);
@property LB_BK NSNumber*    (^objIsEqualToEachInArrayAs)(NSArray* arr);
@property LB_BK BOOL         (^objIsEqualToSomeone)(id obj,...);
@property LB_BK NSNumber*    (^objIsEqualToSomeoneAs)(id obj,...);
@property LB_BK BOOL         (^objIsEqualToSomeoneInArray)(NSArray* arr);
@property LB_BK NSNumber*    (^objIsEqualToSomeoneInArrayAs)(NSArray* arr);



#pragma mark - Block
@property LB_BK NSUInteger    (^blockArgsCount)(void);
@property LB_BK const char *  (^blockReturnType)(void);

#pragma mark - Class
/** Determine if Foundation type */
+ (BOOL)classIsFoundation;
+ (BOOL)classContainProperty:(NSString*)property;
+ (BOOL)classContainIvar:(NSString*)ivarName;
+ (NSArray<NSString*>*)classGetIvarList;
+ (NSArray<NSString*>*)classGetPropertyList;
/** reference:property type encodings */
+ (NSString*)classGetPropertyType:(NSString*)key;
/** Depth Traversal */
+ (NSArray<NSString*>*)classGetAllPropertyList:(BOOL)includeFoundation;
- (NSArray<NSString*>*)objGetInstanceMethodList;
+ (NSArray<NSString*>*)classGetClassMethodList;
+ (NSArray<NSString*>*)classGetProtocolList;
/** Depth Traversal */
+ (void)classEnumerateUsingBlock:(void(^)(Class clazz , BOOL* stop))block
               includeFoundation:(BOOL)includeFoundation;

/** propertyName reference:property type encodings */
+ (void)classPropertysEnumerateUsingBlock:(void(^)(Class clazz,NSString* propertyName,NSString* propertyType,BOOL* stop))block includeFoundation:(BOOL)includeFoundation;

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


#pragma mark - Link
@property LB_F  id             linkEnd;
@property LB_F NSArray*        linkEnds;
@property LB_BK id                (^linkEndsAt)(NSUInteger idx);
@property LB_BK NSObject*         (^linkAnd)(id obj);
@property LB_BK NSObject*         (^linkTo)(id obj);
@property LB_BK NSObject*         (^linkOut)(NSUInteger idx);
@property LB_BK NSObject*         (^linkAt)(NSUInteger idx);
@property LB_F NSObject*       linkFirstObj;
@property LB_F NSObject*       linkLastObj;
@property LB_BK NSObject*         (^linkLoop)(NSUInteger count);
@property LB_BK NSObject*         (^linkIf)(BOOL condition);
@property LB_F NSObject*       linkElse;
@property LB_F NSObject*       linkReturn;

- (NSObject*)linkInBlock:(void(^)(NSObject* link))block;
- (NSObject*)linkAsy_main_queue:(void(^)(NSObject* link))block;
- (NSObject*)linkAsy_global_queue:(void(^)(NSObject* link))block;

/**
 重复执行
 Perform the specified number of times to link
 */
- (NSObject*)linkLoopIn:(NSUInteger)count block:(void(^)(NSObject* link, NSUInteger index))block;
- (NSObject*)linkAfterIn:(double)time block:(void(^)(NSObject* link))block;


/** Do not change next link */
- (NSObject*)linkFrom:(NSUInteger)fromIndex
                   to:(NSUInteger)toIndex
                block:(void(^)(NSUInteger idx , NSObject* obj))block;

/** Do not change next link */
- (NSObject*)linkAt:(NSUInteger)idx
              block:(void(^)(NSObject* obj))block;


#pragma mark - 动态解析 DynamicLink
/**
 End with "nil,NSNotFond" in linkBlock for structures
 */
@property LB_BK NSObject*  (^linkEvalCode)(NSString* code , ...);
@end



NS_INLINE id _LB_MakeObj(id object){
    return object?object:[LinkError new];
}
/**
 end with nil
 */
NS_INLINE LinkInfo* _LB_MakeObjs(id object0, ...){
    if(!object0) return [LinkError new];
    va_list args;
    va_start(args, object0);
    return [LinkGroup groupWithObjs:object0 args:args];
}

NS_INLINE id _LB_DefaultObj(id obj , id instead){
    return obj?obj:instead;
}

NS_INLINE id _LB_NotNilObj(id obj){
    return obj?obj:[NSNull null];
}
