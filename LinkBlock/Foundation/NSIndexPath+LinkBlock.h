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
LBDeclare NSIndexPath*      (^idxPathAdding)(NSUInteger idx);
LBDeclare NSIndexPath*      (^idxPathRemovingLast)(void);
LBDeclare NSUInteger        (^idxPathIndexAtPosition)(NSUInteger position);
LBDeclare NSArray*          (^idxPathToNSArray)(void);
LBDeclare NSString*         (^idxPathToNSStringUsingJson)(void);

#pragma mark - 扩展
LBDeclare BOOL              (^idxPathIsEqualSection)(NSInteger section);
LBDeclare BOOL              (^idxPathIsEqualRow)(NSInteger row);
LBDeclare BOOL              (^idxPathIsEqualItem)(NSInteger item);
@end
