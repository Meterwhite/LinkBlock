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
/** <^()> */
LBDeclare UILabel*         (^labAlignmentCenter)(void);
/** <^()> */
LBDeclare UILabel*         (^labAlignmentRight)(void);
/** <^()> */
LBDeclare UILabel*         (^labAlignmentLeft)(void);

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
LBDeclare CGFloat          (^labFontSystemSizeGet)(void);
/** <^(CGFloat fontSize)> */
LBDeclare UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
/** <^(CGFloat fontSize)> maxWidth为空时使用空间的宽度为最大宽度 */
LBDeclare CGSize           (^labTextSize)(NSNumber* maxWidth);
@end

@interface UILabel(UILabelLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
LBDeclare UILabel* (^labExtensionOfTouchSide)(UIEdgeInsets insets);

/** 扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
LBDeclare UILabel* (^labExtensionOfTouchRects)(NSArray<NSString*>* rects);
@end
