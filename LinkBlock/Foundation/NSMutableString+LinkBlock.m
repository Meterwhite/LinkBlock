//
//  NSMutableString+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"


@implementation NSObject(NSMutableStringLinkBlock)
- (NSMutableString *(^)(NSString *, NSString *))m_strReplaceStr
{
    return ^id(NSString* replaceStr, NSString* withStr){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strReplaceStr,replaceStr,withStr)
        if([replaceStr isKindOfClass:[NSString class]] &&
           [withStr isKindOfClass:[NSString class]] ){
            return (NSMutableString*)[[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}

- (NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt
{
    return ^id(NSString* str, NSUInteger idx){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strInsertStrAt,str,idx)
        [_self insertString:str atIndex:idx];
        return _self;
    };
}

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strAppenStr,str)
        [_self appendString:str];
        return _self;
    };
}

- (NSMutableString *(^)())m_strClear
{
    return ^id(){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strClear)
        [_self setString:@""];
        return _self;
    };
}

- (NSMutableString *(^)(NSRange))m_strDeleteInRange
{
    return ^id(NSRange range){
        LinkHandle_REF(NSMutableString)
        LinkGroupHandle_REF(m_strDeleteInRange,range)
        [_self deleteCharactersInRange:range];
        return _self;
    };
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


@end


@implementation NSMutableString(NSMutableStringLinkBlock)
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

- (void)m_strEnumerateComposedModifiedUsingBlock:(void (^)(NSString *__autoreleasing *, NSRange, BOOL *))block
{
    if(block){
        NSMutableString* newStr = [NSMutableString new];
        [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
            block(&substring,enclosingRange,stop);
            [newStr appendString:substring];
        }];
        [self setString:newStr];
    }
}
@end
