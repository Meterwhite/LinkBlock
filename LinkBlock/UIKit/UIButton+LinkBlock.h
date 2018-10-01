//
//  UIButton+LinkBlock.h
//
//  Created by NOVO on 15/8/19.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIButtonNew
#define UIButtonNew ([UIButton buttonWithType:UIButtonTypeCustom])
#endif
@interface NSObject(UIButtonLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare UIButton* (^btnTitle)(NSString* title, UIControlState state);
LBDeclare UIButton* (^btnTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
LBDeclare UIButton* (^btnImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
LBDeclare UIButton* (^btnTitleColor)(UIColor* color , UIControlState state);
LBDeclare UIButton* (^btnImage)(UIImage* img, UIControlState state);
LBDeclare UIButton* (^btnBGImage)(UIImage* img, UIControlState state);
LBDeclare UIButton* (^btnAttributeTitle)(NSAttributedString* attrStr, UIControlState state);



#pragma mark - Foundation Speed/速度
LBDeclare UIButton* (^btnTitleUIControlStateNormal)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateHighlighted)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateDisabled)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateSelected)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateFocused)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateApplication)(NSString* title);
LBDeclare UIButton* (^btnTitleUIControlStateReserved)(NSString* title);
LBDeclare UIButton* (^btnTitleColorUIControlStateNormal)(UIColor* color);
LBDeclare UIButton* (^btnTitleColorUIControlStateHighlighted)(UIColor* color);
LBDeclare UIButton* (^btnBGImageUIControlStateNormal)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateHighlighted)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateDisabled)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateSelected)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateFocused)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateApplication)(UIImage* img);
LBDeclare UIButton* (^btnBGImageUIControlStateReserved)(UIImage* img);
LBDeclare UIButton* (^btnTitleColorUIControlStateDisabled)(UIColor* color);
LBDeclare UIButton* (^btnTitleColorUIControlStateSelected)(UIColor* color);
LBDeclare UIButton* (^btnTitleColorUIControlStateFocused)(UIColor* color);
LBDeclare UIButton* (^btnTitleColorUIControlStateApplication)(UIColor* color);
LBDeclare UIButton* (^btnTitleColorUIControlStateReserved)(UIColor* color);
LBDeclare UIButton* (^btnImageUIControlStateNormal)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateHighlighted)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateDisabled)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateSelected)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateFocused)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateApplication)(UIImage* img);
LBDeclare UIButton* (^btnImageUIControlStateReserved)(UIImage* img);



#pragma mark - Foundation Extend/多择
LBDeclare UIButton* (^btnTitleFont)(UIFont* font);
LBDeclare UIButton* (^btnTitleFontSystemSizeSet)(CGFloat size);
LBDeclare CGFloat   (^btnTitleFontSystemSizeGet)(void);



#pragma mark - LinkBlock
/** <^()>根据当前标题的亮色（40%）设置高亮状态标题色 */
LBDeclare UIButton* (^btnHighlightedTitleColorLightByNormalState)();
/** <^()>根据当前标题的暗色（40%）设置高亮状态标题色 */
LBDeclare UIButton* (^btnHighlightedTitleColorDarkByNormalState)();

@end




@interface UIButton(UIButtonLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
LBDeclare UIButton* (^btnExtensionOfTouchSide)(UIEdgeInsets insets);
/** <^()>扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
LBDeclare UIButton* (^btnExtensionOfTouchRects)(NSArray<NSString*>* rects);
@end

