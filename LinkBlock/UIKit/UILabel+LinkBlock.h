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

#pragma mark - Foundation Mirror/镜像
LBDeclare UILabel*         (^labAlignment)(NSTextAlignment alighment);
LBDeclare UILabel*         (^labNumberOfLines)(NSInteger lines);
LBDeclare UILabel*         (^labText)(NSString* txt);
LBDeclare UILabel*         (^labTextColor)(UIColor* color);
LBDeclare UILabel*         (^labFont)(UIFont* font);
LBDeclare UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
#pragma mark - Foundation Speed/速度
LBDeclare UILabel*         (^labAlignmentCenter)(void);
LBDeclare UILabel*         (^labAlignmentRight)(void);
LBDeclare UILabel*         (^labAlignmentLeft)(void);
#pragma mark - Foundation Extend/多择
LBDeclare CGFloat          (^labFontSystemSizeGet)(void);


#pragma mark - LinkBlock
/** 根据当前标题的亮色（40%）设置高亮状态标题色 */
LBDeclare UILabel*         (^labHighlightedTextColorLightByTextColor)();
/** 根据当前标题的暗色（40%）设置高亮状态标题色 */
LBDeclare UILabel*         (^labHighlightedTextColorDarkByTextColor)();


@end

#pragma mark - LinkBlock
@interface UILabel(UILabelLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
LBDeclare UILabel* (^labExtensionOfTouchSide)(UIEdgeInsets insets);

/** 扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
LBDeclare UILabel* (^labExtensionOfTouchRects)(NSArray<NSString*>* rects);
@end
