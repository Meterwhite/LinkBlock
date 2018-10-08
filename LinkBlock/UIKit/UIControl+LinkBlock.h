//
//  UIControl+LinkBlock.h
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(UIControlLinkBlock)
#pragma mark - Foundation Mirror/镜像
@property LB_BK UIControl*  (^controlEnable)(BOOL enable);
@property LB_BK UIControl*  (^controlSelected)(BOOL enable);
@property LB_BK UIControl*  (^controlHighlighted)(BOOL enable);
@property LB_BK UIControl*  (^controlContentHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
@property LB_BK UIControl*  (^controlContentVerticalAlignment)(UIControlContentVerticalAlignment alignment);

#pragma mark - Foundation Speed/速度
@property LB_BK UIControl*  (^controlEnableYES)(void);
@property LB_BK UIControl*  (^controlEnableNO)(void);


@end
