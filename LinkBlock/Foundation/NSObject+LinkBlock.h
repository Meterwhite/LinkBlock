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
/** 末尾取值时调用过滤掉错误对象（LinkError），若中途发生类型错误结果返回nil */
@property (nonatomic,copy) id           (^end)();
/** 将当前对象赋值到其他变量， */
@property (nonatomic,copy) NSObject*    (^setTo)(id* toObject);
/** 链条分支，返回源对象，在链条内处理新分支 */
- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink;

/** 指定对象的类型，避免类型强转写法 */
//Foundation
@property (nonatomic,copy) NSString*                    (^typeIsNSString)();
@property (nonatomic,copy) NSMutableString*             (^typeIsNSMutableString)();
@property (nonatomic,copy) NSArray*                     (^typeIsNSArray)();
@property (nonatomic,copy) NSMutableArray*              (^typeIsNSMutableArray)();
@property (nonatomic,copy) NSDictionary*                (^typeIsNSDictionary)();
@property (nonatomic,copy) NSMutableDictionary*         (^typeIsNSMutableDictionary)();
@property (nonatomic,copy) NSAttributedString*          (^typeIsNSAttributedString)();
@property (nonatomic,copy) NSMutableAttributedString*   (^typeIsNSMutableAttributedString)();
@property (nonatomic,copy) NSURL*                       (^typeIsNSURL)();
@property (nonatomic,copy) NSUserDefaults*              (^typeIsNSUserDefaults)();
@property (nonatomic,copy) NSNumber*                    (^typeIsNSNumber)();
@property (nonatomic,copy) NSValue*                     (^typeIsNSValue)();
@property (nonatomic,copy) UIImage*                     (^typeIsUIImage)();
@property (nonatomic,copy) NSDate*                      (^typeIsNSDate)();
@property (nonatomic,copy) NSData*                      (^typeIsNSData)();
//UIKit
@property (nonatomic,copy) UIView*                      (^typeIsUIView)();
@property (nonatomic,copy) UILabel*                     (^typeIsUILabel)();
@property (nonatomic,copy) UIControl*                   (^typeIsUIControl)();
@property (nonatomic,copy) UIButton*                    (^typeIsUIButton)();
@property (nonatomic,copy) UIScrollView*                (^typeIsUIScrollView)();
@property (nonatomic,copy) UIImageView*                 (^typeIsUIImageView)();
@property (nonatomic,copy) UITableView*                 (^typeIsUITableView)();
@property (nonatomic,copy) UIColor*                     (^typeIsUIColor)();
@property (nonatomic,copy) UIViewController*            (^typeIsUIViewController)();
@property (nonatomic,copy) UITextField*                 (^typeIsUITextField)();
@property (nonatomic,copy) UITextView*                  (^typeIsUITextView)();

#pragma mark - 功能
/** 强制类型转换当前对象，失败则返回该类型的初始化对象 */
@property (nonatomic,copy) NSObject*    (^typeForceObj)(Class theCalss);
/** NSLog() */
@property (nonatomic,copy) NSObject*    (^nslog)();
/** 输出对象前增加标识语 */
@property (nonatomic,copy) NSObject*    (^nslogTitle)(NSString* title);
/** 输出对象Key对应的值 */
@property (nonatomic,copy) NSObject*    (^nslogValueForKey)(NSString* key);
@property (nonatomic,copy) NSObject*    (^nslogValueForKeyPath)(NSString* key);

#pragma mark - Runtime
@property (nonatomic,copy) id           (^valueForKey)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKey)(id value,NSString* key);
@property (nonatomic,copy) id           (^valueForKeyPath)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKeyPath)(id value,NSString* key);
/** 安全的使用KVC，低效率 */
@property (nonatomic,copy) id           (^valueForKeySafe)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKeySafe)(id value,NSString* key);
@property (nonatomic,copy) id           (^valueForKeyPathSafe)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key);

@property (nonatomic,copy) BOOL         (^isKindOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^isRespondsSEL)(SEL theSEL);
@property (nonatomic,copy) NSString*    (^className)();
@property (nonatomic,copy) NSString*    (^superclassName)();
/**
 *  属性是getter和setter方法的称谓，成员变量为存在字段
 *  如果不是手动设置了getter和setter方法，编译器会生成'_'加'PropertyName'的成员变量
 *  使用得到的IvarList是带'_'的名称
 */
/** 当前类型是否包含属性（@property value），不包括父类 */
+ (BOOL)classContainProperty:(NSString*)property;
/** 当前类型是否包含成员变量（_value）不包括父类 */
+ (BOOL)classContainIvar:(NSString*)ivarName;
/** 获取当前类型的属性名列表（@property value） */
+ (NSArray*)classGetIvarList;
/** 获取当前类型的成员变量名列表 */
+ (NSArray*)classGetPropertyList;
/** 获取实例和类方法名列表 */
- (NSArray*)objGetAllMethodList;
/** 获取实例方法名列表 */
- (NSArray*)objGetInstanceMethodList;
/** 获取类方法名列表 */
+ (NSArray*)classGetClassMethodList;
/** 获取协议名列表 */
+ (NSArray*)classGetProtocolList;

#pragma mark - NSObject
@property (nonatomic,copy) NSObject*    (^objCopy)();
@property (nonatomic,copy) NSObject*    (^objMutableCopy)();
@property (nonatomic,copy) BOOL         (^objIsEqual)(NSObject* obj);
/** 数组，字典等对象转成json的字符串 */
@property (nonatomic,copy) NSString*    (^objToJsonString)();
/** 无返回nil */
@property (nonatomic,copy) NSObject*    (^objBeforeInArr)(NSArray* inArr);
@property (nonatomic,copy) NSObject*    (^objNextInArr)(NSArray* inArr);
@property (nonatomic,copy) NSArray*     (^objKeysInDict)(NSDictionary* inDict);
@end