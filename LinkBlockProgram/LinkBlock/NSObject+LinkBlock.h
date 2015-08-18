//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(LinkBlock)
@property (nonatomic,copy) NSObject*    (^blockValueTo)(id* toValue);
@property (nonatomic,copy) NSObject*    (^blockCopy)();
@property (nonatomic,copy) NSObject*    (^blockMutableCopy)();
@property (nonatomic,copy) BOOL         (^blockIsEqual)(NSObject* obj);
@property (nonatomic,copy) BOOL         (^blockIsKindOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^blockIsSubClassOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^blockIsResponseSEL)(SEL theSEL);
/** 强制获取一个类型的值，失败则返回该类型的初始化对象 */
/** Force an object to get value of the specified type , failure returns the type of new object  */
@property (nonatomic,copy) NSObject*    (^blockTypeKeep)(Class theCalss);
@property (nonatomic,copy) NSString*    (^blockToJsonString)();
@property (nonatomic,copy) Class        (^blockClass)();
@property (nonatomic,copy) NSString*    (^blockClassName)();
@property (nonatomic,copy) NSString*    (^blockToString)();
@property (nonatomic,copy) NSObject*    (^blockNSLog)();

/** 增加一个block到对象 */
/** Add a block to the object  */
- (void)blockBlockSet:(NSString*)name executeBlock:(id(^)())executeBlock;
- (id(^)())blockBlockGet:(NSString*)name;
- (void)blockBlockRemove:(NSString*)name;
/**  return value: the block return value */
- (id)blockBlockExecute:(NSString*)name;

/** 不能调用 */
/** unavailable */
- (void)novoExecuteEventForSender:(id)target;
@end

