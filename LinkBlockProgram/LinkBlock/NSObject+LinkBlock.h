//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject(LinkBlock)
/** Not set LinkError for you */
@property (nonatomic,copy) NSObject*    (^set)(id* toValue);
/** Using at the end of chain to get value of real type. */
@property (nonatomic,copy) id           (^end)();
/** 强制获取一个类型的值，失败则返回该类型的初始化对象 */
/** Force an object to get value of the specified type , failure returns the type of new object  */
@property (nonatomic,copy) NSObject*    (^typeForceObj)(Class theCalss);
@property (nonatomic,copy) NSObject*    (^nslog)();
/** KVC */
@property (nonatomic,copy) id           (^valueGet)(NSString* key);
/** KVC */
@property (nonatomic,copy) NSObject*    (^valueSet)(NSString* key, id value);
/** KVC */
@property (nonatomic,copy) id           (^valuePathGet)(NSString* key);
/** KVC */
@property (nonatomic,copy) NSObject*    (^valuePathSet)(NSString* key, id value);

@property (nonatomic,copy) NSObject*    (^objCopy)();
@property (nonatomic,copy) NSObject*    (^objMutableCopy)();
@property (nonatomic,copy) BOOL         (^objIsEqual)(NSObject* obj);
@property (nonatomic,copy) BOOL         (^objIsKind)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^objIsSubClassOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^objIsResponseSEL)(SEL theSEL);

@property (nonatomic,copy) NSString*    (^objToJsonString)();
@property (nonatomic,copy) Class        (^objClass)();
@property (nonatomic,copy) NSString*    (^objClassName)();
@property (nonatomic,copy) NSString*    (^objToString)();


/** 增加一个block到对象 */
/** Add a block to the object  */
- (void)objBlockSet:(NSString*)name block:(id(^)())executeBlock;
- (id(^)())objBlockGet:(NSString*)name;
- (void)objBlockRemove:(NSString*)name;
/**  return value: the block return value */
- (id)objBlockExecute:(NSString*)name;


#pragma mark - quick use type（快速类型
@property (nonatomic,copy) NSString*                    (^typeIsNSString)();
@property (nonatomic,copy) NSMutableString*             (^typeIsNSMutableString)();

@property (nonatomic,copy) NSArray*                     (^typeIsNSArray)();
@property (nonatomic,copy) NSMutableArray*              (^typeIsNSMutableArray)();

@property (nonatomic,copy) NSDictionary*                (^typeIsNSDictionary)();
@property (nonatomic,copy) NSMutableDictionary*         (^typeIsNSMutableDictionary)();

@property (nonatomic,copy) NSAttributedString*          (^typeIsNSAttributedString)();
@property (nonatomic,copy) NSMutableAttributedString*   (^typeIsNSMutableAttributedString)();

@property (nonatomic,copy) UIView*                      (^typeIsUIView)();
@property (nonatomic,copy) UILabel*                     (^typeIsUILabel)();
@property (nonatomic,copy) UIControl*                   (^typeIsUIControl)();
@property (nonatomic,copy) UIButton*                    (^typeIsUIButton)();
@property (nonatomic,copy) UIScrollView*                (^typeIsUIScrollView)();
@property (nonatomic,copy) UIImageView*                 (^typeIsUIImageView)();

@property (nonatomic,copy) UIImage*                     (^typeIsUIImage)();
@property (nonatomic,copy) UIColor*                     (^typeIsUIColor)();



- (void)novoExecuteEventForSender:(id)target __deprecated_msg("This method is private");
@end

