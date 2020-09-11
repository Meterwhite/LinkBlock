//
//  NSObject+ObjcLing.h
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TArrayling,  TStringling,    TDictionaryling;
@class TColorling,  TNumberling,    TPredicateling;
@class TURLling,    TValueling,     TViewling;
@class TButtonling, TTextViewling,  TTextFieldling;
@class TLabelling,  TImageViewling;

NS_ASSUME_NONNULL_BEGIN



@interface NSObject(Objcling)
/**
 * 从一个对象获取链对象
 */
- (TObjectling    *)ling;
/**
 * 从多个对象获取多链对象，多链
 * @[a, b, c].lings...
 */
- (TObjectling    *)lings;
#pragma mark - 强类型
- (TArrayling     *)arrayling;

- (TStringling    *)stringling;

- (TDictionaryling*)dictionaryling;

- (TColorling     *)colorling;

- (TNumberling    *)numberling;

- (TPredicateling *)predicateling;

- (TURLling       *)urlling;

- (TValueling     *)valueling;

#pragma mark - 强类型/UIKit
- (TViewling      *)viewling;

- (TButtonling    *)buttonling;

- (TTextViewling  *)textViewling;

- (TTextFieldling *)textFieldling;

- (TLabelling     *)labelling;

- (TImageViewling *)imageViewling;

@end

NS_ASSUME_NONNULL_END
