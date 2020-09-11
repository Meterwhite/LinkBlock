//
//  TDynamiling.h
//  Objcling
//
//  Created by MeterWhite on 2020/9/10.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TArrayling,  TStringling,    TDictionaryling;
@class TColorling,  TNumberling,    TPredicateling;
@class TURLling,    TValueling,     TViewling;
@class TButtonling, TTextViewling,  TTextFieldling;
@class TLabelling,  TImageViewling;

NS_ASSUME_NONNULL_BEGIN

/// 该文件与NSObject+Objecling.h具有相同的声明，作为空的动态链的声明
@interface TDynamiling : NSProxy

/// 空的动态链
+ (TObjectling *)ling;

+ (TObjectling *)lings;

+ (TArrayling     *)arrayling;
+ (TStringling    *)stringling;
+ (TDictionaryling*)dictionaryling;
+ (TColorling     *)colorling;
+ (TNumberling    *)numberling;
+ (TPredicateling *)predicateling;
+ (TURLling       *)urlling;
+ (TValueling     *)valueling;
#pragma mark - 强类型/UIKit
+ (TViewling      *)viewling;
+ (TButtonling    *)buttonling;
+ (TTextViewling  *)textViewling;
+ (TTextFieldling *)textFieldling;
+ (TLabelling     *)labelling;
+ (TImageViewling *)imageViewling;
@end

NS_ASSUME_NONNULL_END
