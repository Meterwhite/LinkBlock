//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(LinkBlock)
#pragma mark - 方式
/** 获取链条返回值，并将链条信息对象和错误转nil */
@property (nonatomic,copy,readonly) id           (^end)();
/** 多对象链式编程获取多个链条返回值，并将错误转nil */
@property (nonatomic,copy,readonly) NSArray*     (^ends)();
/** 多对象链式编程获取某一链条返回值，并将错误转nil */
@property (nonatomic,copy,readonly) id           (^endsAt)(NSUInteger idx);
/** 将当前对象赋值到变量 */
@property (nonatomic,copy,readonly) NSObject*    (^setTo)(id* toObject);
/** 使新对象加入链条 */
@property (nonatomic,copy,readonly) NSObject*    (^linkAnd)(id obj);
/** 使多链条中移除一个 */
@property (nonatomic,copy,readonly) NSObject*    (^linkOut)(NSUInteger idx);
/** 取出多链条中一个 */
@property (nonatomic,copy,readonly) NSObject*    (^linkAt)(NSUInteger idx);
/** 使其后的链条执行多次 */
@property (nonatomic,copy,readonly) NSObject*    (^linkLoop)(NSUInteger count);
/** 链条分支，返回源对象，在链条内处理新分支 */
- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink;

#pragma mark - 功能
/** NSLog() */
@property (nonatomic,copy,readonly) NSObject*    (^nslog)();
/** 输出对象前增加标识语 */
@property (nonatomic,copy,readonly) NSObject*    (^nslogTitle)(NSString* title);
/** 将对象以字典的形式进行打印 */
@property (nonatomic,copy,readonly) NSObject*    (^po)();
/** 将对象以字典的形式进行打印，其中对所有容器类型进行遍历转换 */
@property (nonatomic,copy,readonly) NSObject*    (^poDeep)();
/** 输出对象Key对应的值 */
@property (nonatomic,copy,readonly) NSObject*    (^nslogValueForKey)(NSString* key);
@property (nonatomic,copy,readonly) NSObject*    (^nslogValueForKeyPath)(NSString* key);

#pragma mark - Runtime
@property (nonatomic,copy,readonly) id           (^valueForKey)(NSString* key);
@property (nonatomic,copy,readonly) NSObject*    (^setValueForKey)(id value,NSString* key);
@property (nonatomic,copy,readonly) id           (^valueForKeyPath)(NSString* key);
@property (nonatomic,copy,readonly) NSObject*    (^setValueForKeyPath)(id value,NSString* key);
@property (nonatomic,copy,readonly) id           (^valueForKeySafe)(NSString* key);
@property (nonatomic,copy,readonly) NSObject*    (^setValueForKeySafe)(id value,NSString* key);
@property (nonatomic,copy,readonly) id           (^valueForKeyPathSafe)(NSString* key);
@property (nonatomic,copy,readonly) NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key);

@property (nonatomic,copy,readonly) BOOL         (^isKindOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy,readonly) BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy,readonly) BOOL         (^isRespondsSEL)(SEL theSEL);
@property (nonatomic,copy,readonly) NSString*    (^className)();
@property (nonatomic,copy,readonly) NSString*    (^superclassName)();

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
 *  获取当前类型及父类的属性名列表（@property value）
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

#pragma mark - NSObject
@property (nonatomic,copy,readonly) NSObject*    (^objCopy)();
@property (nonatomic,copy,readonly) NSObject*    (^objMutableCopy)();
/**
 *  对象及可能包含的子对象全部转为json相关的可变类型
 * （NSMutableArray,NSMutableDictionary,NSMutableString）
 */
@property (nonatomic,copy,readonly) NSObject*    (^objMutableCopyDeep)();
@property (nonatomic,copy,readonly) BOOL         (^objIsEqual)(NSObject* obj);
@property (nonatomic,copy,readonly) BOOL         (^objIsEqualToEach)(NSObject* obj,...);
@property (nonatomic,copy,readonly) BOOL         (^objIsEqualToEachInArray)(NSArray* arr);
@property (nonatomic,copy,readonly) BOOL         (^objIsEqualToSomeone)(NSObject* obj,...);
@property (nonatomic,copy,readonly) BOOL         (^objIsEqualToSomeoneInArray)(NSArray* arr);

/** NSDate,NSString,NSArray,NSDictionary等对象转成json的字符串 */
@property (nonatomic,copy,readonly) NSString*    (^objToJsonString)();
/**
 *  将当前对象转字典（如果对象为容器类型则对值进行一次转换）
 *  includeFoundationProperty：是否包含基础类型的属性
 */
@property (nonatomic,copy,readonly) NSDictionary*(^objToNSDictionary)(BOOL includeFoundation);
/**
 *  对象转字典（对所有属性进行层次遍历，对容器对象的值也是）
 *  includeFoundationProperty：是否包含基础类型的属性
 */
@property (nonatomic,copy,readonly) NSDictionary*(^objToNSDictionaryDeep)(BOOL includeFoundation);

/** 在数组中的前一个元素，无返回nil */
@property (nonatomic,copy,readonly) NSObject*    (^objBeforeInArr)(NSArray* inArr);
/** 在数组中的后一个元素无返回nil */
@property (nonatomic,copy,readonly) NSObject*    (^objNextInArr)(NSArray* inArr);
@property (nonatomic,copy,readonly) NSArray*     (^objKeysInDict)(NSDictionary* inDict);
/** 必须获取该类型的对象，若类型不符则返回该类型的初始化对象 */
@property (nonatomic,copy,readonly) NSObject*    (^objMustType)(Class theCalss);


/** 指定对象的类型，避免链条中需要类型强转时 */
//Foundation
@property (nonatomic,copy,readonly) NSString*                    (^ofNSString)();
@property (nonatomic,copy,readonly) NSMutableString*             (^ofNSMutableString)();
@property (nonatomic,copy,readonly) NSArray*                     (^ofNSArray)();
@property (nonatomic,copy,readonly) NSMutableArray*              (^ofNSMutableArray)();
@property (nonatomic,copy,readonly) NSDictionary*                (^ofNSDictionary)();
@property (nonatomic,copy,readonly) NSMutableDictionary*         (^ofNSMutableDictionary)();
@property (nonatomic,copy,readonly) NSAttributedString*          (^ofNSAttributedString)();
@property (nonatomic,copy,readonly) NSMutableAttributedString*   (^ofNSMutableAttributedString)();
@property (nonatomic,copy,readonly) NSURL*                       (^ofNSURL)();
@property (nonatomic,copy,readonly) NSUserDefaults*              (^ofNSUserDefaults)();
@property (nonatomic,copy,readonly) NSNumber*                    (^ofNSNumber)();
@property (nonatomic,copy,readonly) NSValue*                     (^ofNSValue)();
@property (nonatomic,copy,readonly) UIImage*                     (^ofUIImage)();
@property (nonatomic,copy,readonly) NSDate*                      (^ofNSDate)();
@property (nonatomic,copy,readonly) NSData*                      (^ofNSData)();
//UIKit
@property (nonatomic,copy,readonly) UIView*                      (^ofUIView)();
@property (nonatomic,copy,readonly) UILabel*                     (^ofUILabel)();
@property (nonatomic,copy,readonly) UIControl*                   (^ofUIControl)();
@property (nonatomic,copy,readonly) UIButton*                    (^ofUIButton)();
@property (nonatomic,copy,readonly) UIScrollView*                (^ofUIScrollView)();
@property (nonatomic,copy,readonly) UIImageView*                 (^ofUIImageView)();
@property (nonatomic,copy,readonly) UITableView*                 (^ofUITableView)();
@property (nonatomic,copy,readonly) UIColor*                     (^ofUIColor)();
@property (nonatomic,copy,readonly) UIViewController*            (^ofUIViewController)();
@property (nonatomic,copy,readonly) UITextField*                 (^ofUITextField)();
@property (nonatomic,copy,readonly) UITextView*                  (^ofUITextView)();
@property (nonatomic,copy,readonly) UIWebView*                   (^ofUIWebView)();
@end