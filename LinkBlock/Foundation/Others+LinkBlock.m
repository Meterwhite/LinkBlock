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

- (NSObject *(^)(void))objRemove
{
    return self.objRemoveAll;
}

- (NSObject *(^)(id))objSetDelegate
{
    return self.objSetValueForKey_delegate;
}

- (NSObject *(^)(NSString *))objBoolReverseForKey
{
    return self.objBOOLNegationForKey;
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

#ifndef ________TransType_Maro
#define ________TransType_Maro(ReType) \
- (ReType *)of##ReType \
{ \
return (id)self; \
}
#endif

________TransType_Maro(NSString)
________TransType_Maro(NSMutableString)
________TransType_Maro(NSArray)
________TransType_Maro(NSMutableArray)
________TransType_Maro(NSDictionary)
________TransType_Maro(NSMutableDictionary)
________TransType_Maro(NSAttributedString)
________TransType_Maro(NSMutableAttributedString)
________TransType_Maro(NSURL)
________TransType_Maro(NSUserDefaults)
________TransType_Maro(NSNumber)
________TransType_Maro(NSValue)
________TransType_Maro(NSDate)
________TransType_Maro(NSData)
________TransType_Maro(UIView)
________TransType_Maro(UILabel)
________TransType_Maro(UIControl)
________TransType_Maro(UIButton)
________TransType_Maro(UIScrollView)
________TransType_Maro(UIImage)
________TransType_Maro(UIColor)
________TransType_Maro(UIViewController)
________TransType_Maro(UIImageView)
________TransType_Maro(UITableView)
________TransType_Maro(UITextField)
________TransType_Maro(UITextView)
________TransType_Maro(UIWebView)
________TransType_Maro(NSMutableSet)
________TransType_Maro(NSSet)
________TransType_Maro(NSCalendar)
@end
