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
/** <^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)> */
LBDeclare UIButton* (^btnTitleEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
/** <^(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)> */
LBDeclare UIButton* (^btnImageEdgeInsets)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

#pragma mark - Title
/** <^(NSString* title, UIControlState state)> */
LBDeclare UIButton* (^btnTitle)(NSString* title, UIControlState state);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateNormal)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateHighlighted)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateDisabled)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateSelected)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateFocused)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateApplication)(NSString* title);
/** <^(NSString* title)> */
LBDeclare UIButton* (^btnTitleUIControlStateReserved)(NSString* title);
#pragma mark - Title Color
/** <^(UIColor* color , UIControlState state)> */
LBDeclare UIButton* (^btnTitleColor)(UIColor* color , UIControlState state);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateNormal)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateHighlighted)(UIColor* color);
/** <^()>根据当前标题的亮色（40%）设置高亮状态标题色 */
LBDeclare UIButton* (^btnHighlightedTitleColorLightByNormalState)();
/** <^()>根据当前标题的暗色（40%）设置高亮状态标题色 */
LBDeclare UIButton* (^btnHighlightedTitleColorDarkByNormalState)();
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateDisabled)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateSelected)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateFocused)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateApplication)(UIColor* color);
/** <^(UIColor* color)> */
LBDeclare UIButton* (^btnTitleColorUIControlStateReserved)(UIColor* color);
#pragma mark - AttributedString
/** <^(NSAttributedString* attrStr, UIControlState state)> */
LBDeclare UIButton* (^btnAttributeTitle)(NSAttributedString* attrStr, UIControlState state);

#pragma mark - Image
/** <^(UIImage* img, UIControlState state)> */
LBDeclare UIButton* (^btnImage)(UIImage* img, UIControlState state);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateNormal)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateHighlighted)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateDisabled)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateSelected)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateFocused)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateApplication)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnImageUIControlStateReserved)(UIImage* img);

#pragma mark - BG Image
/** <^(UIImage* img, UIControlState state)> */
LBDeclare UIButton* (^btnBGImage)(UIImage* img, UIControlState state);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateNormal)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateHighlighted)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateDisabled)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateSelected)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateFocused)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateApplication)(UIImage* img);
/** <^(UIImage* img)> */
LBDeclare UIButton* (^btnBGImageUIControlStateReserved)(UIImage* img);

/** <^(UIFont* font)> */
LBDeclare UIButton* (^btnTitleFont)(UIFont* font);
/** <^(CGFloat size)> */
LBDeclare UIButton* (^btnTitleFontSystemSizeSet)(CGFloat size);
/** <^()> */
LBDeclare CGFloat   (^btnTitleFontSystemSizeGet)(void);
@end

@interface UIButton(UIButtonLinkBlock)
/** 扩展触摸识别区域；如果扩展范围和其它控件重叠，应该禁用它的交互或者将本控件置于它之上； */
LBDeclare UIButton* (^btnExtensionOfTouchSide)(UIEdgeInsets insets);
/** <^()>扩展出没识别区域；rects内是参考自身坐标系的相对位置 */
LBDeclare UIButton* (^btnExtensionOfTouchRects)(NSArray<NSString*>* rects);
/** <^(NSArray<UIView*>* toControls)>扩展高亮事件传递到其它控件；支持包括UIButton UIControl UILabel UIImageView UITableViewCell UICollectionViewCell */
LBDeclare UIButton* (^btnExtensionOfHighlighted)(NSArray<UIView*>* toControls);
@end

