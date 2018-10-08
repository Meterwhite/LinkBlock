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
@property LB_BK UILabel*         (^labAlignment)(NSTextAlignment alighment);
@property LB_BK UILabel*         (^labNumberOfLines)(NSInteger lines);
@property LB_BK UILabel*         (^labText)(NSString* txt);
@property LB_BK UILabel*         (^labTextColor)(UIColor* color);
@property LB_BK UILabel*         (^labFont)(UIFont* font);
@property LB_BK UILabel*         (^labFontSystemSizeSet)(CGFloat fontSize);
#pragma mark - Foundation Speed/速度
@property LB_BK UILabel*         (^labAlignmentCenter)(void);
@property LB_BK UILabel*         (^labAlignmentRight)(void);
@property LB_BK UILabel*         (^labAlignmentLeft)(void);
#pragma mark - Foundation Extend/补充
@property LB_BK CGFloat          (^labFontSystemSizeGet)(void);


#pragma mark - LinkBlock
/** 根据当前标题的亮色（40%）设置高亮状态标题色 */
@property LB_BK UILabel*         (^labHighlightedTextColorLightByTextColor)(void);
/** 根据当前标题的暗色（40%）设置高亮状态标题色 */
@property LB_BK UILabel*         (^labHighlightedTextColorDarkByTextColor)(void);


@end

#pragma mark - LinkBlock
@interface UILabel(UILabelLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
@property LB_BK UILabel* (^labExtensionOfTouchSide)(UIEdgeInsets insets);

/** 扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
@property LB_BK UILabel* (^labExtensionOfTouchRects)(NSArray<NSString*>* rects);
@end
