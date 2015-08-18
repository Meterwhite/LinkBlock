//
//  NSObject+LinkBlock.h

//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(LinkBlock)
@property (nonatomic,copy) NSObject*    (^blockCopy)();
@property (nonatomic,copy) NSObject*    (^blockMutableCopy)();
@property (nonatomic,copy) BOOL         (^blockIsEqual)(NSObject* obj);
@property (nonatomic,copy) BOOL         (^blockIsKindOf)( __unsafe_unretained Class classKind);
@property (nonatomic,copy) BOOL         (^blockIsSubClassOf)( __unsafe_unretained Class classKind);
/** 响应方法 */
@property (nonatomic,copy) BOOL         (^blockIsResponseSEL)(SEL theSEL);
/** 一个对象获取强类型的值，失败则返回该类型的初始化对象 */
@property (nonatomic,copy) NSObject*    (^blockTypeKeep)(Class theCalss);
@property (nonatomic,copy) NSString*    (^blockToJsonString)();
@property (nonatomic,copy) Class        (^blockClass)();
@property (nonatomic,copy) NSString*    (^blockClassName)();

- (void)blockSetBlockWithName:(NSString*)name executeBlock:(id(^)())executeBlock;
- (id(^)())blockGetBlockWithName:(NSString*)name;
- (id)blockExecuteBlockWithName:(NSString*)name;
- (id)blockRemoveBlockWithName:(NSString*)name;

/** 私有扩展方法，不应调用 */
- (void)novoExecuteEventForSender:(id)target;
@end

