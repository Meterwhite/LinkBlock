//
//  Others+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//


#import "LinkBlock.h"

@implementation NSObject(OtherLinkBlock)

- (BOOL (^)(NSString *))strIsContain
{return self.strContain;}

- (BOOL (^)(id))arrIsContainer
{return self.arrContain;}

- (NSArray *(^)(__unsafe_unretained Class))arrValuesOfType
{
    return ^id(__unsafe_unretained Class typeClass){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_VAL(arrValuesOfType,typeClass)
        if(!typeClass)
            return _self;
        NSMutableArray* re = [NSMutableArray array];
        [_self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:typeClass]){
                [re addObject:obj];
            }
        }];
        return re.copy;
    };
}

- (NSObject *)newLink:(void (^)(NSObject *))block
{
    LinkHandle_REF(NSObject)
    if(block){
        block(_self);
    }
    return _self;
}

- (BOOL (^)(void))strIsContainEmoji
{return self.strContainEmoji;}

- (NSNumber *(^)(void))strIsContainEmoji_n
{return self.strContainEmojiAs;}
- (UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect
{return self.attr_strDrawImgRect;}
- (NSMutableArray *(^)(NSMutableArray *))arrAddTo
{return self.arrAddToArr;}

- (id (^)(NSString *))valueForKeySafe
{return self.objValueForKey;}

- (NSObject *(^)(id ,NSString* ))setValueForKeySafe
{return self.objSetValueForKey;}

- (id (^)(NSString *))valueForKeyPathSafe
{return self.objValueForKeyPath;}

- (NSObject *(^)(id ,NSString* ))setValueForKeyPathSafe
{return self.objSetValueForKeyPath;}

- (BOOL (^)( __unsafe_unretained Class))isKindOf
{return self.objIsKindOf;}

- (NSNumber *(^)(__unsafe_unretained Class))isKindOf_n
{return self.objIsKindOfAs;}

- (BOOL (^)(__unsafe_unretained Class))isSubClassOf
{return self.objIsSubClassOf;}

- (NSNumber *(^)(__unsafe_unretained Class))isSubClassOf_n
{return self.objIsSubClassOfAs;}

- (BOOL (^)(SEL))isRespondsSEL
{return self.objIsRespondsSEL;}

- (NSNumber *(^)(SEL))isRespondsSEL_n
{return self.objIsRespondsSELAs;}

- (NSString *(^)(void))className
{return self.objClassName;}

- (NSString *(^)(void))superclassName
{return self.objSuperclassName;}

- (NSObject *(^)(id*))setTo
{return self.objSetTo;}

- (id (^)(NSString *))valueForKey
{return self.objValueForKey;}

- (NSObject *(^)(id, NSString* ))setValueForKey
{return self.objSetValueForKey;}

- (id (^)(NSString *))valueForKeyPath
{return self.objValueForKeyPath;}

- (NSObject *(^)(id , NSString* ))setValueForKeyPath
{return self.objSetValueForKeyPath;}

- (NSObject *(^)(void))objValueRandom
{return self.objValuesRandom;}

- (NSObject *(^)(id))objSetDelegate
{return self.objSetValueForKey_delegate;}

- (NSObject *(^)(NSString *))objBOOLNegationForKey
{return self.objReverseValueForKey;}

- (UIImage *(^)(float))imgBlur
{return ^id(float percent){return self.imgBlurLightRadius(percent*(20.0/0.6));};}

- (UILabel *(^)(void))labAlignTop
{
    return ^id(){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignTop)
        CGSize fontSize = linkObj(_self.text).strSizeWithFont(_self.font);
        double finalHeight = fontSize.height *_self.numberOfLines;
        if(!finalHeight){
            finalHeight= _self.bounds.size.height;
        }
        double finalWidth =_self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        //        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
        attrs.makeAttrDictFont(_self.font);
        theStringSize = [_self.text boundingRectWithSize: maxSize
                                                 options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              attributes:attrs
                                                 context:nil].size;
        int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[_self.text stringByAppendingString:@"\n "];
        return _self;
    };
}

- (UILabel *(^)(void))labAlignBottom
{
    return ^id(){
        LinkHandle_REF(UILabel)
        LinkGroupHandle_REF(labAlignBottom)
        if(!_self.text)
            return _self;
        CGSize fontSize =linkObj(_self.text).strSizeWithFont(_self.font);
        double finalHeight = fontSize.height *_self.numberOfLines;
        if(!finalHeight){
            finalHeight = _self.bounds.size.height;
        }
        double finalWidth =_self.bounds.size.width;//expected width of label
        CGSize theStringSize;
        //        if([[UIDevice currentDevice].systemVersion floatValue]>=7.0){
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        CGSize maxSize= CGSizeMake(finalWidth, finalHeight);
        attrs.makeAttrDictFont(_self.font);
        theStringSize = [_self.text boundingRectWithSize: maxSize
                                                 options:
                         NSStringDrawingTruncatesLastVisibleLine    |
                         NSStringDrawingUsesLineFragmentOrigin      |
                         NSStringDrawingUsesFontLeading
                                              attributes:attrs
                                                 context:nil].size;
        int newLinesToPad =(finalHeight - theStringSize.height) / fontSize.height;
        for(int i=0; i<newLinesToPad; i++)
            _self.text =[NSString stringWithFormat:@" \n%@",_self.text];
        return _self;
    };
}

- (NSMutableArray *(^)(id, id))arrInsertBehind
{
    return ^id(id obj, id behindObj){
        LinkHandle_REF(NSArray)
        LinkGroupHandle_REF(arrInsertBehind,obj,behindObj)
        if(![_self isKindOfClass:[NSMutableArray class]]){
            _self = [_self mutableCopy];
        }
        return _self.m_arrInsertBehind(obj,behindObj);
    };
}

- (NSMutableArray *(^)(id, id))m_arrInsertBehind
{return self.m_arrInsertNext;}

- (UIView *(^)(BOOL))viewMasksToBounds
{return self.viewClipsToBounds;}

- (NSObject *(^)(NSString *))nslogTitle
{
    return ^id(NSString* title){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(nslogTitle,title)
        NSLog(@"%@%@",title,_self);
        return _self;
    };
}

- (NSObject *(^)(NSString *))logInfo
{
    return ^id(NSString* info){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(logInfo,info)
        NSLog(@"%@",info);
        return self;
    };
}

- (NSInteger (^)(CGFloat, NSDictionary<NSAttributedStringKey,id> *))strLinesCountAboutView
{return self.strUILinesCount;}

- (NSString *(^)(NSInteger, CGFloat, NSDictionary<NSAttributedStringKey,id> *))strSubToLineAboutView
{return self.strSubToUILine;}

- (NSRange (^)(NSUInteger, CGFloat, NSString *, NSDictionary<NSAttributedStringKey,id> *, BOOL *))strSubRangeToMaxLineIfAppendStrAboutView
{return self.strSubRangeToMaxUILineIfAppendStr;}

- (void *(^)(void))numValue
{return ^void*(void){return nil;};}

- (NSValue *(^)(NSArray *))valueCGPointSetToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(NSValue)
        LinkGroupHandle_REF(valueCGPointSetToViews,views)
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.origin = [_self CGPointValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}

- (NSValue *(^)(NSArray *))valueCGSizeSetToViews
{
    return ^id(NSArray* views){
        LinkHandle_REF(NSValue)
        LinkGroupHandle_REF(valueCGSizeSetToViews,views)
        [views enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                CGRect frame = v.frame;
                frame.size = [_self CGSizeValue];
                v.frame = frame;
            }
        }];
        return _self;
    };
}
- (NSString *(^)(id))strAppendObj
{return self.strAppend;}

- (UIView *(^)(CGRect))viewSetFrameOfCGRect
{return self.viewSetFrameVal;}

- (UIView *(^)(CGPoint))viewSetOriginOfCGPoint
{return self.viewSetOriginVal;}

- (UIView *(^)(CGPoint))viewSetCenterOfCGPoint
{return self.viewSetCenterVal;}

- (UIView *(^)(CGSize))viewSetSizeOfCGSize
{return self.viewSetSizeVal;}

- (UIView *(^)(UIView *, BOOL))viewConvertSuperverTo
{return self.viewConvertSuperviewTo;}

- (NSMutableArray *(^)(__unsafe_unretained Class))viewFindSubviews
{return self.viewFindSubviewsOfClass;}

- (NSMutableString *(^)(NSString *))m_strAppenStr
{return self.m_strAppend;}

- (BOOL (^)(void))objIsMutableType
{return self.objIsMutable;}

- (NSMutableString *(^)(NSString *, NSString *))m_strReplaceStr
{return self.m_strReplace;}

- (NSObject *(^)(void))objMutableCopyDeep
{return self.objMutableCopyEnumerate;}

- (NSObject *(^)(void))objValuesRandom
{return self.objSetValuesRandom;}

- (NSObject* (^)(__unsafe_unretained Class))objMustType
{
    return ^id(Class clazz){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objMustType,clazz)
        if(!clazz || ![_self isKindOfClass:clazz]){
            return [clazz new];
        }else{
            return _self;
        }
    };
}

- (NSObject *(^)(NSMutableArray *))objAddToArr
{
    return ^id(NSMutableArray* arr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objAddToArr,arr)
        if([arr isKindOfClass:[NSMutableArray class]]){
            [arr addObject:_self];
        }
        return _self;
    };
}

- (NSObject *(^)(NSMutableArray *))objRemoveFromArr
{
    return ^id(NSMutableArray* arr){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objRemoveFromArr,arr)
        if([arr isKindOfClass:[NSMutableArray class]]){
            [arr removeObject:_self];
        }
        return _self;
    };
}

- (NSObject *(^)(NSArray *))objBeforeInArr
{return self.objGetPrevItemFromObjs;}
- (NSObject *(^)(NSArray *))objNextInArr
{return self.objGetNextItemFromObjs;}

- (BOOL (^)(id))objIsInArr
{return self.objIsSubitemOfObjs;}
- (BOOL (^)(id))objIsInDictValues
{return self.objIsSubitemOfObjs;}
- (NSNumber *(^)(id))objIsInArrAs
{return self.objIsSubitemOfObjsAs;}
- (NSNumber *(^)(id))objIsInDictValuesAs
{return self.objIsSubitemOfObjsAs;}


- (NSObject *(^)(NSMutableDictionary *, id<NSCopying>))objSetToDict
{
    return ^id(NSMutableDictionary* dict, id<NSCopying> key){
        LinkHandle_REF(NSObject)
        LinkGroupHandle_REF(objSetToDict,dict,key)
        dict[key] = _self;
        return _self;
    };
}

- (NSString *(^)(void))dateAstrology
{return self.dateToStrAstrologyzh_CN;}

#ifndef ChangeNameForN_VOID
#define ChangeNameForN_VOID(FuncName) \
- (NSNumber *(^)(void))FuncName##_n\
{\
return self.FuncName##As;\
}
#endif

ChangeNameForN_VOID(dateTimeIntervalSince1970)
ChangeNameForN_VOID(dateYear)
ChangeNameForN_VOID(dateMonth)
ChangeNameForN_VOID(dateDay)
ChangeNameForN_VOID(dateHour)
ChangeNameForN_VOID(dateMinut)
ChangeNameForN_VOID(dateSec)
ChangeNameForN_VOID(dateIsLeapYear)
ChangeNameForN_VOID(dateIsInToday)
ChangeNameForN_VOID(dateIsInMonth)
ChangeNameForN_VOID(numHasDecimalValue)
ChangeNameForN_VOID(numIsOdd)
ChangeNameForN_VOID(numIsEven)
ChangeNameForN_VOID(numIsNegative)
ChangeNameForN_VOID(numIsZero)
ChangeNameForN_VOID(objIsNSNull)
ChangeNameForN_VOID(strContainzh_CN)
ChangeNameForN_VOID(strIsBlank)
ChangeNameForN_VOID(strIsEmoji)
ChangeNameForN_VOID(strLength)
ChangeNameForN_VOID(strIsNumber)
ChangeNameForN_VOID(strContainEmoji)
ChangeNameForN_VOID(strPathFileExists)

#ifndef ChangeNameForN_ONE
#define ChangeNameForN_ONE(FuncName) \
- (NSNumber *(^)(id obj))FuncName##_n\
{\
return self.FuncName##As;\
}
#endif

ChangeNameForN_ONE(arrContain)
ChangeNameForN_ONE(arrIndexOfObj)
ChangeNameForN_ONE(attr_strIsEqualToAttrStr)
ChangeNameForN_ONE(dictGetBOOL)
ChangeNameForN_ONE(numIsEqualToNum)
ChangeNameForN_ONE(numIsGreatThanNum)
ChangeNameForN_ONE(numIsGreatEqualNum)
ChangeNameForN_ONE(numIsLessThanNum)
ChangeNameForN_ONE(numIsLessEqualNum)
ChangeNameForN_ONE(objIsEqual)
ChangeNameForN_ONE(objIsEqualToEachInArray)
ChangeNameForN_ONE(objIsEqualToSomeoneInArray)
//ChangeNameForN_ONE(objIsInDictValues)
//ChangeNameForN_ONE(objIsInDictKeys)
ChangeNameForN_ONE(strIsEqualStr)
ChangeNameForN_ONE(strContain)
ChangeNameForN_ONE(strHasPrefix)
ChangeNameForN_ONE(strHasSuffix)
ChangeNameForN_ONE(strRegexIsMatch)
ChangeNameForN_ONE(numIndexIsInStringRange)
ChangeNameForN_ONE(strPredicateEvaluate)

- (NSValue *(^)(id))strSizeWithFont_n
{return self.strSizeWithFontAs;}
- (NSNumber *(^)(NSString *, id))arrKeyValueContain_n
{return self.arrKeyValueContainAs;}
- (NSValue *(^)(CGFloat, NSStringDrawingOptions))attr_strSizeWithOptions_n
{return self.attr_strSizeWithOptionsAs;}
- (NSNumber *(^)(NSUInteger))arrContainIndex_n
{return self.arrContainIndexAs;}
- (NSValue *(^)(CGFloat))attr_strSize_n
{return self.attr_strSizeAs;}
- (NSNumber *(^)(__unsafe_unretained Class))objIsKindOf_n
{return self.objIsKindOfAs;}
- (NSNumber *(^)(__unsafe_unretained Class))objIsSubClassOf_n
{return self.objIsSubClassOfAs;}
- (NSNumber *(^)(__unsafe_unretained Class))objIsMemberOfClass_n
{return self.objIsMemberOfClassAs;}
- (NSNumber *(^)(SEL))objIsRespondsSEL_n
{return self.objIsRespondsSELAs;}
- (NSNumber *(^)(id, ...))objIsEqualToEach_n
{return self.objIsEqualToEachAs;}
- (NSNumber *(^)(id, ...))objIsEqualToSomeone_n
{return self.objIsEqualToSomeoneAs;}
- (NSNumber *(^)(NSRange))strIszh_CNInRange_n
{return self.strIszh_CNInRangeAs;}
- (NSValue *(^)(UIFont *, CGFloat))strSizeWithFontAndMaxWidth_n
{return self.strSizeWithFontAndMaxWidthAs;}
- (NSValue *(^)(UIFont *, CGSize))strSizeWithFontAndMaxSize_n
{return self.strSizeWithFontAndMaxSizeAs;}

#pragma mark - _link_ one

#ifndef ChangeNameForLink_ONE
#define ChangeNameForLink_ONE(FuncName) \
- (NSObject *(^)(id obj))FuncName##_linkTo\
{\
return self.FuncName##AsWhatSet;\
}
#endif

ChangeNameForLink_ONE(attr_strSetToLabel)
ChangeNameForLink_ONE(m_attr_strSetToLabel)
ChangeNameForLink_ONE(objAddTo)
ChangeNameForLink_ONE(objRemoveFrom)

- (NSObject *(^)(id, NSUInteger))objInsertTo_linkTo
{return self.objInsertToAsWhatSet;}
- (NSObject *(^)(id, NSUInteger))imgSetToBtnBGImg_linkTo
{return self.imgSetToButtonAsWhatSet;}
- (NSObject *(^)(id, NSUInteger))strSetToBtn_linkTo
{return self.strSetToButtonAsWhatSet;}
- (NSObject *(^)(id, NSUInteger))imgSetToBtn_linkTo
{return self.imgSetToButtonAsWhatSet;}
- (NSObject *(^)(id))strSetToTxtField_linkTo
{return self.strSetToTextFieldAsWhatSet;}
- (NSObject *(^)(id))strSetToTxtView_linkTo
{return self.strSetToTextViewAsWhatSet;}
- (NSObject *(^)(id))imgSetToImgView_linkTo
{return self.imgSetToImageViewAsWhatSet;}
- (NSObject *(^)(id))strSetToLab_linkTo
{return self.strSetToLabelAsWhatSet;}
- (NSObject *(^)(void))strPathUnarchiveObject_linkTo
{return self.strPathUnarchiveObjectAsWhatReturn;}
- (NSObject *(^)(id, CGRect))attr_strDrawToImg_linkTo
{return self.attr_strDrawToImageAsWhatSet;}
- (NSObject *(^)(SEL))objPerformSelector_linkToReturnValue
{return self.objPerformSelectorAsWhatReturn;}
- (NSObject *(^)(SEL, id))objPerformSelectorWithArg_linkToReturnValue
{return self.objPerformSelectorWithArgAsWhatReturn;}
- (NSArray *(^)(SEL, ...))objPerformSelectors_linkToReturnValues
{return self.objPerformSelectorsAsWhatReturns;}
- (NSArray *(^)(SEL, NSArray *, ...))objPerformSelectorsWithArgs_linkToReturnValues
{return self.objPerformSelectorsWithArgsAsWhatReturns;}

- (BOOL (^)(id<NSCopying>))dictContaineKey
{return self.dictContainKey;}
- (BOOL (^)(id))dictContaineValue
{return self.dictContainValue;}
- (NSNumber *(^)(id))dictContaineKey_n
{return self.dictContainKeyAs;}
- (NSNumber *(^)(id))dictContaineValue_n
{return self.dictContainValueAs;}

#ifndef ChangeNameAppend_As
#define ChangeNameAppend_As(FuncName) \
- (NSNumber* (^)(void))FuncName\
{\
return self.FuncName##As;\
}
#endif

ChangeNameAppend_As(objIsKindOfNSString)
ChangeNameAppend_As(objIsKindOfNSArray)
ChangeNameAppend_As(objIsKindOfNSDictionary)
ChangeNameAppend_As(objIsKindOfUIView)
ChangeNameAppend_As(objIsKindOfNSValue)
ChangeNameAppend_As(objIsKindOfNSNumber)
@end
