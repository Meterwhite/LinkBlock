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
        LinkHandle_REF(NSMutableString, NSMutableString)
        if([replaceStr isKindOfClass:[NSString class]] &&
           [withStr isKindOfClass:[NSString class]] ){
            return (NSMutableString*)[[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}
- (void)setM_strReplaceStr:(NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};

- (NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt
{
    return ^id(NSString* str, NSUInteger idx){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self insertString:str atIndex:idx];
        return _self;
    };
}
- (void)setM_strInsertStrAt:(NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt{};

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:str];
        return _self;
    };
}
- (void)setM_strAppenStr:(NSMutableString *(^)(NSString *))m_strAppenStr{};

- (NSMutableString *(^)())m_strClear
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self setString:@""];
        return _self;
    };
}
- (void)setM_strClear:(NSMutableString *(^)())m_strClear{};

- (NSMutableString *(^)(NSRange))m_strDeleteInRange
{
    return ^id(NSRange range){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self deleteCharactersInRange:range];
        return _self;
    };
}
- (void)setM_strDeleteInRange:(NSMutableString *(^)(NSRange))m_strDeleteInRange{};

- (NSMutableString *(^)(NSString *))SQLStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" "];
        [_self appendString:str];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLStr:(NSMutableString *(^)(NSString *))SQLStr{};

- (NSMutableString *(^)(NSInteger))SQLInt
{
    return ^id(NSInteger num){
        LinkHandle_VAL_IF(NSMutableString)
            return _self;
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"%ld" ,(long)num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLInt:(NSMutableString *(^)(NSInteger))SQLInt{};

-(NSMutableString *(^)(double))SQLDouble
{
    return ^id(double num){
        LinkHandle_VAL_IF(NSMutableString)
        return _self;
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"%f" ,num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLDouble:(NSMutableString *(^)(double))SQLDouble{};

- (NSMutableString *(^)(NSArray *))SQLArr
{
    return ^id(NSArray* arr){
        LinkHandle_REF(NSMutableString, NSMutableString)
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
- (void)setSQLArr:(NSMutableString *(^)(NSArray *))SQLArr{};

-(NSMutableString *(^)(NSDictionary *))SQLDictKeys
{
    return ^id(NSDictionary* dic){
        LinkHandle_REF(NSMutableString, NSMutableString)
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
- (void)setSQLDictKeys:(NSMutableString *(^)(NSDictionary *))SQLDictKeys{};

- (NSMutableString *(^)(NSDictionary *))SQLDictValues
{
    return ^id(NSDictionary* dic){
        LinkHandle_REF(NSMutableString, NSMutableString)
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
- (void)setSQLDictValues:(NSMutableString *(^)(NSDictionary *))SQLDictValues{};

- (NSMutableString *(^)(NSString *))SQLStrInStr
{
    return ^id(NSString* str){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" '"];
        [_self appendString:str];
        [_self appendString:@"' "];
        return _self;
    };
}
- (void)setSQLStrInStr:(NSMutableString *(^)(NSString *))SQLStrInStr{};

- (NSMutableString *(^)(NSInteger))SQLIntInStr
{
    return ^id(NSInteger num){
        LinkHandle_VAL_IF(NSMutableString)
        return _self;
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"'%ld'" ,(long)num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLIntInStr:(NSMutableString *(^)(NSInteger))SQLIntInStr{};

- (NSMutableString *(^)(double))SQLDoubleInStr
{
    return ^id(double num){
        LinkHandle_VAL_IF(NSMutableString)
        return _self;
        [_self appendString:@" "];
        [_self appendString:[NSString stringWithFormat:@"'%f'" ,num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLDoubleInStr:(NSMutableString *(^)(double))SQLDoubleInStr{};

- (NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStr
{
    return ^id(NSString* key , NSString* str){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:str];
        [_self appendString:@" "];
        return _self;
    };
}
-(void)setSQLKeyValueEqualStr:(NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStr{};

- (NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStrInStr
{
    return ^id(NSString* key , NSString* str){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = '"];
        [_self appendString:str];
        [_self appendString:@"' "];
        return _self;
    };
}
- (void)setSQLKeyValueEqualStrInStr:(NSMutableString *(^)(NSString *, NSString *))SQLKeyValueEqualStrInStr{};

- (NSMutableString *(^)(NSString *, NSInteger))SQLKeyValueEqualInt
{
    return ^id(NSString* key , NSInteger num){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:[NSString stringWithFormat:@"%ld", (long)num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLKeyValueEqualInt:(NSMutableString *(^)(NSString *, NSInteger))SQLKeyValueEqualInt{};

- (NSMutableString *(^)(NSString *, double))SQLKeyValueEqualDouble
{
    return ^id(NSString* key , double num){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" "];
        [_self appendString:key];
        [_self appendString:@" = "];
        [_self appendString:[NSString stringWithFormat:@"%f", num]];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLKeyValueEqualDouble:(NSMutableString *(^)(NSString *, double))SQLKeyValueEqualDouble{};

- (NSMutableString *(^)())SQL_Select
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" select "];
        return _self;
    };
}
- (void)setSQL_Select:(NSMutableString *(^)())SQL_Select{};

- (NSMutableString *(^)())SQL_Where
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" where "];
        return _self;
    };
}
- (void)setSQL_Where:(NSMutableString *(^)())SQL_Where{};

- (NSMutableString *(^)())SQL_From
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" from "];
        return _self;
    };
}
- (void)setSQL_From:(NSMutableString *(^)())SQL_From{};

- (NSMutableString *(^)())SQL_Create
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" create "];
        return _self;
    };
}
- (void)setSQL_Create:(NSMutableString *(^)())SQL_Create{};

- (NSMutableString *(^)())SQL_Update
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" update "];
        return _self;
    };
}
- (void)setSQL_Update:(NSMutableString *(^)())SQL_Update{};

- (NSMutableString *(^)())SQL_InsertInto
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" insert into "];
        return _self;
    };
}
- (void)setSQL_InsertInto:(NSMutableString *(^)())SQL_InsertInto{};

- (NSMutableString *(^)())SQL_ReplaceInto
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" replace into "];
        return _self;
    };
}
- (void)setSQL_ReplaceInto:(NSMutableString *(^)())SQL_ReplaceInto{};

- (NSMutableString *(^)())SQL_And
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" and "];
        return _self;
    };
}
- (void)setSQL_And:(NSMutableString *(^)())SQL_And{};

- (NSMutableString *(^)())SQL_Or
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" or "];
        return _self;
    };
}
- (void)setSQL_Or:(NSMutableString *(^)())SQL_Or{};

- (NSMutableString *(^)())SQL_In
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" in "];
        return _self;
    };
}
- (void)setSQL_In:(NSMutableString *(^)())SQL_In{};

- (NSMutableString *(^)())SQL_Distinct
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" distinct "];
        return _self;
    };
}
- (void)setSQL_Distinct:(NSMutableString *(^)())SQL_Distinct{};

- (NSMutableString *(^)())SQL_As
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" as "];
        return _self;
    };
}
- (void)setSQL_As:(NSMutableString *(^)())SQL_As{};

- (NSMutableString *(^)())SQL_Like
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" like "];
        return _self;
    };
}
- (void)setSQL_Like:(NSMutableString *(^)())SQL_Like{};

- (NSMutableString *(^)())SQL_Comma
{
    return ^id(){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" , "];
        return _self;
    };
}
- (void)setSQL_Comma:(NSMutableString *(^)())SQL_Comma{};

- (NSMutableString *(^)(id))SQL_InPair
{
    return ^id(id val){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" ("];
        [_self appendString:[val description]];
        [_self appendString:@") "];
        return _self;
    };
}
- (void)setSQL_InPair:(NSMutableString *(^)(id))SQL_InPair{};

- (NSMutableString *(^)(id))SQL_InvertedComma
{
    return ^id(id val){
        LinkHandle_REF(NSMutableString, NSMutableString)
        [_self appendString:@" '"];
        [_self appendString:[val description]];
        [_self appendString:@"' "];
        return _self;
    };
}
- (void)setSQL_InvertedComma:(NSMutableString *(^)(id))SQL_InvertedComma{};

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