//
//  Others+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//


#import "LinkBlock.h"

@implementation NSObject(OtherLinkBlock)
- (id (^)())end
{
    return ^id(){
        return self.linkEnd;
    };
}
- (id (^)())ends
{
    return ^id(){
        return self.linkEnds;
    };
}
- (id (^)(NSUInteger idx))endsAt
{
    return self.linkEndsAt;
}
- (BOOL (^)(id))arrIsContainer
{
    return self.arrContain;
}

- (BOOL (^)(NSString *))strIsContain
{
    return self.strContain;
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

- (BOOL (^)())strIsContainEmoji
{
    return self.strContainEmoji;
}

- (NSNumber *(^)())strIsContainEmoji_n
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

- (NSMutableString *(^)(NSString *))SQLStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLStr,str)
        [_self appendString:@" "];
        [_self appendString:str];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSInteger))SQLInt
{
    return ^id(NSInteger num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLInt,num)
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"%ld" ,(long)num]];
        [_self appendString:@" "];
        return _self;
    };
}


-(NSMutableString *(^)(double))SQLDouble
{
    return ^id(double num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLDouble,num)
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"%f" ,num]];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSArray *))SQLArr
{
    return ^id(NSArray* arr){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLArr,arr)
        [_self appendString:@" "];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([arr count])
            _self = [[_self substringToIndex:_self.length-1] mutableCopy];
        [_self appendString:@" "];
        return _self;
    };
}

-(NSMutableString *(^)(NSDictionary *))SQLDictKeys
{
    return ^id(NSDictionary* dic){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLDictKeys,dic)
        [_self appendString:@" "];
        [[dic allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([[dic allKeys] count])
            _self = [[_self substringToIndex:_self.length-1] mutableCopy];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSDictionary *))SQLDictValues
{
    return ^id(NSDictionary* dic){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLDictValues,dic)
        [_self appendString:@" "];
        [[dic allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([[dic allValues] count])
            _self = [[_self substringToIndex:_self.length-1] mutableCopy];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *))SQLStrInStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLStrInStr,str)
        [_self appendString:@" '"];
        [_self appendString:str];
        [_self appendString:@"' "];
        return _self;
    };
}

- (NSMutableString *(^)(NSInteger))SQLIntInStr
{
    return ^id(NSInteger num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLIntInStr,num)
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"'%ld'" ,(long)num]];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(double))SQLDoubleInStr
{
    return ^id(double num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLDoubleInStr,num)
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"'%f'" ,num]];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStr
{
    return ^id(NSString* key , NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLKeyValueEqualStr,key,str)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:str];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStrInStr
{
    return ^id(NSString* key , NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLKeyValueEqualStrInStr,key,str)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = '"];
        [_self appendString:str];
        [_self appendString:@"' "];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, NSInteger))SQLKeyValueEqualInt
{
    return ^id(NSString* key , NSInteger num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLKeyValueEqualInt,key,num)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:[NSString stringWithFormat:@"%ld", (long)num]];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, double))SQLKeyValueEqualDouble
{
    return ^id(NSString* key , double num){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQLKeyValueEqualDouble,key,num)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:[NSString stringWithFormat:@"%f", num]];
        [_self appendString:@" "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Select
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Select)
        [_self appendString:@" select "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Where
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Where)
        [_self appendString:@" where "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_From
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_From)
        [_self appendString:@" from "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Create
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Create)
        [_self appendString:@" create "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Update
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Update)
        [_self appendString:@" update "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_InsertInto
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_InsertInto)
        [_self appendString:@" insert into "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_ReplaceInto
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_ReplaceInto)
        [_self appendString:@" replace into "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_And
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_And)
        [_self appendString:@" and "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Or
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Or)
        [_self appendString:@" or "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_In
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_In)
        [_self appendString:@" in "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Distinct
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Distinct)
        [_self appendString:@" distinct "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_As
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_As)
        [_self appendString:@" as "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Like
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Like)
        [_self appendString:@" like "];
        return _self;
    };
}

- (NSMutableString *(^)())SQL_Comma
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_Comma)
        [_self appendString:@" , "];
        return _self;
    };
}

- (NSMutableString *(^)(id))SQL_InPair
{
    return ^id(id val){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_InPair,val)
        [_self appendString:@" ("];
        [_self appendString:[val description]];
        [_self appendString:@") "];
        return _self;
    };
}

- (NSMutableString *(^)(id))SQL_InvertedComma
{
    return ^id(id val){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(SQL_InvertedComma,val)
        [_self appendString:@" '"];
        [_self appendString:[val description]];
        [_self appendString:@"' "];
        return _self;
    };
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

- (NSString *(^)())className
{
    return self.objClassName;
}

- (NSString *(^)())superclassName
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

- (NSObject *(^)())objValueRandom
{
    return self.objValuesRandom;
}

- (NSObject *(^)(id))objRemove
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

- (UILabel *(^)())labAlignTop
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

- (UILabel *(^)())labAlignBottom
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
@end

@implementation NSMutableString (OtherLinkBlock)

- (NSMutableString*)SQLUsing:(void(^)(NSMutableString* makeSQL))block
{
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLSelect:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" select "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLWhere:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" where "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLFrom:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" from "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLValues:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" values ("];
    if(block){
        block(self);
    }
    [self appendString:@") "];
    return self;
}
/** 括号里的变量 */
- (NSMutableString*)SQLInPair:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@"( "];
    if(block){
        block(self);
    }
    [self appendString:@") "];
    return self;
}
- (NSMutableString*)SQLCreate:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" create "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLDelete:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" delete "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLUpdate:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" update "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLReplaceInto:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" replace into "];
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLInsertInto:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" insert into "];
    if(block){
        block(self);
    }
    return self;
}

- (NSMutableString*)SQLLike:(void(^)(NSMutableString* makeSQL))block
{
    [self appendString:@" like "];
    if(block){
        block(self);
    }
    return self;
}

- (NSMutableString*)SQLIf:(BOOL)b
                    using:(void(^)(NSMutableString* makeSQL))usingBlock
{
    if(b){
        if(usingBlock){
            usingBlock(self);
        }
    }
    return self;
}

- (NSMutableString *)SQLIf:(BOOL)b
                     using:(void(^)(NSMutableString *))usingBlock
                 elseUsing:(void(^)(NSMutableString *))elseUsingBlock
{
    if(b){
        if(usingBlock){
            usingBlock(self);
        }
    }else{
        if(elseUsingBlock){
            elseUsingBlock(self);
        }
    }
    return self;
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
