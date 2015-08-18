//
//  UIColor+LinkBlock.h

//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(LinkBlock)
/** 返回如0xc3c3c3 , #c3c3c3 , c3c3c3 */
@property (nonatomic,copy) NSString*        (^blockToStringWithPrefix)(NSString* prefix);
@property (nonatomic,copy) CGFloat          (^blockRedValue)();
@property (nonatomic,copy) CGFloat          (^blockGreenValue)();
@property (nonatomic,copy) CGFloat          (^blockBlueValue)();
@property (nonatomic,copy) CGFloat          (^blockAlphaValue)();
/** return new UIColor */
@property (nonatomic,copy) UIColor*         (^blockSetRedValue)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^blockSetGreenValue)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^blockSetBlueValue)(CGFloat value);
@property (nonatomic,copy) UIColor*         (^blockSetAlphaValue)(CGFloat value);
@end
