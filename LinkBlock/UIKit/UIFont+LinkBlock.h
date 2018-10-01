//
//  UIFont+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/11/2.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UIFontNew
#define UIFontNew(size) ([UIFont systemFontOfSize:size])
#endif
@interface NSObject(UIFontLinkBlock)

/** 根据字体获得高度*/
LBDeclare CGFloat       (^fontHeightWithLine)(NSUInteger line);
@end
