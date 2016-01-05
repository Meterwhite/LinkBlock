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
    return ^(NSString* replaceStr, NSString* withStr){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        if(replaceStr.isKindOf([NSString class]) &&
           withStr.isKindOf([NSString class])){
            return (NSMutableString*)[[_self stringByReplacingOccurrencesOfString:replaceStr withString:withStr] mutableCopy];
        }
        return _self;
    };
}
- (void)setM_strReplaceStr:(NSMutableString *(^)(NSString *, NSString *))blockReplaceStrWithStr{};

- (NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt
{
    return ^(NSString* str, NSUInteger idx){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self insertString:str atIndex:idx];
        return _self;
    };
}
- (void)setM_strInsertStrAt:(NSMutableString *(^)(NSString *, NSUInteger))m_strInsertStrAt{};

- (NSMutableString *(^)(NSString *))m_strAppenStr
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:str];
        return _self;
    };
}
- (void)setM_strAppenStr:(NSMutableString *(^)(NSString *))m_strAppenStr{};

//@property (nonatomic,copy) NSMutableString*     (^SQLStr)(NSString* str);
//@property (nonatomic,copy) NSMutableString*     (^SQLInt)(NSInteger intVal);
//@property (nonatomic,copy) NSMutableString*     (^SQLDouble)(double doubleVal);
//@property (nonatomic,copy) NSMutableString*     (^SQLArr)(NSArray* arr);
//@property (nonatomic,copy) NSMutableString*     (^SQLDictKeys)(NSDictionary* dict);
//@property (nonatomic,copy) NSMutableString*     (^SQLDictValues)(NSDictionary* dict);
- (NSMutableString *(^)(NSString *))SQLStr
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" "];
        [_self appendString:str];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLStr:(NSMutableString *(^)(NSString *))SQLStr{};

- (NSMutableString *(^)(NSInteger))SQLInt
{
    return ^(NSInteger num){
        LinkError_VAL_IF(NSMutableString)
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
    return ^(double num){
        LinkError_VAL_IF(NSMutableString)
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
    return ^(NSArray* arr){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" "];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([arr count])
            [_self substringToIndex:_self.length];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLArr:(NSMutableString *(^)(NSArray *))SQLArr{};

-(NSMutableString *(^)(NSDictionary *))SQLDictKeys
{
    return ^(NSDictionary* dic){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" "];
        [[dic allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([[dic allKeys] count])
            [_self substringToIndex:_self.length];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLDictKeys:(NSMutableString *(^)(NSDictionary *))SQLDictKeys{};

- (NSMutableString *(^)(NSDictionary *))SQLDictValues
{
    return ^(NSDictionary* dic){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" "];
        [[dic allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self appendString:[obj description]];
            [_self appendString:@","];
        }];
        if([[dic allValues] count])
            [_self substringToIndex:_self.length];
        [_self appendString:@" "];
        return _self;
    };
}
- (void)setSQLDictValues:(NSMutableString *(^)(NSDictionary *))SQLDictValues{};

- (NSMutableString *(^)(NSString *))SQLStrInStr
{
    return ^(NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" '"];
        [_self appendString:str];
        [_self appendString:@"' "];
        return _self;
    };
}
- (void)setSQLStrInStr:(NSMutableString *(^)(NSString *))SQLStrInStr{};

- (NSMutableString *(^)(NSInteger))SQLIntInStr
{
    return ^(NSInteger num){
        LinkError_VAL_IF(NSMutableString)
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
    return ^(double num){
        LinkError_VAL_IF(NSMutableString)
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
    return ^(NSString* key , NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
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
    return ^(NSString* key , NSString* str){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
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
    return ^(NSString* key , NSInteger num){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
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
    return ^(NSString* key , double num){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
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
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" select "];
        return _self;
    };
}
- (void)setSQL_Select:(NSMutableString *(^)())SQL_Select{};

- (NSMutableString *(^)())SQL_Where
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" where "];
        return _self;
    };
}
- (void)setSQL_Where:(NSMutableString *(^)())SQL_Where{};

- (NSMutableString *(^)())SQL_From
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" from "];
        return _self;
    };
}
- (void)setSQL_From:(NSMutableString *(^)())SQL_From{};

- (NSMutableString *(^)())SQL_Create
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" create "];
        return _self;
    };
}
- (void)setSQL_Create:(NSMutableString *(^)())SQL_Create{};

- (NSMutableString *(^)())SQL_Update
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" update "];
        return _self;
    };
}
- (void)setSQL_Update:(NSMutableString *(^)())SQL_Update{};

- (NSMutableString *(^)())SQL_InsertInto
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" insert into "];
        return _self;
    };
}
- (void)setSQL_InsertInto:(NSMutableString *(^)())SQL_InsertInto{};

- (NSMutableString *(^)())SQL_ReplaceInto
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" replace into "];
        return _self;
    };
}
- (void)setSQL_ReplaceInto:(NSMutableString *(^)())SQL_ReplaceInto{};

- (NSMutableString *(^)())SQL_And
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" and "];
        return _self;
    };
}
- (void)setSQL_And:(NSMutableString *(^)())SQL_And{};

- (NSMutableString *(^)())SQL_Or
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" or "];
        return _self;
    };
}
- (void)setSQL_Or:(NSMutableString *(^)())SQL_Or{};

- (NSMutableString *(^)())SQL_In
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" in "];
        return _self;
    };
}
- (void)setSQL_In:(NSMutableString *(^)())SQL_In{};

- (NSMutableString *(^)())SQL_Distinct
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" distinct "];
        return _self;
    };
}
- (void)setSQL_Distinct:(NSMutableString *(^)())SQL_Distinct{};

- (NSMutableString *(^)())SQL_As
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" as "];
        return _self;
    };
}
- (void)setSQL_As:(NSMutableString *(^)())SQL_As{};

- (NSMutableString *(^)())SQL_Like
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" like "];
        return _self;
    };
}
- (void)setSQL_Like:(NSMutableString *(^)())SQL_Like{};

- (NSMutableString *(^)())SQL_Comma
{
    return ^(){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" comma "];
        return _self;
    };
}
- (void)setSQL_Comma:(NSMutableString *(^)())SQL_Comma{};

- (NSMutableString *(^)(id))SQL_InPair
{
    return ^(id val){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" ("];
        [_self appendString:[val description]];
        [_self appendString:@") "];
        return _self;
    };
}
- (void)setSQL_InPair:(NSMutableString *(^)(id))SQL_InPair{};

- (NSMutableString *(^)(id))SQL_InvertedComma
{
    return ^(id val){
        LinkError_REF_AUTO(NSMutableString, NSMutableString);
        [_self appendString:@" '"];
        [_self appendString:[val description]];
        [_self appendString:@"' "];
        return _self;
    };
}
- (void)setSQL_InvertedComma:(NSMutableString *(^)(id))SQL_InvertedComma{};


@end


@implementation NSMutableString(NSMutableStringLinkBlock)
- (NSMutableString*)SQLUsing:(void(^)(NSMutableString* _self))block
{
    if(block){
        block(self);
    }
    return self;
}
- (NSMutableString*)SQLSelect:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" select "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLWhere:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" where "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLFrom:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" from "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLValues:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" values "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
/** 括号里的变量 */
- (NSMutableString*)SQLInPair:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" ( "];
    if(block){
        [self appendString:block(self)];
    }
    [self appendString:@" ) "];
    return self;
}
- (NSMutableString*)SQLCreate:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" create "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLDelete:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" delete "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLUpdate:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" update "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLReplaceInto:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" replace into "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}
- (NSMutableString*)SQLInsertInto:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" insert into "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}

- (NSMutableString*)SQLLike:(NSString*(^)(NSMutableString* _self))block
{
    [self appendString:@" like "];
    if(block){
        [self appendString:block(self)];
    }
    return self;
}

- (NSMutableString*)SQLIf:(BOOL(^)())ifBlock
                    using:(NSString*(^)(NSMutableString* _self))usingBlock
{
    if(!ifBlock)   return self;
    if(ifBlock()){
        if(usingBlock){
            [self appendString:usingBlock(self)];
        }
    }
    return self;
}

- (NSMutableString *)SQLIf:(BOOL (^)())ifBlock using:(NSString *(^)(NSMutableString *))usingBlock elseUsing:(NSString *(^)(NSMutableString *))elseUsingBlock
{
    if(!ifBlock)   return self;
    if(ifBlock()){
        if(usingBlock){
            [self appendString:usingBlock(self)];
        }
    }else{
        if(elseUsingBlock){
            [self appendString:elseUsingBlock(self)];
        }
    }
    return self;
}
@end