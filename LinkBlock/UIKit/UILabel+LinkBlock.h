//
//  UILabel+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UILabelNew
#define UILabelNew ([UILabel new])
#endif
@interface NSObject(UILabelLinkBlock)
/** <^()>即时的文本顶部对齐 */
LBDeclare UILabel*         (^labAlignTop)();
/** <^()>即时的文本底部对齐 */
LBDeclare UILabel*         (^labAlignBottom)();
/** <^(NSTextAlignment alighment)> */
LBDeclare UILabel*         (^labAlignment)(NSTextAlignment alighment);
/** <^(NSInteger lines)> */
LBDeclare UILabel*         (^labNumberOfLines)(NSInteger lines);
/** <^(NSString* txt)> */
LBDeclare UILabel*         (^labText)(NSString* txt);
/** <^(UIColor* color)> */
LBDeclare UILabel*         (^labTextColor)(UIColor* color);
/** <^(UIFont* font)> */
LBDeclare UILabel*         (^labFont)(UIFont* font);
/** <^()> */
LBDeclare CGFloat          (^labFontSystemSizeGet)();
/** <^(CGFloat fontSize)> */
LBDeclare UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
@end
