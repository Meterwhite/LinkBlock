//
//  NSIndexPath+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/8.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#define NSIndexPathNew(idx) ([NSIndexPath indexPathWithIndex:idx])

@interface NSObject(NSIndexPathLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare NSIndexPath*      (^idxPathAdding)(NSUInteger idx);
LBDeclare NSIndexPath*      (^idxPathRemovingLast)(void);
LBDeclare NSUInteger        (^idxPathIndexAtPosition)(NSUInteger position);

#pragma mark - Foundation Speed/速度
LBDeclare BOOL              (^idxPathIsEqualSection)(NSInteger section);
LBDeclare BOOL              (^idxPathIsEqualRow)(NSInteger row);
LBDeclare BOOL              (^idxPathIsEqualItem)(NSInteger item);

#pragma mark - LinkBlock
LBDeclare NSArray*          (^idxPathToNSArray)(void);
LBDeclare NSString*         (^idxPathToNSStringUsingJson)(void);


@end
