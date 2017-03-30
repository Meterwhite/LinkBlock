//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIControlLinkBlock)
/** <^(BOOL enable)> */
LBDeclare UIControl*  (^controlEnable)(BOOL enable);
/** <^(BOOL enable)> */
LBDeclare UIControl*  (^controlSelected)(BOOL enable);
/** <^(BOOL enable)> */
LBDeclare UIControl*  (^controlHighlighted)(BOOL enable);
/** <^(UIControlContentHorizontalAlignment alignment)> */
LBDeclare UIControl*  (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
/** <^(UIControlContentVerticalAlignment alignment)> */
LBDeclare UIControl*  (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);
@end
