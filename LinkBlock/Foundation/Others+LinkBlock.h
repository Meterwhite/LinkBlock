//
//  Others+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"


@interface NSObject(OtherLinkBlock)
@property LB_BK BOOL (^arrIsContainer)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContain");

@property LB_BK BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContains替代");

@property LB_BK NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrObjsOfType替代");

@property LB_BK BOOL     (^strIsContainEmoji)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContainEmoji替代");

@property LB_BK NSNumber* (^strIsContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use strContainEmojiAs替代");

@property LB_BK UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "use attr_strDrawToImgAsWhatSet替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "use -[* linkInBlock]替代-[* newLink]");

@property LB_BK NSMutableArray*      (^arrAddTo)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrAddToArr替代");

@property LB_BK id           (^valueForKey)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKey代替");

@property LB_BK NSObject*    (^setValueForKey)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKey代替");

@property LB_BK id           (^valueForKeyPath)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKeyPath代替");

@property LB_BK NSObject*    (^setValueForKeyPath)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKeyPath代替");

@property LB_BK id           (^valueForKeySafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKey代替");

@property LB_BK NSObject*    (^setValueForKeySafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKey代替");

@property LB_BK id           (^valueForKeyPathSafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objValueForKeyPath代替");

@property LB_BK NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKeyPath代替");

@property LB_BK BOOL         (^isKindOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKindOf代替");

@property LB_BK NSNumber*    (^isKindOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKindOf_n代替");

@property LB_BK BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubClassOf代替");

@property LB_BK NSNumber*    (^isSubClassOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubClassOf_n代替");

@property LB_BK BOOL         (^isRespondsSEL)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsRespondsSEL代替");

@property LB_BK NSNumber*    (^isRespondsSEL_n)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsRespondsSEL_n代替");

@property LB_BK NSString*    (^className)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objClassName代替");

@property LB_BK NSString*    (^superclassName)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSuperclassName代替");

@property LB_BK NSObject*    (^setTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSObject*    (^objSetTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSObject*    (^objValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetRandom...代替");

@property LB_BK NSObject*    (^objSetDelegate)(id delegate)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetValueForKdelegate代替");

@property LB_BK NSObject*    (^objBOOLNegationForKey)(NSString * key)
NS_DEPRECATED_IOS(2_0, 2_0, "use objReverseValueForKey代替");

@property LB_BK UIImage*         (^imgBlur)(float percent)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgBlurXXX代替");

@property LB_BK UILabel*         (^labAlignTop)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK UILabel*         (^labAlignBottom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSMutableArray*  (^arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrInsertNext");

@property LB_BK NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrInsertNext");

@property LB_BK UIView*      (^viewMasksToBounds)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "use viewClipsToBounds代替");

@property LB_BK NSObject*    (^nslogTitle)(NSString* title)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BKG(poDetail) NSObject*    (^poNoDeep)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use po() instead；dol po() rename to poDetail()");

@property LB_BK NSObject*    (^logInfo)(NSString* info)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSInteger    (^strLinesCountAboutView)(CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strUILinesCount");

@property LB_BK NSString*    (^strSubToLineAboutView)(NSInteger toLine, CGFloat maxWidth,NSDictionary<NSAttributedStringKey,id>* attrDict)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strSubToUILine");

@property LB_BK NSRange (^strSubRangeToMaxLineIfAppendStrAboutView )(NSUInteger maxLine , CGFloat maxWidth, NSString* ifAppendStr ,NSDictionary<NSAttributedStringKey,id>* attrDict , BOOL* isFullOfLines)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strSubRangeToMaxUILineIfAppendStr");

@property LB_BK void*  (^numValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "not safe");

@property LB_BK NSValue* (^valueCGSizeSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSValue* (^valueCGPointSetToViews)(NSArray* views)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK UIView*      (^viewSetFrameOfCGRect)(CGRect frame)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetFrameVal");

@property LB_BK UIView*      (^viewSetOriginOfCGPoint)(CGPoint origin)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetOriginVal");

@property LB_BK UIView*      (^viewSetCenterOfCGPoint)(CGPoint center)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetCenterVal");

@property LB_BK UIView*      (^viewSetSizeOfCGSize)(CGSize size)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSetSizeVal");

@property LB_BK UIView*      (^viewConvertSuperverTo)(UIView* aView , BOOL isKeep)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to viewConvertSuperviewTo");

@property LB_BK NSMutableArray*      (^viewFindSubviews)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewFindSubviewsOfClass");

@property LB_BK NSMutableString*     (^m_strAppenStr)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to m_strAppend");

- (BOOL (^)(void))objIsMutableType
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objIsMutable");

@property LB_BK NSMutableString*     (^m_strReplaceStr)(NSString* replaceStr, NSString* withStr)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_strReplace");

@property LB_BK NSString*    (^strAppendObj)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strAppend");

@property LB_BK NSObject*    (^objMutableCopyDeep)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objMutableCopyEnumerable");

@property LB_BK NSObject*    (^objValuesRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use objSetRandom... instead");
@property LB_BK NSObject*    (^objValuesClean)(void);

@property LB_BK NSObject*    (^objMustType)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSObject*    (^objAddToArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");
@property LB_BK NSObject*    (^objRemoveFromArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");
@property LB_BK NSObject*    (^objBeforeInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "use objGetPrevItemFromObjs");
@property LB_BK NSObject*    (^objNextInArr)(NSArray* inArr)
NS_DEPRECATED_IOS(2_0, 2_0, "use objGetNextItemFromObjs");
@property LB_BK BOOL         (^objIsInArr)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjs");
@property LB_BK BOOL         (^objIsInDictValues)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjs");
@property LB_BK NSNumber*    (^objIsInDictValues_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjsAs");
@property LB_BK NSNumber*    (^objIsInArr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsSubitemOfObjsAs");
@property LB_BK BOOL         (^objIsInDictKeys)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKeyOfObjs");
@property LB_BK NSNumber*    (^objIsInDictKeys_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use objIsKeyOfObjsAs");

@property LB_BK NSObject*    (^objSetValueForKey_delegate)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKdelegate");
@property LB_BK NSObject*    (^objSetValueForKey_dataSource)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKdataSource");
@property LB_BK NSObject*    (^objSetValueForKey_text)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to objSetValueForKtext");

@property LB_BK NSObject*    (^objSetToDict)(NSMutableDictionary* dict, id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSString*        (^dateAstrology)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to dateToStrAstrologyzh_CN");//

@property LB_BK NSNumber*    (^objIsKindOfNSString)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
@property LB_BK NSNumber*    (^objIsKindOfNSArray)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
@property LB_BK NSNumber*    (^objIsKindOfNSDictionary)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
@property LB_BK NSNumber*    (^objIsKindOfUIView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
@property LB_BK NSNumber*    (^objIsKindOfNSValue)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");
@property LB_BK NSNumber*    (^objIsKindOfNSNumber)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:As");

#pragma mark - subffix change
// special
@property LB_BK NSValue* (^attr_strSizeWithOptions_n)(CGFloat maxWidth, NSStringDrawingOptions optoins)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*                (^arrContainIndex_n)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSValue* (^attr_strSize_n)(CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsKindOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsSubClassOf_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsMemberOfClass_n)(Class clazz)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsRespondsSEL_n)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsEqualToEach_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsEqualToSomeone_n)(id obj,...)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strIszh_CNInRange_n)(NSRange range)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSValue*     (^strSizeWithFontAndMaxWidth_n)(UIFont* font , CGFloat maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSValue*     (^strSizeWithFontAndMaxSize_n)(UIFont* font, CGSize maxSize)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

// one
@property LB_BK NSNumber*    (^arrContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^arrIndexOfObj_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*       (^attr_strIsEqualToAttrStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^dictGetBOOL_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsEqualToNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsGreatThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsGreatEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsLessThanNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsLessEqualNum_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsEqual_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsEqualToEachInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsEqualToSomeoneInArray_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strIsEqualStr_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BKG(strContainsAs) NSNumber*    (^strContain_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainsAs");
@property LB_BK NSValue*     (^strSizeWithFont_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strHasPrefix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strHasSuffix_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strRegexIsMatch_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BKG(numAsIndexToGetValueFromObj) NSNumber*(^numIndexIsInStringRange_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "use numAsIndexToGetValueFromObj");
@property LB_BK NSNumber*    (^strPredicateEvaluate_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

@property LB_BK NSNumber*                (^arrKeyValueContain_n)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");


// none
@property LB_BK NSNumber*        (^dateTimeIntervalSince1970_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateDay_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateHour_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateMinut_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*         (^dateSec_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*        (^dateIsLeapYear_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*        (^dateIsInToday_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*        (^dateIsInMonth_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numHasDecimalValue_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsOdd_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsEven_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsNegative_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^numIsZero_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^objIsNSNull_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strContainzh_CN_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainszh_CNAs");
@property LB_BK NSNumber*    (^strIsBlank_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strIsEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strLength_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BK NSNumber*    (^strIsNumber_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");
@property LB_BKG(strContainsEmojiAs) NSNumber*(^strContainEmoji_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "strContainsEmojiAs");
@property LB_BK NSNumber*    (^strPathFileExists_n)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_nchanged to As");

@property LB_BKG(attr_strSetToControlAsWhatSet) NSObject*  (^attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "attr_strSetToControlAsWhatSet");
@property LB_BKG(m_attr_strSetToControlAsWhatSet) NSObject* (^m_attr_strSetToLabel_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "m_attr_strSetToControlAsWhatSet");
@property LB_BK NSObject*     (^objAddTo_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");


@property LB_BK NSObject*     (^imgSetToImgView_linkTo)(id imgView)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

@property LB_BK NSObject*     (^objRemoveFrom_linkTo)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");


@property LB_BK NSObject*     (^objInsertTo_linkTo)(id obj , NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

@property LB_BK NSObject*     (^imgSetToBtnBGImg_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");
@property LB_BK NSObject*     (^imgSetToBtn_linkTo)(id btn,NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

@property LB_BK NSObject*     (^strPathUnarchiveObject_linkTo)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");
@property LB_BK NSObject*      (^attr_strDrawToImg_linkTo)(id image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "suffix name_linkTochanged to AsWhatSet");

@property LB_BK NSObject*    (^objPerformSelector_linkToReturnValue)(SEL sel)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorAsWhatReturn");
@property LB_BK NSObject*    (^objPerformSelectorWithArg_linkToReturnValue)(SEL sel , id arg)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorArgumentAsWhatReturn");
#ifndef objPerformSelectors_linkToReturnValues
#define objPerformSelectors_linkToReturnValues(sel,args...) objPerformSelectors_linkToReturnValues(sel,##args,nil)
#endif
@property LB_BK NSArray*     (^objPerformSelectors_linkToReturnValues)(SEL sel0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorsAsWhatReturns");
#ifndef objPerformSelectorsWithArgs_linkToReturnValues
#define objPerformSelectorsWithArgs_linkToReturnValues(sel,args...) objPerformSelectorsWithArgs_linkToReturnValues(sel,##args,nil)
#endif
@property LB_BK NSArray*     (^objPerformSelectorsWithArgs_linkToReturnValues)(SEL sel0 , NSArray* args0 , ...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformsSelectorArgumentsAsWhatReturns");

@property LB_BKG(objPerformSelectorArgument) NSObject*    (^objPerformSelectorWithArg)(SEL sel,id arg)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformSelectorArgument");

#ifndef objPerformSelectorsWithArgs
#define objPerformSelectorsWithArgs(sel,args...) objPerformSelectorsWithArgs(sel,##args,nil)
#endif
@property LB_BKG(objPerformsSelectorArguments) NSObject*    (^objPerformSelectorsWithArgs)(SEL sel0,NSArray* args0,...)
NS_DEPRECATED_IOS(2_0, 2_0, "use objPerformsSelectorArguments");

#pragma mark - 2018.10
@property LB_BK NSObject*     (^strSetToTxtField_linkTo)(id txtField)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
@property LB_BK NSObject*     (^strSetToTxtView_linkTo)(id txtView)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
@property LB_BK NSObject*     (^strSetToBtn_linkTo)(id btn, NSUInteger state)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
@property LB_BK NSObject*     (^strSetToLab_linkTo)(id lab)
NS_DEPRECATED_IOS(2_0, 2_0, "strSetToControlContentAsWhatSet");
@property LB_BK BOOL         (^viewIsSubviewTo)(UIView* view)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewIsInView");
@property LB_BK BOOL(^viewIsSuperviewTo)(UIView* view)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewContainsView");


@property LB_BKG(viewBringFrontInSuperview) UIView* (^viewBringFrontInView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewBringFrontInSuperview");

@property LB_BKG(viewSendBackInSuperview) UIView*(^viewSendBackInView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewSendBackInSuperview");

@property LB_BKG(viewPrevIndexView) UIView* (^viewBeforeIndexView)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to viewPrevIndexView");

@property LB_BKG(strContains) BOOL(^strContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strContains");

@property LB_BKG(strContainsEmoji) BOOL(^strContainEmoji)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strContainsEmoji");

@property LB_BK NSUInteger(^strLength)(void)
NS_DEPRECATED_IOS(2_0, 2_0, ".length");

@property LB_BKG(viewSubviewsExclusiveTouch) UIView*(^viewSubiewsExclusiveTouch)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to viewSubviewsExclusiveTouch");

@property LB_BKG(arrContains) BOOL(^arrContain)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContains");
@property LB_BKG(arrContainsAs) NSNumber*(^arrContainAs)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to arrContainsAs");

@property LB_BKG(arrAddToArrAsWhatSet) NSMutableArray*(^arrAddToArr)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "add new suffix:AsWhatSet");

@property LB_BKG(arrContainsIndex) BOOL(^arrContainIndex)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndex");
@property LB_BKG(arrContainsIndexAs) NSNumber*(^arrContainIndexAs)(NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndexAs");

@property LB_BK NSDictionary*            (^arrToDictByKeyNumber)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "use arrContainsIndexAs");
@property LB_BK NSDictionary*            (^arrToDictByKeyString)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BKG(arrGetValuesIndexForValue) NSIndexSet*(^arrIndexSetOfValue)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetValuesIndexWithValue");

@property LB_BK NSMutableArray*          (^arrObjsValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "depracated");

@property LB_BKG(arrObjsWithKindOfClass) NSMutableArray*(^arrObjsOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrObjsWithKindOfClass");

@property LB_BKG(arrGetPrevItemForObj) NSObject*(^arrBefore)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetPrevItemForObj");
@property LB_BKG(arrGetNextItemForObj) NSObject*(^arrNext)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrGetNextItemForObj");

@property LB_BKG(arrInsertObjBeforeTo) NSMutableArray*  (^arrInsertBefore)(id obj, id beforeTo)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrInsertObjBeforeTo");
@property LB_BKG(arrInsertObjNextTo) NSMutableArray*  (^arrInsertNext)(id obj, id nextTo)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrInsertObjNextTo");
@property LB_BKG(m_arrInsertObjBeforeTo) NSMutableArray*  (^m_arrInsertBefore)(id obj, id beforeObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename m_arrInsertObjBeforeTo");
@property LB_BKG(m_arrInsertObjNextTo) NSMutableArray*  (^m_arrInsertNext)(id obj, id nexObj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename m_arrInsertObjNextTo");

@property LB_BKG(arrContainsKeyValue) BOOL(^arrKeyValueContain)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
@property LB_BKG(arrContainsKeyValueAs) NSNumber*(^arrKeyValueContainAs)(NSString* key,id eqValue)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
@property LB_BKG(arrKeyValueMatchedObjs) NSMutableArray*(^arrKeyValueMatchObjs)(NSString* key,id value)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValueMatchedObjs");
@property LB_BKG(arrKeyValuesMatchedObjs) NSMutableArray*(^arrKeyValuesMatchObjs)(NSDictionary<NSString*,id>* kv)
NS_DEPRECATED_IOS(2_0, 2_0, "rename arrKeyValuesMatchedObjs");
@property LB_BK NSArray*                 (^arrSetValueForKey)(id value, NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "can be instead");

@property LB_BKG(m_arrReplaceWhenObjValueMatchedForKey) NSMutableArray*          (^m_arrTryReplaceObjByKey)(id obj,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceWhenObjValueMatchedForKey");
@property LB_BKG(m_arrReplaceWhenObjsValueMatchedForKey) NSMutableArray*          (^m_arrTryReplaceObjsByKey)(NSArray* objs,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceWhenObjsValueMatchedForKey");

@property LB_BKG(m_arrAddOrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^m_arrAddOrReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrAddOrReplaceWhenObjValueMatchedForKey");

@property LB_BKG(m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt) NSMutableArray*(^m_arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrInsertOrReplaceWhenObjValueMatchedForKeyAt");

@property LB_BKG(m_arrReplaceKeyForDictionaryItemDepth) NSMutableArray*(^m_arrReplaceKeyInDict)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceKeyForDictionaryItemDepth");


@property LB_BKG(m_arrReplaceKeyForDictionaryItem) NSMutableArray*(^m_arrReplaceKeyInDictWithoutDeep)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to m_arrReplaceKeyForDictionaryItem");

@property LB_BKG(arrReplaceKeyForDictionaryItemDepth) NSMutableArray*(^arrReplaceKeyInDict)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceKeyForDictionaryItemDepth");
@property LB_BKG(arrReplaceKeyForDictionaryItem) NSMutableArray*(^arrReplaceKeyInDictWithoutDeep)(id replaceKey,id withKey)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceKeyForDictionaryItem");

@property LB_BKG(arrAddOrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^arrAddOrReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrAddOrReplaceWhenObjValueMatchedForKey");

@property LB_BKG(arrInsertOrReplaceWhenObjValueMatchedForKeyAt) NSMutableArray*(^arrInsertOrReplaceObjByKeyAt)(id obj , NSString* key, NSUInteger idx)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrInsertOrReplaceWhenObjValueMatchedForKeyAt");

@property LB_BKG(arrReplaceWhenObjValueMatchedForKey) NSMutableArray*(^arrTryReplaceObjByKey)(id obj , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceWhenObjValueMatchedForKey");

@property LB_BKG(arrReplaceWhenObjsValueMatchedForKey) NSMutableArray*(^arrTryReplaceObjsByKey)(NSArray* objs , NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to arrReplaceWhenObjsValueMatchedForKey");

@property LB_BK NSDictionary*        (^dictObjsValueRandom)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSArray*     (^dictAllKeys)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSArray*     (^dictAllValues)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK BOOL         (^dictGetBOOL)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSNumber*    (^dictGetBOOLAs)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK id           (^dictGetNoNSNull)(id key)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSTimeInterval   (^dateTimeIntervalSince1970)(void)
NS_DEPRECATED_IOS(2_0, 2_0, ".timeIntervalSince1970");

@property LB_BKG(m_dictReplaceForKeyDepth) NSMutableDictionary* (^m_dictReplaceKey)(id key, id newKey);
@property LB_BKG(m_dictReplaceForKey) NSMutableDictionary* (^m_dictReplaceKeyWithoutDeep)(id key, id newKey);

//@property LB_BK NSMutableDictionary* (^dictUnionDict)(NSDictionary* dict);
@property LB_BKG(m_dictAddEntries) NSMutableDictionary* (^m_dictUnionDict)(NSDictionary* dict);
@property LB_BKG(m_dictSetWithKeyObject) NSMutableDictionary* (^m_dictSetValue)(id key , id value);
@property LB_BKG(dictObjectForKey) NSObject*    (^dictGet)(id key);
@property LB_BKG(dictSetWithKeyObject) NSMutableDictionary* (^dictSetValue)(id key , id value);
@property LB_BKG(dictReplaceForKeyDepth) NSMutableDictionary* (^dictReplaceKey)(id key, id newKey);
@property LB_BKG(dictReplaceForKey) NSMutableDictionary* (^dictReplaceKeyWithoutDeep)(id key, id newKey);

@property LB_BKG(dictContainsKey) BOOL(^dictContainKey)(id key);
@property LB_BKG(dictContainsValue) BOOL(^dictContainValue)(id value);

@property LB_BKG(dictContainsKey) BOOL         (^dictContaineKey)(id<NSCopying> key)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainKey");
@property LB_BKG(dictContainsValue) BOOL         (^dictContaineValue)(id value)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainValue");
@property LB_BKG(dictContainsKeyAs) NSNumber*    (^dictContaineKey_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainAsWhatSet");
@property LB_BKG(dictContainsValueAs) NSNumber*    (^dictContaineValue_n)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to dictContainValue_n");
@property LB_BKG(m_arrAddObjOnlyOne) NSMutableArray*  (^m_arrAddObjNotContain)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "fixed to m_arrAddObjOnlyOne");

@property LB_BKG(numToStrByMaxDecimalWidth) NSString*    (^numToStrMaxDigit)(NSUInteger maxDigit)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to numToStringByMaxDecimalWidth");

@property LB_BK CGSize(^labTextSize)(NSNumber* maxWidth)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BKG(img_viewImageWithName) UIImageView*(^img_viewImageStr)(NSString* imageStr)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to img_viewImageWithName");

@property LB_BKG(imgSetToContainerAsWhatSet) UIImageView*(^imgSetToImageViewAsWhatSet)(UIImageView* imgView)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");

@property LB_BK UIButton*(^imgSetToButtonAsBGImageAsWhatSet)(UIButton* btn,UIControlState state)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");
@property LB_BK UIButton*(^imgSetToButtonAsWhatSet)(UIButton* btn,UIControlState state)
NS_DEPRECATED_IOS(2_0, 2_0, "use imgSetToContainerAsWhatSet");


@property LB_BKG(colorSetToUIBackground) UIColor*(^colorSetToViewBG)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForBackground");
@property LB_BKG(colorSetToUIBackground) UIColor*(^colorSetToViewsBG)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForBackground");
@property LB_BKG(colorSetToUIText) UIColor*(^colorSetToLabText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
@property LB_BKG(colorSetToUIText) UIColor*(^colorSetToTxtViewText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
@property LB_BKG(colorSetToUIText) UIColor*(^colorSetToTxtFieldText)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");
@property LB_BKG(colorSetToUIText) UIColor*(^colorSetToBtnTitle)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorSetToUIForText");

@property LB_BKG(colorToHexStringWithPrefix) NSString*(^colorToHexStrByPrefix)(NSString* prefix)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to colorToHexStringWithPrefix");

@property LB_BKG(strCustomComposedLength) NSUInteger(^strLengthComposedAndCustom)(NSString* customReg)
NS_DEPRECATED_IOS(2_0, 2_0, "rename to strCustomComposedLength");

@property LB_BK NSString*(^strPredicateFilterMutable)(id collection)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSArray*(^strPredicateFilteredArray)(NSArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK BOOL(^strPredicateEvaluate)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSNumber*(^strPredicateEvaluateAs)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BK NSObject*            (^strKeyForValueWith)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");
@property LB_BK NSObject*            (^strKeyPathForValueWith)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "deprecated");

@property LB_BKG(viewFindFirstResponderSubViewOfTextInput) UIView*      (^viewFirstResponderSubViewForInput)(void)
NS_DEPRECATED_IOS(2_0, 2_0, "viewFindFirstResponderSubViewOfTextInput");
@end

