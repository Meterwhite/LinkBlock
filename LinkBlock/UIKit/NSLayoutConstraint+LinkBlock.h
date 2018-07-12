//
//  NSLayoutConstraint+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2018/6/20.
//  Copyright © 2018年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSLayoutConstraintLinkBlock)
/** <^(CGFloat constant)> */
LBDeclare NSLayoutConstraint* (^constraintConstant)(CGFloat constant);
@end