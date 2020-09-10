//
//  NSObject+ObjcLing.h
//  Objcling
//
//  Created by meterwhite on 2020/8/17.
//  Copyright © 2020 meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TArrayling,TStringling,TDictionaryling,TColorling,TNumberling,TPredicateling,TURLling,TValueling,TViewling,TButtonling,TTextViewling,TTextFieldling,TLabelling,TImageViewling;

NS_ASSUME_NONNULL_BEGIN



@interface NSObject(Objcling)

/**
 * <#...#>
 */
@property (readonly) TObjectling    *ling;
@property (readonly) TArrayling     *arrayling;
@property (readonly) TStringling    *stringling;
@property (readonly) TDictionaryling*dictionaryling;
@property (readonly) TColorling     *colorling;
@property (readonly) TNumberling    *numberling;
@property (readonly) TPredicateling *predicateling;
@property (readonly) TURLling       *urlling;
@property (readonly) TValueling     *valueling;

@property (readonly) TViewling      *viewling;
@property (readonly) TButtonling    *buttonling;
@property (readonly) TTextViewling  *textViewling;
@property (readonly) TTextFieldling *textFieldling;
@property (readonly) TLabelling     *labelling;
@property (readonly) TImageViewling *imageViewling;

/**
 * 获取一条多链
 * @[_].lings.arrayling...
 */
@property (readonly) TObjectling    *lings;

@end

NS_ASSUME_NONNULL_END
