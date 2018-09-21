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
{
    return self.strContain;
}

- (BOOL (^)(id))arrIsContainer
{
    return self.arrContain;
}

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
{
    return self.strContainEmoji;
}

- (NSNumber *(^)(void))strIsContainEmoji_n
{
    return self.strContainEmoji_n;
}
- (UIImage *(^)(UIImage *, CGRect))attr_strDrawImgRect
{
    return self.attr_strDrawImgRect;
}
- (NSMutableArray *(^)(NSMutableArray *))arrAddTo
{
    return self.arrAddToArr;
}

- (id (^)(NSString *))valueForKeySafe
{
    return self.objValueForKey;
}

- (NSObject *(^)(id ,NSString* ))setValueForKeySafe
{
    return self.objSetValueForKey;
}

- (id (^)(NSString *))valueForKeyPathSafe
{
    return self.objValueForKeyPath;
}

- (NSObject *(^)(id ,NSString* ))setValueForKeyPathSafe
{
    return self.objSetValueForKeyPath;
}

- (BOOL (^)( __unsafe_unretained Class))isKindOf
{
    return self.objIsKindOf;
}

- (NSNumber *(^)(__unsafe_unretained Class))isKindOf_n
{
    return self.objIsKindOf_n;
}

- (BOOL (^)(__unsafe_unretained Class))isSubClassOf
{
    return self.objIsSubClassOf;
}

- (NSNumber *(^)(__unsafe_unretained Class))isSubClassOf_n
{
    return self.objIsSubClassOf_n;
}

- (BOOL (^)(SEL))isRespondsSEL
{
    return self.objIsRespondsSEL;
}

- (NSNumber *(^)(SEL))isRespondsSEL_n
{
    return self.objIsRespondsSEL_n;
}

- (NSString *(^)(void))className
{
    return self.objClassName;
}

- (NSString *(^)(void))superclassName
{
    return self.objSuperclassName;
}

- (NSObject *(^)(id*))setTo
{
    return self.objSetTo;
}

- (id (^)(NSString *))valueForKey
{
    return self.objValueForKey;
}

- (NSObject *(^)(id, NSString* ))setValueForKey
{
    return self.objSetValueForKey;
}

- (id (^)(NSString *))valueForKeyPath
{
    return self.objValueForKeyPath;
}

- (NSObject *(^)(id , NSString* ))setValueForKeyPath
{
    return self.objSetValueForKeyPath;
}

- (NSObject *(^)(void))objValueRandom
{
    return self.objValuesRandom;
}

- (NSObject *(^)(id))objSetDelegate
{
    return self.objSetValueForKey_delegate;
}

- (NSObject *(^)(NSString *))objBOOLNegationForKey
{
    return self.objReverseValueForKey;
}

- (UIImage *(^)(float))imgBlur
{
    return ^id(float percent){
        return self.imgBlurLightRadius(percent*(20.0/0.6));
    };
}

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
                                                 context:nil].size;//NSStringDrawingUsesFontLeading
        //        }
        //        else{
        //            theStringSize =[_self.text sizeWithFont:_self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:_self.lineBreakMode];
        //        }
        
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
                                                 context:nil].size;//NSStringDrawingUsesFontLeading
        //        }
        //        else{
        //            theStringSize =[_self.text sizeWithFont:_self.font
        //                                 constrainedToSize:CGSizeMake(finalWidth, finalHeight)
        //                                     lineBreakMode:_self.lineBreakMode];
        //        }
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
{
    return self.m_arrInsertNext;
}

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return self.viewClipsToBounds;
}

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
{
    return self.strUILinesCount;
}

- (NSString *(^)(NSInteger, CGFloat, NSDictionary<NSAttributedStringKey,id> *))strSubToLineAboutView
{
    return self.strSubToUILine;
}

- (NSRange (^)(NSUInteger, CGFloat, NSString *, NSDictionary<NSAttributedStringKey,id> *, BOOL *))strSubRangeToMaxLineIfAppendStrAboutView
{
    return self.strSubRangeToMaxUILineIfAppendStr;
}

- (void *(^)(void))numValue
{
    return ^void*(void){
        return nil;
    };
}

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
{
    return self.strAppend;
}

- (UIView *(^)(CGRect))viewSetFrameOfCGRect
{
    return self.viewSetFrameVal;
}

- (UIView *(^)(CGPoint))viewSetOriginOfCGPoint
{
    return self.viewSetOriginVal;
}

- (UIView *(^)(CGPoint))viewSetCenterOfCGPoint
{
    return self.viewSetCenterVal;
}

- (UIView *(^)(CGSize))viewSetSizeOfCGSize
{
    return self.viewSetSizeVal;
}

- (UIView *(^)(UIView *, BOOL))viewConvertSuperverTo
{
    return self.viewConvertSuperviewTo;
}

- (NSMutableArray *(^)(__unsafe_unretained Class))viewFindSubviews
{
    return self.viewFindSubviewsOfClass;
}

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return self.m_strAppend;
}

- (BOOL (^)(void))objIsMutableType
{
    return self.objIsMutable;
}

- (NSMutableString *(^)(NSString *, NSString *))m_strReplaceStr
{
    return self.m_strReplace;
}

- (NSObject *(^)(void))objMutableCopyDeep
{
    return self.objMutableCopyEnumerable;
}

- (NSObject *(^)(void))objValuesRandom
{
    return self.objSetValuesRandom;
}

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
@end
