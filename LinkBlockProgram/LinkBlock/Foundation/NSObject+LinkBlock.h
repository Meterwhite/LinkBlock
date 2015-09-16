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
/** Do not give LinkError for you */
@property (nonatomic,copy) NSObject*    (^set)(id* toValue);
/** Using at the end of chain to get value of real type. */
@property (nonatomic,copy) id           (^end)();
/** 强制获取一个类型的值，失败则返回该类型的初始化对象 */
/** Force an object to get value of the specified type , failure returns the type of new object  */
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
/** KVC safely. Non- efficient */
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
+ (BOOL)currentClassContainProperty:(NSString*)property;
/** 当前类型是否包含成员变量（_value）不包括父类 */
+ (BOOL)currentClassContainIvar:(NSString*)ivarName;
/** 获取当前类型的属性名列表（@property value） */
+ (NSArray*)classGetIvarList;
/** 获取当前类型的成员变量名列表 */
+ (NSArray*)classGetPropertyList;

#pragma mark - NSObject
@property (nonatomic,copy) NSObject*    (^objCopy)();
@property (nonatomic,copy) NSObject*    (^objMutableCopy)();
@property (nonatomic,copy) BOOL         (^objIsEqual)(NSObject* obj);
@property (nonatomic,copy) NSString*    (^objToJsonString)();



/** 增加一个block到对象 */
/** Add a block to the object  */
- (void)objBlockSet:(NSString*)name block:(id(^)())executeBlock;
- (id(^)())objBlockGet:(NSString*)name;
- (void)objBlockRemove:(NSString*)name;
/**  return value: the block return value */
- (id)objBlockExecute:(NSString*)name;



#pragma mark - Appoint type quickly（快速指定类型
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



- (void)novoExecuteEventForSender:(id)target __deprecated_msg("This method is private");
@end