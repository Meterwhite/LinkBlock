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
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmojiAs替代");

LBDeclare UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "使用attr_strDrawToImgAsWhatSet替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "使用-[* linkInBlock]替代-[* newLink]");

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
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的不安全的方法");

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
LBDeclare NSObject*    (^objAddToArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "多余的方法");
LBDeclare NSObject*    (^objRemoveFromArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "多余的方法");
LBDeclare NSObject*    (^objBeforeInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objGetPrevItemFromObjs");
LBDeclare NSObject*    (^objNextInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objGetNextItemFromObjs");
LBDeclare BOOL         (^objIsInArr)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubitemOfObjs");
LBDeclare BOOL         (^objIsInDictValues)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubitemOfObjs");
LBDeclare NSNumber*    (^objIsInArrAs)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubitemOfObjsAs");
LBDeclare NSNumber*    (^objIsInDictValuesAs)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubitemOfObjsAs");
//re name
//LBDeclare BOOL         (^objIsInDictKeys)(NSMutableDictionary* dict);
//LBDeclare NSNumber*    (^objIsInDictKeysAs)(NSMutableDictionary* dict);

LBDeclare NSObject*    (^objSetToDict)(NSMutableDictionary* dict, id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSString*        (^dateAstrology)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "更名为dateToStrAstrologyzh_CN");//

LBDeclare BOOL         (^dictContaineKey)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为dictContainKey");
LBDeclare BOOL         (^dictContaineValue)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为dictContainValue");
LBDeclare NSNumber*    (^dictContaineKey_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为dictContainAsWhatSet");
LBDeclare NSNumber*    (^dictContaineValue_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "修正为dictContainValue_n");

LBDeclare NSNumber*    (^objIsKindOfNSString)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");
LBDeclare NSNumber*    (^objIsKindOfNSArray)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");
LBDeclare NSNumber*    (^objIsKindOfNSDictionary)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");
LBDeclare NSNumber*    (^objIsKindOfUIView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");
LBDeclare NSNumber*    (^objIsKindOfNSValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");
LBDeclare NSNumber*    (^objIsKindOfNSNumber)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "增加后缀As");

#pragma mark - subffix change
// special
LBDeclare NSValue* (^attr_strSizeWithOptions_n)(CGFloat maxWidth, NSStringDrawingOptions optoins)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*                (^arrContainIndex_n)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSValue* (^attr_strSize_n)(CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsKindOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsSubClassOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsMemberOfClass_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsRespondsSEL_n)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsEqualToEach_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsEqualToSomeone_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strIszh_CNInRange_n)(NSRange range)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSValue*     (^strSizeWithFontAndMaxWidth_n)(UIFont* font , CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSValue*     (^strSizeWithFontAndMaxSize_n)(UIFont* font, CGSize maxSize)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");

// one
LBDeclare NSNumber*    (^arrContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^arrIndexOfObj_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*       (^attr_strIsEqualToAttrStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^dictGetBOOL_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsEqualToNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsGreatThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsGreatEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsLessThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsLessEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsEqual_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsEqualToEachInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsEqualToSomeoneInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsInArr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsInDictValues_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsInDictKeys_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strIsEqualStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSValue*     (^strSizeWithFont_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strHasPrefix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strHasSuffix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strRegexIsMatch_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIndexIsInStringRange_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strPredicateEvaluate_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");

#pragma mark - tow
LBDeclare NSNumber*                (^arrKeyValueContain_n)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");


// none
LBDeclare NSNumber*        (^dateTimeIntervalSince1970_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateDay_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateHour_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateMinut_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*         (^dateSec_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*        (^dateIsLeapYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*        (^dateIsInToday_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*        (^dateIsInMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numHasDecimalValue_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsOdd_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsEven_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsNegative_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^numIsZero_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^objIsNSNull_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strContainzh_CN_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strIsBlank_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strIsEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strLength_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strIsNumber_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");
LBDeclare NSNumber*    (^strPathFileExists_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_n已更新为As");

LBDeclare NSObject*     (^attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^m_attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^objAddTo_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^strSetToTxtField_linkTo)(id txtField)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^strSetToTxtView_linkTo)(id txtView)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^imgSetToImgView_linkTo)(id imgView)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^objRemoveFrom_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^strSetToLab_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");

LBDeclare NSObject*     (^objInsertTo_linkTo)(id obj , NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^strSetToBtn_linkTo)(id btn, NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^imgSetToBtnBGImg_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*     (^imgSetToBtn_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");

LBDeclare NSObject*     (^strPathUnarchiveObject_linkTo)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");
LBDeclare NSObject*      (^attr_strDrawToImg_linkTo)(id image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkTo已更新为AsWhatSet");

#ifndef objPerformSelector_linkToReturnValue
#define objPerformSelector_linkToReturnValue(sel,args...) objPerformSelector_linkToReturnValue(sel,##args,nil)
#endif
LBDeclare NSObject*    (^objPerformSelector_linkToReturnValue)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkToReturnValue已更新为AsWhatReturn");
#ifndef objPerformSelectorWithArg_linkToReturnValue
#define objPerformSelectorWithArg_linkToReturnValue(sel,args...) objPerformSelectorWithArg_linkToReturnValue(sel,##args,nil)
#endif
LBDeclare NSObject*    (^objPerformSelectorWithArg_linkToReturnValue)(SEL sel , id arg)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkToReturnValue已更新为AsWhatReturn");
#ifndef objPerformSelectors_linkToReturnValues
#define objPerformSelectors_linkToReturnValues(sel,args...) objPerformSelectors_linkToReturnValues(sel,##args,nil)
#endif
LBDeclare NSArray*     (^objPerformSelectors_linkToReturnValues)(SEL sel0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkToReturnValues已更新为AsWhatReturns");
#ifndef objPerformSelectorsWithArgs_linkToReturnValues
#define objPerformSelectorsWithArgs_linkToReturnValues(sel,args...) objPerformSelectorsWithArgs_linkToReturnValues(sel,##args,nil)
#endif
LBDeclare NSArray*     (^objPerformSelectorsWithArgs_linkToReturnValues)(SEL sel0 , NSArray* args0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "后缀名_linkToReturnValues已更新为AsWhatReturns");
@end

