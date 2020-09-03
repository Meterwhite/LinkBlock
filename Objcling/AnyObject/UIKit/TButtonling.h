//
//  TButtonling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/26.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TViewling.h"

NS_ASSUME_NONNULL_BEGIN

@class TButtonling;

@protocol TButtonLetling <TViewLetling>

@end

@interface TButtonling : TViewling

- (TButtonling<TButtonLetling>*)let;

@property (readonly) TButtonling *(^textNormal)(NSString *txt);
@property (readonly) TButtonling *(^textHighlighted)(NSString *txt);
@property (readonly) TButtonling *(^textDisabled)(NSString *txt);
@property (readonly) TButtonling *(^textSelected)(NSString *txt);
@property (readonly) TButtonling *(^textFocused)(NSString *txt);
@property (readonly) TButtonling *(^textApplication)(NSString *txt);
@property (readonly) TButtonling *(^textReserved)(NSString *txt);

@property (readonly) TButtonling *(^textColortNormal)(NSString *txt);
@property (readonly) TButtonling *(^textColortHighlighted)(NSString *txt);
@property (readonly) TButtonling *(^textColortDisabled)(NSString *txt);
@property (readonly) TButtonling *(^textColortSelected)(NSString *txt);
@property (readonly) TButtonling *(^textColortFocused)(NSString *txt);
@property (readonly) TButtonling *(^textColortApplication)(NSString *txt);
@property (readonly) TButtonling *(^textColortReserved)(NSString *txt);

@property (readonly) TButtonling *(^imageNormal)(NSString *txt);
@property (readonly) TButtonling *(^imageHighlighted)(NSString *txt);
@property (readonly) TButtonling *(^imageDisabled)(NSString *txt);
@property (readonly) TButtonling *(^imageSelected)(NSString *txt);
@property (readonly) TButtonling *(^imageFocused)(NSString *txt);
@property (readonly) TButtonling *(^imageApplication)(NSString *txt);
@property (readonly) TButtonling *(^imageReserved)(NSString *txt);

@property (readonly) TButtonling *(^bgimageNormal)(NSString *txt);
@property (readonly) TButtonling *(^bgimageHighlighted)(NSString *txt);
@property (readonly) TButtonling *(^bgimageDisabled)(NSString *txt);
@property (readonly) TButtonling *(^bgimageSelected)(NSString *txt);
@property (readonly) TButtonling *(^bgimageFocused)(NSString *txt);
@property (readonly) TButtonling *(^bgimageApplication)(NSString *txt);
@property (readonly) TButtonling *(^bgimageReserved)(NSString *txt);

@end

NS_ASSUME_NONNULL_END
