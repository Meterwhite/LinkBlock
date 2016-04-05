//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(LinkBlock)
#pragma mark - Coding ways
/** 将对象赋值到变量 */
@property (nonatomic,copy) NSObject*    (^setTo)(id* toObject);
@property (nonatomic,copy) id           (^end)();
/** 强制获取一个类型的值，失败则返回该类型的初始化对象 */
@property (nonatomic,copy) NSObject*    (^typeForceObj)(Class theCalss);
@property (nonatomic,copy) NSObject*    (^nslog)();
/** 控制台输出对象前增加标识话语 */
@property (nonatomic,copy) NSObject*    (^nslogTitle)(NSString* title);

#pragma mark - Runtime
@property (nonatomic,copy) id           (^valueForKey)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKey)(id value,NSString* key);
@property (nonatomic,copy) id           (^valueForKeyPath)(NSString* key);
@property (nonatomic,copy) NSObject*    (^setValueForKeyPath)(id value,NSString* key);
/** 安全的使用KVC，非高效率的 */
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
 *  属性是getter和setter方法的称谓，成员变量才是正真的变量。
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


#pragma mark - 快速指定类型，减少类型强制转换代码步骤
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


@property (nonatomic,copy) UIView*                      (^typeIsUIView)();
@property (nonatomic,copy) UILabel*                     (^typeIsUILabel)();
@property (nonatomic,copy) UIControl*                   (^typeIsUIControl)();
@property (nonatomic,copy) UIButton*                    (^typeIsUIButton)();
@property (nonatomic,copy) UIScrollView*                (^typeIsUIScrollView)();
@property (nonatomic,copy) UIImageView*                 (^typeIsUIImageView)();
@property (nonatomic,copy) UITableView*                 (^typeIsUITableView)();
@property (nonatomic,copy) UIImage*                     (^typeIsUIImage)();
@property (nonatomic,copy) UIColor*                     (^typeIsUIColor)();
@property (nonatomic,copy) UIViewController*            (^typeIsUIViewController)();



@end