//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIControlLinkBlock)
#pragma mark - Foundation Mirror/镜像
LBDeclare UIControl*  (^controlEnable)(BOOL enable);
LBDeclare UIControl*  (^controlSelected)(BOOL enable);
LBDeclare UIControl*  (^controlHighlighted)(BOOL enable);
LBDeclare UIControl*  (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
LBDeclare UIControl*  (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);

#pragma mark - Foundation Speed/速度
LBDeclare UIControl*  (^controlEnableYES)(void);
LBDeclare UIControl*  (^controlEnableNO)(void);


@end
