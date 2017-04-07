//
//  Others+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"


@interface NSObject(OtherLinkBlock)
LBDeclare id (^end)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEnd替代end()");

LBDeclare id (^ends)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEnds替代ends()");

LBDeclare id (^endsAt)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEndsAt(idx)替代endsAt(idx)");

LBDeclare BOOL (^arrIsContainer)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrContain替代");

LBDeclare BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContain替代");

LBDeclare NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrObjsOfType替代");

LBDeclare BOOL     (^strIsContainEmoji)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji替代");

LBDeclare NSNumber* (^strIsContainEmoji_n)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji_n替代");

LBDeclare UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "使用attr_strDrawToImg_linkTo替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "使用- linkInBlock替代- newLink");

LBDeclare NSMutableString*     (^SQLStr)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLInt)(NSInteger intVal)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLDouble)(double doubleVal)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLArr)(NSArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLDictKeys)(NSDictionary* dict)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLDictValues)(NSDictionary* dict)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLStrInStr)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLIntInStr)(NSInteger intVal)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQLDoubleInStr)(double doubleVal)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Select)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Where)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_From)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Create)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Update)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_InsertInto)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_ReplaceInto)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_And)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Or)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_In)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Distinct)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_As)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Like)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_Comma)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_InPair)(id val)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableString*     (^SQL_InvertedComma)(id val)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableArray*      (^arrAddTo)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrAddToArr替代");

LBDeclare id           (^valueForKey)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKey代替");

LBDeclare NSObject*    (^setValueForKey)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey代替");

LBDeclare id           (^valueForKeyPath)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPath)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKeyPath代替");

LBDeclare id           (^valueForKeySafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKey代替");

LBDeclare NSObject*    (^setValueForKeySafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey代替");

LBDeclare id           (^valueForKeyPathSafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKeyPath代替");

LBDeclare BOOL         (^isKindOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsKindOf代替");

LBDeclare NSNumber*    (^isKindOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsKindOf_n代替");

LBDeclare BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubClassOf代替");

LBDeclare NSNumber*    (^isSubClassOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubClassOf_n代替");

LBDeclare BOOL         (^isRespondsSEL)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsRespondsSEL代替");

LBDeclare NSNumber*    (^isRespondsSEL_n)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsRespondsSEL_n代替");

LBDeclare NSString*    (^className)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objClassName代替");

LBDeclare NSString*    (^superclassName)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSuperclassName代替");

LBDeclare NSObject*    (^setTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetTo代替");

LBDeclare NSObject*    (^objValueRandom)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValuesRandom代替");

LBDeclare NSObject*    (^objSetDelegate)(id delegate)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey_delegate代替");

LBDeclare NSObject*    (^objRemove)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objRemoveAll代替");

LBDeclare NSObject*    (^objBoolReverseForKey)(NSString * key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objBOOLNegationForKey代替");
@end


#pragma mark - SQL拼接部分
#define SQLNew ([NSMutableString new])
@interface NSMutableString (OtherLinkBlock)
/** 方便阅读 */
- (NSMutableString*)SQLUsing:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
#pragma mark - SQL拼接部分
- (NSMutableString*)SQLSelect:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLWhere:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLFrom:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLValues:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
/** 括号里的变量 */
- (NSMutableString*)SQLInPair:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLCreate:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLDelete:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLUpdate:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLReplaceInto:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLInsertInto:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLLike:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLIf:(BOOL)b
                    using:(void(^)(NSMutableString* makeSQL))block  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
- (NSMutableString*)SQLIf:(BOOL)b
                    using:(void(^)(NSMutableString* makeSQL))usingBlock
                elseUsing:(void(^)(NSMutableString* makeSQL))elseUsingBlock  NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
@end
