//
//  NSError+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/12.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface NSObject(NSErrorLinkBlock)
LBDeclare NSObject*           (^errorValueInUserInfo)(id key);
@end
