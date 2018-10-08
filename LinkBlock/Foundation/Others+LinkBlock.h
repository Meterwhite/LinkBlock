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
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContain");

LBDeclare BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContains替代");

LBDeclare NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrObjsOfType替代");

LBDeclare BOOL     (^strIsContainEmoji)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContainEmoji替代");

LBDeclare NSNumber* (^strIsContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContainEmojiAs替代");

LBDeclare UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "use attr_strDrawToImgAsWhatSet替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "use -[* linkInBlock]替代-[* newLink]");

LBDeclare NSMutableArray*      (^arrAddTo)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrAddToArr替代");

LBDeclare id           (^valueForKey)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKey代替");

LBDeclare NSObject*    (^setValueForKey)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKey代替");

LBDeclare id           (^valueForKeyPath)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPath)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKeyPath代替");

LBDeclare id           (^valueForKeySafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKey代替");

LBDeclare NSObject*    (^setValueForKeySafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKey代替");

LBDeclare id           (^valueForKeyPathSafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKeyPath代替");

LBDeclare BOOL         (^isKindOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKindOf代替");

LBDeclare NSNumber*    (^isKindOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKindOf_n代替");

LBDeclare BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubClassOf代替");

LBDeclare NSNumber*    (^isSubClassOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubClassOf_n代替");

LBDeclare BOOL         (^isRespondsSEL)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsRespondsSEL代替");

LBDeclare NSNumber*    (^isRespondsSEL_n)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsRespondsSEL_n代替");

LBDeclare NSString*    (^className)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objClassName代替");

LBDeclare NSString*    (^superclassName)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSuperclassName代替");

LBDeclare NSObject*    (^setTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare NSObject*    (^objSetTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSObject*    (^objValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetRandom...代替");

LBDeclare NSObject*    (^objSetDelegate)(id delegate)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKdelegate代替");

LBDeclare NSObject*    (^objBOOLNegationForKey)(NSString * key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objReverseValueForKey代替");

LBDeclare UIImage*         (^imgBlur)(float percent)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgBlurXXX代替");

LBDeclare UILabel*         (^labAlignTop)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare UILabel*         (^labAlignBottom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSMutableArray*  (^arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrInsertNext");

LBDeclare NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrInsertNext");

LBDeclare UIView*      (^viewMasksToBounds)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "use viewClipsToBounds代替");

LBDeclare NSObject*    (^nslogTitle)(NSString* title)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclareG(poDetail) NSObject*    (^poNoDeep)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use po() instead；dol po() rename to poDetail()");

LBDeclare NSObject*    (^logInfo)(NSString* info)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSInteger    (^strLinesCountAboutView)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strUILinesCount");

LBDeclare NSString*    (^strSubToLineAboutView)(NSInteger toLine, CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strSubToUILine");

LBDeclare NSRange (^strSubRangeToMaxLineIfAppendStrAboutView )(NSUInteger maxLine , CGFloat maxWidth, NSString* ifAppendStr ,NSDictionary<NSAttributedStringKey,id>* attrDict , BOOL* isFullOfLines)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strSubRangeToMaxUILineIfAppendStr");

LBDeclare void*  (^numValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "not safe");

LBDeclare NSValue* (^valueCGSizeSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSValue* (^valueCGPointSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare UIView*      (^viewSetFrameOfCGRect)(CGRect frame)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetFrameVal");

LBDeclare UIView*      (^viewSetOriginOfCGPoint)(CGPoint origin)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetOriginVal");

LBDeclare UIView*      (^viewSetCenterOfCGPoint)(CGPoint center)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetCenterVal");

LBDeclare UIView*      (^viewSetSizeOfCGSize)(CGSize size)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetSizeVal");

LBDeclare UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to viewConvertSuperviewTo");

LBDeclare NSMutableArray*      (^viewFindSubviews)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewFindSubviewsOfClass");

LBDeclare NSMutableString*     (^m_strAppenStr)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to m_strAppend");

- (BOOL (^)(void))objIsMutableType
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objIsMutable");

LBDeclare NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_strReplace");

LBDeclare NSString*    (^strAppendObj)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strAppend");

LBDeclare NSObject*    (^objMutableCopyDeep)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objMutableCopyEnumerable");

LBDeclare NSObject*    (^objValuesRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetRandom... instead");
LBDeclare NSObject*    (^objValuesClean)(void);

LBDeclare NSObject*    (^objMustType)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare NSObject*    (^objAddToArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");
LBDeclare NSObject*    (^objRemoveFromArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");
LBDeclare NSObject*    (^objBeforeInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "use objGetPrevItemFromObjs");
LBDeclare NSObject*    (^objNextInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "use objGetNextItemFromObjs");
LBDeclare BOOL         (^objIsInArr)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjs");
LBDeclare BOOL         (^objIsInDictValues)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjs");
LBDeclare NSNumber*    (^objIsInDictValues_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjsAs");
LBDeclare NSNumber*    (^objIsInArr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjsAs");
LBDeclare BOOL         (^objIsInDictKeys)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKeyOfObjs");
LBDeclare NSNumber*    (^objIsInDictKeys_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKeyOfObjsAs");

LBDeclare NSObject*    (^objSetValueForKey_delegate)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKdelegate");
LBDeclare NSObject*    (^objSetValueForKey_dataSource)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKdataSource");
LBDeclare NSObject*    (^objSetValueForKey_text)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKtext");

LBDeclare NSObject*    (^objSetToDict)(NSMutableDictionary* dict, id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSString*        (^dateAstrology)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to dateToStrAstrologyzh_CN");//

LBDeclare NSNumber*    (^objIsKindOfNSString)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
LBDeclare NSNumber*    (^objIsKindOfNSArray)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
LBDeclare NSNumber*    (^objIsKindOfNSDictionary)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
LBDeclare NSNumber*    (^objIsKindOfUIView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
LBDeclare NSNumber*    (^objIsKindOfNSValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
LBDeclare NSNumber*    (^objIsKindOfNSNumber)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");

#pragma mark - subffix change
// special
LBDeclare NSValue* (^attr_strSizeWithOptions_n)(CGFloat maxWidth, NSStringDrawingOptions optoins)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*                (^arrContainIndex_n)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSValue* (^attr_strSize_n)(CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsKindOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsSubClassOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsMemberOfClass_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsRespondsSEL_n)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsEqualToEach_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsEqualToSomeone_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strIszh_CNInRange_n)(NSRange range)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSValue*     (^strSizeWithFontAndMaxWidth_n)(UIFont* font , CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSValue*     (^strSizeWithFontAndMaxSize_n)(UIFont* font, CGSize maxSize)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

// one
LBDeclare NSNumber*    (^arrContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^arrIndexOfObj_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*       (^attr_strIsEqualToAttrStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^dictGetBOOL_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsEqualToNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsGreatThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsGreatEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsLessThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsLessEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsEqual_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsEqualToEachInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsEqualToSomeoneInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strIsEqualStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclareG(strContainsAs) NSNumber*    (^strContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainsAs");
LBDeclare NSValue*     (^strSizeWithFont_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strHasPrefix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strHasSuffix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strRegexIsMatch_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclareG(numAsIndexToGetValueFromObj) NSNumber*(^numIndexIsInStringRange_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use numAsIndexToGetValueFromObj");
LBDeclare NSNumber*    (^strPredicateEvaluate_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

LBDeclare NSNumber*                (^arrKeyValueContain_n)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");


// none
LBDeclare NSNumber*        (^dateTimeIntervalSince1970_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateDay_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateHour_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateMinut_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*         (^dateSec_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*        (^dateIsLeapYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*        (^dateIsInToday_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*        (^dateIsInMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numHasDecimalValue_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsOdd_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsEven_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsNegative_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^numIsZero_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^objIsNSNull_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strContainzh_CN_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainszh_CNAs");
LBDeclare NSNumber*    (^strIsBlank_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strIsEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strLength_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclare NSNumber*    (^strIsNumber_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
LBDeclareG(strContainsEmojiAs) NSNumber*(^strContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainsEmojiAs");
LBDeclare NSNumber*    (^strPathFileExists_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

LBDeclareG(attr_strSetToControlAsWhatSet) NSObject*  (^attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "attr_strSetToControlAsWhatSet");
LBDeclareG(m_attr_strSetToControlAsWhatSet) NSObject* (^m_attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "m_attr_strSetToControlAsWhatSet");
LBDeclare NSObject*     (^objAddTo_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");


LBDeclare NSObject*     (^imgSetToImgView_linkTo)(id imgView)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

LBDeclare NSObject*     (^objRemoveFrom_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");


LBDeclare NSObject*     (^objInsertTo_linkTo)(id obj , NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

LBDeclare NSObject*     (^imgSetToBtnBGImg_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");
LBDeclare NSObject*     (^imgSetToBtn_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

LBDeclare NSObject*     (^strPathUnarchiveObject_linkTo)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");
LBDeclare NSObject*      (^attr_strDrawToImg_linkTo)(id image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

LBDeclare NSObject*    (^objPerformSelector_linkToReturnValue)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorAsWhatReturn");
LBDeclare NSObject*    (^objPerformSelectorWithArg_linkToReturnValue)(SEL sel , id arg)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorArgumentAsWhatReturn");
#ifndef objPerformSelectors_linkToReturnValues
#define objPerformSelectors_linkToReturnValues(sel,args...) objPerformSelectors_linkToReturnValues(sel,##args,nil)
#endif
LBDeclare NSArray*     (^objPerformSelectors_linkToReturnValues)(SEL sel0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorsAsWhatReturns");
#ifndef objPerformSelectorsWithArgs_linkToReturnValues
#define objPerformSelectorsWithArgs_linkToReturnValues(sel,args...) objPerformSelectorsWithArgs_linkToReturnValues(sel,##args,nil)
#endif
LBDeclare NSArray*     (^objPerformSelectorsWithArgs_linkToReturnValues)(SEL sel0 , NSArray* args0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformsSelectorArgumentsAsWhatReturns");

LBDeclareG(objPerformSelectorArgument) NSObject*    (^objPerformSelectorWithArg)(SEL sel,id arg)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorArgument");

#ifndef objPerformSelectorsWithArgs
#define objPerformSelectorsWithArgs(sel,args...) objPerformSelectorsWithArgs(sel,##args,nil)
#endif
LBDeclareG(objPerformsSelectorArguments) NSObject*    (^objPerformSelectorsWithArgs)(SEL sel0,NSArray* args0,...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformsSelectorArguments");

#pragma mark - 2018.10
LBDeclare NSObject*     (^strSetToTxtField_linkTo)(id txtField)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
LBDeclare NSObject*     (^strSetToTxtView_linkTo)(id txtView)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
LBDeclare NSObject*     (^strSetToBtn_linkTo)(id btn, NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
LBDeclare NSObject*     (^strSetToLab_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
LBDeclare BOOL         (^viewIsSubviewTo)(UIView* view)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewIsInView");
LBDeclare BOOL(^viewIsSuperviewTo)(UIView* view)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewContainsView");


LBDeclareG(viewBringFrontInSuperview) UIView* (^viewBringFrontInView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewBringFrontInSuperview");

LBDeclareG(viewSendBackInSuperview) UIView*(^viewSendBackInView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSendBackInSuperview");

LBDeclareG(viewPrevIndexView) UIView* (^viewBeforeIndexView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewPrevIndexView");

LBDeclareG(strContains) BOOL(^strContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strContains");

LBDeclareG(strContainsEmoji) BOOL(^strContainEmoji)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strContainsEmoji");

LBDeclare NSUInteger(^strLength)(void)
NS_DEPRECATED_IOS(2_0, 2_0, ".length");

LBDeclareG(viewSubviewsExclusiveTouch) UIView*(^viewSubiewsExclusiveTouch)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to viewSubviewsExclusiveTouch");

LBDeclareG(arrContains) BOOL(^arrContain)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContains");
LBDeclareG(arrContainsAs) NSNumber*(^arrContainAs)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContainsAs");

LBDeclareG(arrAddToArrAsWhatSet) NSMutableArray*(^arrAddToArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:AsWhatSet");

LBDeclareG(arrContainsIndex) BOOL(^arrContainIndex)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndex");
LBDeclareG(arrContainsIndexAs) NSNumber*(^arrContainIndexAs)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndexAs");

LBDeclare NSDictionary*            (^arrToDictByKeyNumber)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndexAs");
LBDeclare NSDictionary*            (^arrToDictByKeyString)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclareG(arrGetValuesIndexForValue) NSIndexSet*(^arrIndexSetOfValue)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetValuesIndexWithValue");

LBDeclare NSMutableArray*          (^arrObjsValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "depracated");

LBDeclareG(arrObjsWithKindOfClass) NSMutableArray*(^arrObjsOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrObjsWithKindOfClass");

LBDeclareG(arrGetPrevItemForObj) NSObject*(^arrBefore)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetPrevItemForObj");
LBDeclareG(arrGetNextItemForObj) NSObject*(^arrNext)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetNextItemForObj");

LBDeclareG(arrInsertObjBeforeTo) NSMutableArray*  (^arrInsertBefore)(id obj, id beforeTo)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrInsertObjBeforeTo");
LBDeclareG(arrInsertObjNextTo) NSMutableArray*  (^arrInsertNext)(id obj, id nextTo)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrInsertObjNextTo");
LBDeclareG(m_arrInsertObjBeforeTo) NSMutableArray*  (^m_arrInsertBefore)(id obj, id beforeObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename m_arrInsertObjBeforeTo");
LBDeclareG(m_arrInsertObjNextTo) NSMutableArray*  (^m_arrInsertNext)(id obj, id nexObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename m_arrInsertObjNextTo");

LBDeclareG(arrContainsKeyValue) BOOL(^arrKeyValueContain)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
LBDeclareG(arrContainsKeyValueAs) NSNumber*(^arrKeyValueContainAs)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
LBDeclareG(arrKeyValueMatchedObjs) NSMutableArray*(^arrKeyValueMatchObjs)(NSString* key,id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
LBDeclareG(arrKeyValuesMatchedObjs) NSMutableArray*(^arrKeyValuesMatchObjs)(NSDictionary<NSString*,id>* kv)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValuesMatchedObjs");
LBDeclare NSArray*                 (^arrSetValueForKey)(id value, NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");

LBDeclareG(m_arrReplaceWhenObjValueMatchedForKey) NSMutableArray*          (^m_arrTryReplaceObjByKey)(id obj,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceWhenObjValueMatchedForKey");
LBDeclareG(m_arrReplaceWhenObjsValueMatchedForKey) NSMutableArray*          (^m_arrTryReplaceObjsByKey)(NSArray* objs,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceWhenObjsValueMatchedForKey");

LBDeclareG(m_arrAddOrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^m_arrAddOrReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrAddOrReplaceWhenObjValueMatchedForKey");

LBDeclareG(m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt) NSMutableArray*(^m_arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt");

LBDeclareG(m_arrReplaceKeyForDictionaryItemDepth) NSMutableArray*(^m_arrReplaceKeyInDict)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceKeyForDictionaryItemDepth");


LBDeclareG(m_arrReplaceKeyForDictionaryItem) NSMutableArray*(^m_arrReplaceKeyInDictWithoutDeep)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceKeyForDictionaryItem");

LBDeclareG(arrReplaceKeyForDictionaryItemDepth) NSMutableArray*(^arrReplaceKeyInDict)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceKeyForDictionaryItemDepth");
LBDeclareG(arrReplaceKeyForDictionaryItem) NSMutableArray*(^arrReplaceKeyInDictWithoutDeep)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceKeyForDictionaryItem");

LBDeclareG(arrAddOrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^arrAddOrReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrAddOrReplaceWhenObjValueMatchedForKey");

LBDeclareG(arrInsertOrReplaceWhenObjValueMatchedForKeyAt) NSMutableArray*(^arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrInsertOrReplaceWhenObjValueMatchedForKeyAt");

LBDeclareG(arrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^arrTryReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceWhenObjValueMatchedForKey");

LBDeclareG(arrReplaceWhenObjsValueMatchedForKey) NSMutableArray*(^arrTryReplaceObjsByKey)(NSArray* objs , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceWhenObjsValueMatchedForKey");

LBDeclare NSDictionary*        (^dictObjsValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclare NSArray*     (^dictAllKeys)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare NSArray*     (^dictAllValues)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare BOOL         (^dictGetBOOL)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare NSNumber*    (^dictGetBOOLAs)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare id           (^dictGetNoNSNull)(id key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
LBDeclare NSTimeInterval   (^dateTimeIntervalSince1970)(void)
NS_DEPRECATED_IOS(2_0, 2_0, ".timeIntervalSince1970");

LBDeclareG(m_dictReplaceForKeyDepth) NSMutableDictionary* (^m_dictReplaceKey)(id key, id newKey);
LBDeclareG(m_dictReplaceForKey) NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id key, id newKey);

//LBDeclare NSMutableDictionary* (^dictUnionDict)(NSDictionary* dict);
LBDeclareG(m_dictAddEntries) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);
LBDeclareG(m_dictSetWithKeyObject) NSMutableDictionary* (^m_dictSetValue)(id key , id value);
LBDeclareG(dictObjectForKey) NSObject*    (^dictGet)(id key);
LBDeclareG(dictSetWithKeyObject) NSMutableDictionary* (^dictSetValue)(id key , id value);
LBDeclareG(dictReplaceForKeyDepth) NSMutableDictionary* (^dictReplaceKey)(id key, id newKey);
LBDeclareG(dictReplaceForKey) NSMutableDictionary* (^dictReplaceKeyWithoutDeep)(id key, id newKey);

LBDeclareG(dictContainsKey) BOOL(^dictContainKey)(id key);
LBDeclareG(dictContainsValue) BOOL(^dictContainValue)(id value);

LBDeclareG(dictContainsKey) BOOL         (^dictContaineKey)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainKey");
LBDeclareG(dictContainsValue) BOOL         (^dictContaineValue)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainValue");
LBDeclareG(dictContainsKeyAs) NSNumber*    (^dictContaineKey_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainAsWhatSet");
LBDeclareG(dictContainsValueAs) NSNumber*    (^dictContaineValue_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainValue_n");
LBDeclareG(m_arrAddObjOnlyOne) NSMutableArray*  (^m_arrAddObjNotContain)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to m_arrAddObjOnlyOne");

LBDeclareG(numToStrByMaxDecimalWidth) NSString*    (^numToStrMaxDigit)(NSUInteger maxDigit)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to numToStringByMaxDecimalWidth");

LBDeclare CGSize(^labTextSize)(NSNumber* maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

LBDeclareG(img_viewImageWithName) UIImageView*(^img_viewImageStr)(NSString* imageStr)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to img_viewImageWithName");

LBDeclareG(imgSetToContainerAsWhatSet) UIImageView*(^imgSetToImageViewAsWhatSet)(UIImageView* imgView)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");

LBDeclare UIButton*(^imgSetToButtonAsBGImageAsWhatSet)(UIButton* btn,UIControlState state)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");
LBDeclare UIButton*(^imgSetToButtonAsWhatSet)(UIButton* btn,UIControlState state)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");


LBDeclareG(colorSetToUIBackground) UIColor*(^colorSetToViewBG)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForBackground");
LBDeclareG(colorSetToUIBackground) UIColor*(^colorSetToViewsBG)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForBackground");
LBDeclareG(colorSetToUIText) UIColor*(^colorSetToLabText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
LBDeclareG(colorSetToUIText) UIColor*(^colorSetToTxtViewText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
LBDeclareG(colorSetToUIText) UIColor*(^colorSetToTxtFieldText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
LBDeclareG(colorSetToUIText) UIColor*(^colorSetToBtnTitle)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");

LBDeclareG(colorToHexStringWithPrefix) NSString*(^colorToHexStrByPrefix)(NSString* prefix)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorToHexStringWithPrefix");

//LBDeclare NSUInteger   (^strLengthComposedAndCustom)(NSString* customReg);
@end

