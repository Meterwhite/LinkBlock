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

@interface NSObject(LinkBlockNSObject)

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
/**
 <^NSNumber*(NSString* predicateFormat,...)>
 Refer to : evaluateWithObject:
 */
@property LB_BK NSNumber*    (^objEvaluatePredicateAs)(NSString* predicateFormat,...);
/** <^BOOL(NSString* predicateFormat,...)> */
@property LB_BK BOOL         (^objEvaluatePredicate)(NSString* predicateFormat,...);
/** Determine if is block */
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

/**
 view.objSetScreenWidthForKeyPath(@"[<frame||bounds>.]size.width");
 view.objSetScreenWidthForKeyPath(@"width");
 */
//@property LB_BK NSObject*  (^objSetScreenWidthForPath)(NSString* path);
@property LB_FN NSObject*  logRetainCount;
@property LB_FN CFIndex    objRetainCount;


#pragma mark - Foundation Extent
/** 是否是可变类型*/
@property LB_BK BOOL         (^objIsMutable)(void);
@property LB_BK NSNumber*    (^objIsMutableAs)(void);
/** 可变拷贝并且操作到子项 */
@property LB_BK NSObject*    (^objMutableCopyEnumerate)(void);
/** <^()> 不可变对象转为可变对象，否则不会发生任何事 */
@property LB_BK NSObject*    (^objNeedMutable)(void);
@property LB_BK NSObject*    (^nslogValueForKey)(NSString* key);
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

/** Set all value nil or 0 while key accessible  */
@property LB_BK NSObject*    (^objSetAllValuesBlank)(void);

/** Return self */
@property LB_BK NSObject*    (^objPerformSelectors)(SEL sel0,...);
@property LB_BK NSObject*    (^objPerformSelectorArgument)(SEL sel,id arg);
@property LB_BK NSObject*    (^objPerformsSelectorArguments)(SEL sel0,NSArray* args0,...);
/**
 *  Perform selector and return retuslt.
 *  All result is boxed.
 *  (void || nil => return NSNull)
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

/**
 object that can get item by index
 obj ∈  {
    .responseToSelector(
        indexOfObject:,characterAtInde:,
        indexAtPosition:,pointerAtIndex:,
        resultAtIndex:,rangeAtIndex:,
        valueAtIndex:,glyphAtIndex:)
 }
 */
@property LB_BK NSNumber*  (^objIsIndexableAs)(void);
/**
 Collection that can get item by key
 obj ∈ {
    .responseToSelector(
        objectForKey:,propertyForKey:
    )
 }
 */
@property LB_BK NSNumber*  (^objIsKeyableAs)(void);
/**
 Array-able means object can convert to array object;
 obj ∈  {
    __kindof NSArray,
    .responseToSelector(
    allObjects,array
 )
 }
 */
@property LB_BK NSNumber*  (^objIsArrayableAs)(void);
/**
 Dictionary-able means object can convert to dictionary object;
 obj ∈  {
    __kindof NSDictionary,
    .responseToSelector(
        dictionaryRepresentation
    )
 */
@property LB_BK NSNumber*  (^objIsDictionaryableAs)(void);

/**
 self ∈ {
 NSString ,NSMutableString ,
 .responsetoSelector(
    addObject:, addEntriesFromDictionary:,
    appendAttributedString:, addSubview:, addSublayer:,
    appendData:, appendPath:, addIndex:
 )}
 note:String∈{NSString , NSMutableString}
 */
@property LB_BK NSObject*    (^objAdd)(id obj);
/** Refer to:objAdd */
@property LB_BK NSObject*    (^objAddTo)(id obj);
/** switch link object to parameter */
@property LB_BK NSObject*    (^objAddToAsWhatSet)(id obj);


/**
 self ∈ {
    NSString,NSMutableString,
    .responseToSelector(
        insertObject:atIndex:,
        insertSubview:atIndex:,
        insertSublayer:atIndex:
    )
 }
 */
@property LB_BK NSObject*    (^objInsert)(id obj , NSUInteger idx);
/** Refer to:objInsert */
@property LB_BK NSObject*    (^objInsertTo)(id obj , NSUInteger idx);
/** switch link object to parameter */
@property LB_BK NSObject*    (^objInsertToAsWhatSet)(id obj , NSUInteger idx);

/**
 self∈{
 NSString,NSMutableString,
 .responseToSelector(removeObject:,
    removeFromSuperview,
    removeFromSuperlayer,
    removeFromParentViewController,
    removeIndex:
    removeObjectForKey:
 )
 }
 */
@property LB_BK NSObject*    (^objRemove)(id obj);
/** Refer to:objRemove */
@property LB_BK NSObject*    (^objRemoveFrom)(id obj);
/** switch link object to parameter */
@property LB_BK NSObject*    (^objRemoveFromAsWhatSet)(id obj);


/**
 self   ∈   {
    NSString,NSMutableString,UIView,CALayer,
    .responseToSelector(
        removeAllObjects,removeAllIndexes,
        removeAllPoints,removeAllSegments,
        setText:
    )
 }
 note:setText: means setText:@"";
 */
@property LB_BK NSObject*    (^objRemoveAll)(void);

/**
 Type of objs is kind of collection that can be sort;
 */
@property LB_BK NSObject<NSFastEnumeration>*(^objsSortByKey)(NSString* key,BOOL ascending);
@property LB_BK NSObject<NSFastEnumeration>*(^objsSortByKeyAscending)(NSString* key);
@property LB_BK NSObject<NSFastEnumeration>*(^objsSortByKeyDescending)(NSString* key);
@property LB_BK NSObject<NSFastEnumeration>*(^objsFilterByPredicate)(NSPredicate* pred);
/** 'select' means not to modify original object */
@property LB_BK NSObject<NSFastEnumeration>*(^objsSelectByPredicate)(NSPredicate* pred);
@property LB_BK NSObject<NSFastEnumeration>*(^objsSelectByPredicateString)(NSString* pred);

#warning <#message#>
///MARK: These API are for collection type.
@property LB_BK NSObject*  (^objsAddItem)(id item);
@property LB_BK NSObject*  (^objsRemoveAllItem)(void);
///MARK: Index-able collection.
//@property LB_BK NSObject*  (^objsItemAt)(NSUInteger idx);
/** ...objsIndexOfItemAs().anUnsignedIntegerNumber... */
//@property LB_BK NSNumber*  (^objsIndexOfItemAs)(id item);
@property LB_BK NSObject*  (^objsLastItem)(void);
@property LB_BK NSObject*  (^objsFirstItem)(void);
///MARK: Key-able collection.
//@property LB_BK NSObject*  (^objsItemForKey)(id key);
//@property LB_BK NSObject*  (^objsSetItemForKey)(id item,id key);


/**
 self   ∈   {
    .responseToSelector(
        count,
        length
    )
 }
 Return @(NSNotFound) if not response to sel.
 */
@property LB_BK NSNumber*    (^objLengthAs)(void);
@property LB_BK NSUInteger   (^objLength)(void);
/** As weall as objLength */
@property LB_BK NSUInteger   (^objCount)(void);


#pragma mark - LinkBlock

/**
 *  Extend keyPath for [setValue:forKeyPath:].Provides access to key-value pairs of structures.
 *  Use operator '->' to access structure member in 'fullPath',else 'fullPath' is the same as keyPath.
 *  exp: @"view.nickNameLable.frame->size->width"
 */
@property LB_BK NSObject*    (^objValueForFullPath)(NSString* fullPath);
/** Refer to : objValueForFullPath */
@property LB_BK NSObject*    (^objSetValueForFullPath)(id value, NSString* fullPath);
/** search is ignoring Case  */
@property LB_BK NSObject*    (^objSetValueForKeyByMatch)(id value, NSString* matchKey);
/** set value for all matched key by regex */
@property LB_BK NSObject*    (^objSetValueForKeyByRegex)(id value, NSString* regexOfKey);
/**
 <^NSNumber*(NSString* keyPath,NSString* predicateFormat,...)>
 Refer to : objEvaluatePredicateAs
 */
@property LB_BK NSNumber*    (^objEvaluateValueForKeyPathAs)(NSString* keyPath,NSString* predicateFormat,...);
/** <^BOOL(NSString* keyPath,NSString* predicateFormat,...)> */
@property LB_BK BOOL         (^objEvaluateValueForKeyPath)(NSString* keyPath,NSString* predicateFormat,...);
/**
 <^NSObject*(id value, NSString* keyPath,NSString* predicateFormat,...)>
 If self matched by predicate call setValue:forkeyPath:
 Refer to : objEvaluatePredicateAs.
 */
@property LB_BK NSObject*    (^objSetValueForKeyPathWhenEvaluated)(id value, NSString* keyPath,NSString* predicateFormat,...);
/**
 *  Set screen size,width,height by FullPath.(Fullpath refer to: objValueForFullPath.)
 *  -
 *  width : "view.frame->size->width" , "label.myWidth0" ,...
 *  height: "label.y" , "label.myBottom" ,...
 *  size  : unclearKey , "mySize"
 *  -
 *  Discussion:
 *  1.When fullPath is for struct that contains '->':
 *  Set to height when last component of keyPath is euqual to one of {height,y,vertical,top,bottom},otherwise width.
 *  2.When fullpath is normal keyPath(Ignoring Case):
 *  Set height if last component of keyPath is contains one of {height,y,vertical,top,bottom} or euqal to y'.If not contains 'width' that will set to size,otherwise set to width.
 *  In a word : width > height > size.
 */
@property LB_BK NSObject*    (^objSetScreenValueForFullPath)(NSString* fullPath);


/** !Print object as json string */
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
/** Determine if is Foundation type */
+ (BOOL)classIsFoundation;
+ (BOOL)classContainProperty:(NSString*)property;
+ (BOOL)classContainIvar:(NSString*)ivarName;
+ (NSArray<NSString*>*)classGetIvarList;
+ (NSArray<NSString*>*)classGetPropertyList;
/** reference:property type encodings;<(NSString*)key> */
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


#pragma mark - Link
@property LB_FN id             linkEnd;
@property LB_FN NSArray*       linkEnds;
@property LB_BK id             (^linkEndsAt)(NSUInteger idx);

@property LB_BK NSObject*      (^linkPush)(id obj);
@property LB_BK NSObject*      (^linkPop)(void);
@property LB_BK NSObject*      (^linkSelect)(NSString* predicate,...);
@property LB_BK NSObject*      (^linkLoop)(NSUInteger count);

@property LB_BK NSObject*      (^linkIf)(BOOL condition);
@property LB_FN NSObject*      linkElse;
@property LB_FN NSObject*      linkReturn;

#pragma mrak - Link Punctuate/断句

/**
 Link Punctuate
 This is a comment used to punctuate linkBlock when linkBlock state has changed.
 Link Punctuate will do noting, it just return self.
*/

/**
 ...XXXXAsWhatSet(valueSet).whatSet...;
 after function 'XXXXAsWhatSet' the 'whatSet' is indicate link object be replaced by valueSet.
 */
@property LB_FN NSObject*      whatSet;

/**
 指示链条的类型
 Indicate the state of link has changed.
 ...linkPush(~).linkPush(~).thisLinkObjs...
 */
@property LB_FN LinkGroup*     thisLinkObjs;
@property LB_FN NSObject*      thisLinkObj;

/**
 指示链条对象已经由返回值替换
 'thisXXXX' indicate that the link object has changed since the last call;
 */
@property LB_FN NSObject*      thisValue;
@property LB_FN NSObject*      thisValues;
@property LB_FN NSNumber*      thisNumber;

/**
 指示NSNumber的本身类型
 ...numIsOddAs().aBOOLValue.boolValue
 Use 'aXXX' after 'XXXAs' to indicate that What the specific type of NSNumber
 */
@property LB_FN NSNumber*      aBOOLValue;
@property LB_FN NSNumber*      aFloatNumber;
@property LB_FN NSNumber*      aDoubleNumber;
@property LB_FN NSNumber*      anIntNumber;
@property LB_FN NSNumber*      anIntegerNumber;
@property LB_FN NSNumber*      anUnsignedIntNumber;
@property LB_FN NSNumber*      anUnsignedIntegerNumber;
@property LB_FN NSNumber*      aLongNumber;
@property LB_FN NSNumber*      aLongLongNumber;
@property LB_FN NSNumber*      aUnsignedLongNumber;
@property LB_FN NSNumber*      aUnsignedLongLongNumber;
@property LB_FN NSValue*       aCGRectValue;
@property LB_FN NSValue*       aCGSizeValue;
@property LB_FN NSValue*       aCGPointValue;
@property LB_FN NSValue*       aNSRangeValue;



- (NSObject*)linkInBlock:(void(^)(NSObject* link))block;
- (NSObject*)linkAsy_main_queue:(void(^)(NSObject* link))block;
- (NSObject*)linkAsy_global_queue:(void(^)(NSObject* link))block;

/**
 Perform the specified number of times to link/重复执行
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


#pragma mark - DynamicLink/脚本解析
/**
 End with "nil,NSNotFond" in linkBlock for structures
 */
@property LB_BK NSObject*  (^linkEvalCode)(NSString* code , ...);

//MARK: force type declaration/强制类型声明
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



NS_INLINE id _LB_MakeObj(id object){
    return object?object:[LinkError new];
}
/**
 need to end with nil
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
