//
//  Others+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"


@interface NSObject(OtherLinkBlock)
LBDeclare BOOL (^arrIsContainer)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为arrContain");

LBDeclare BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContain替代");

LBDeclare NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrObjsOfType替代");

LBDeclare BOOL     (^strIsContainEmoji)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji替代");

LBDeclare NSNumber* (^strIsContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji_n替代");

LBDeclare UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "使用attr_strDrawToImg_linkTo替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "使用- linkInBlock替代- newLink");

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

LBDeclare NSString*    (^className)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objClassName代替");

LBDeclare NSString*    (^superclassName)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSuperclassName代替");

LBDeclare NSObject*    (^setTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetTo代替");

LBDeclare NSObject*    (^objValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValuesRandom代替");

LBDeclare NSObject*    (^objSetDelegate)(id delegate)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey_delegate代替");

LBDeclare NSObject*    (^objBOOLNegationForKey)(NSString * key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objReverseValueForKey代替");

LBDeclare UIImage*         (^imgBlur)(float percent)
NS_DEPRECATED_IOS(2_0, 2_0, "使用imgBlurXXX代替");

LBDeclare UILabel*         (^labAlignTop)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
LBDeclare UILabel*         (^labAlignBottom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableArray*  (^arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为arrInsertNext");

LBDeclare NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为m_arrInsertNext");

LBDeclare UIView*      (^viewMasksToBounds)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "使用viewClipsToBounds代替");

LBDeclare NSObject*    (^nslogTitle)(NSString* title)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSObject*    (^logInfo)(NSString* info)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSInteger    (^strLinesCountAboutView)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为strUILinesCount");

LBDeclare NSString*    (^strSubToLineAboutView)(NSInteger toLine, CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为strSubToUILine");

LBDeclare NSRange (^strSubRangeToMaxLineIfAppendStrAboutView )(NSUInteger maxLine , CGFloat maxWidth, NSString* ifAppendStr ,NSDictionary<NSAttributedStringKey,id>* attrDict , BOOL* isFullOfLines)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为strSubRangeToMaxUILineIfAppendStr");

LBDeclare void*  (^numValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃不安全的方法");

LBDeclare NSValue* (^valueCGSizeSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSValue* (^valueCGPointSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare UIView*      (^viewSetFrameOfCGRect)(CGRect frame)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为viewSetFrameVal");

LBDeclare UIView*      (^viewSetOriginOfCGPoint)(CGPoint origin)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为viewSetOriginVal");

LBDeclare UIView*      (^viewSetCenterOfCGPoint)(CGPoint center)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为viewSetCenterVal");

LBDeclare UIView*      (^viewSetSizeOfCGSize)(CGSize size)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为viewSetSizeVal");

LBDeclare UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为viewConvertSuperviewTo");

LBDeclare NSMutableArray*      (^viewFindSubviews)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为viewFindSubviewsOfClass");

LBDeclare NSMutableString*     (^m_strAppenStr)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为m_strAppend");

- (BOOL (^)(void))objIsMutableType
NS_DEPRECATED_IOS(2_0, 2_0, "更名为objIsMutable");

LBDeclare NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为m_strReplace");

LBDeclare NSString*    (^strAppendObj)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为strAppend");

LBDeclare NSObject*    (^objMutableCopyDeep)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为objMutableCopyEnumerable");

LBDeclare NSObject*    (^objValuesRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为objSetValuesRandom");

LBDeclare NSObject*    (^objMustType)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
@end

