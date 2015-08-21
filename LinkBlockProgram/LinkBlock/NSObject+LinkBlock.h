//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(LinkBlock)
/** Not set LinkError for you */
@property (nonatomic,copy) NSObject*    (^setTo)(id* toValue);
/** Using at the end of chain to get value of real type. */
@property (nonatomic,copy) id           (^end)();
/** 强制获取一个类型的值，失败则返回该类型的初始化对象 */
/** Force an object to get value of the specified type , failure returns the type of new object  */
@property (nonatomic,copy) NSObject*    (^typeForceObj)(Class theCalss);
@property (nonatomic,copy) NSObject*    (^nslog)();

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
- (void)objBlockSet:(NSString*)name executeBlock:(id(^)())executeBlock;
- (id(^)())objBlockGet:(NSString*)name;
- (void)objBlockRemove:(NSString*)name;
/**  return value: the block return value */
- (id)objBlockExecute:(NSString*)name;

/** 不能调用 */
/** unavailable */
- (void)novoExecuteEventForSender:(id)target;

@end

