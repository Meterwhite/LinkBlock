//
//  NSObject+ObjcLing.m
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "NSObject+Objcling.h"
#import "TDictionaryling.h"
#import "TTextFieldling.h"
#import "TPredicateling.h"
#import "TImageViewling.h"
#import "TTextViewling.h"
#import "TButtonling.h"
#import "TStringling.h"
#import "TNumberling.h"
#import "TArrayling.h"
#import "TColorling.h"
#import "TValueling.h"
#import "TLabelling.h"
#import "TViewling.h"
#import "TURLling.h"

@implementation NSObject(Objcling)

- (TObjectling *)ling {
    if([self isKindOfClass:[Aling class]]) {
        return (TObjectling *)self;
    }
    return [TObjectling lingWith:self];
}

- (TObjectling *)lings {
    if([self isKindOfClass:[Aling class]]) {
        TObjectling *_self = (id)self;
        id user = DelingWith(_self);
        if([user isKindOfClass:NSArray.class]) {
            return [TObjectling lingsWith:user];
        } else {
            return [TObjectling lingsWith:@[user]];
        }
    }
    NSAssert([self isKindOfClass:NSArray.class], @"NSArray!");
    return [TObjectling lingsWith:(NSArray *)self];
}

- (TArrayling *)arrayling {
    if([self isKindOfClass:[Aling class]]) {
        return [TArrayling lingByLing:(Aling *)self];
    }
    return [TArrayling lingWith:self];
}

- (TStringling *)stringling {
    if([self isKindOfClass:[Aling class]]) {
        return [TStringling lingByLing:(Aling *)self];
    }
    return [TStringling lingWith:self];
}

- (TDictionaryling *)dictionaryling {
    if([self isKindOfClass:[Aling class]]) {
        return [TDictionaryling lingByLing:(Aling *)self];
    }
    return [TDictionaryling lingWith:self];
}

- (TColorling *)colorling {
    if([self isKindOfClass:[Aling class]]) {
        return [TColorling lingByLing:(Aling *)self];
    }
    return [TColorling lingWith:self];
}

- (TNumberling *)numberling {
    if([self isKindOfClass:[Aling class]]) {
        return [TNumberling lingByLing:(Aling *)self];
    }
    return [TNumberling lingWith:self];
}

- (TPredicateling *)predicateling {
    if([self isKindOfClass:[Aling class]]) {
        return [TPredicateling lingByLing:(Aling *)self];
    }
    return [TPredicateling lingWith:self];
}

- (TURLling *)urlling {
    if([self isKindOfClass:[Aling class]]) {
        return [TURLling lingByLing:(Aling *)self];
    }
    return [TURLling lingWith:self];
}

- (TValueling *)valueling {
    if([self isKindOfClass:[Aling class]]) {
        return [TValueling lingByLing:(Aling *)self];
    }
    return [TValueling lingWith:self];
}

- (TViewling *)viewling {
    if([self isKindOfClass:[Aling class]]) {
        return [TViewling lingByLing:(Aling *)self];
    }
    return [TViewling lingWith:self];
}

- (TButtonling *)buttonling {
    if([self isKindOfClass:[Aling class]]) {
        return [TButtonling lingByLing:(Aling *)self];
    }
    return [TButtonling lingWith:self];
}

- (TTextViewling *)textViewling {
    if([self isKindOfClass:[Aling class]]) {
        return [TTextViewling lingByLing:(Aling *)self];
    }
    return [TTextViewling lingWith:self];
}

- (TTextFieldling *)textFieldling {
    if([self isKindOfClass:[Aling class]]) {
        return [TTextFieldling lingByLing:(Aling *)self];
    }
    return [TTextFieldling lingWith:self];
}

- (TLabelling *)labelling {
    if([self isKindOfClass:[Aling class]]) {
        return [TLabelling lingByLing:(Aling *)self];
    }
    return [TLabelling lingWith:self];
}

- (TImageViewling *)imageViewling {
    if([self isKindOfClass:[Aling class]]) {
        return [TImageViewling lingByLing:(Aling *)self];
    }
    return [TImageViewling lingWith:self];
}

@end
