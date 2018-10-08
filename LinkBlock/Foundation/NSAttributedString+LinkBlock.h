//
//  NSAttributedString+LinkBlock.h
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSAttributedStringLinkBlock)

#pragma mark - Foundation Mirror/镜像
@property LB_BK BOOL     (^attr_strIsEqualToAttrStr)(NSAttributedString* attrStr);
@property LB_BK NSNumber*(^attr_strIsEqualToAttrStrAs)(NSAttributedString* attrStr);



#pragma mark - Foundation Speed/速度
/** use boundingRectWithSize */
@property LB_BK CGRect   (^attr_strSize)(CGFloat maxWidth);
@property LB_BK NSValue* (^attr_strSizeAs)(CGFloat maxWidth);
@property LB_BK CGRect   (^attr_strSizeWithOptions)(CGFloat maxWidth, NSStringDrawingOptions optoins);
@property LB_BK NSValue* (^attr_strSizeWithOptionsAs)(CGFloat maxWidth, NSStringDrawingOptions optoins);


#pragma mark - Weak coding/弱类型编码
/** switch link to paramiter */
@property LB_BK UIImage* (^attr_strDrawToImageAsWhatSet)(UIImage* image, CGRect rect);
/** switch link to paramiter */
@property LB_BK UIView* (^attr_strSetToControlAsWhatSet)(UIView* control);


@end
