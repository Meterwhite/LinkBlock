//
//  UITableView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/28.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UITableViewNew
#define UITableViewNew ([UITableView new])
#endif
@interface NSObject(UITableViewLinkBlock)

#pragma mark - Foundation Mirror/镜像
LBDeclare UITableView*       (^tab_viewDelegate)(id<UITableViewDelegate> delegate);
LBDeclare UITableView*       (^tab_viewDataSource)(id<UITableViewDataSource> datasource);
LBDeclare UITableView*       (^tab_viewShowsHorizontal)(BOOL b);
LBDeclare UITableView*       (^tab_viewShowsVertical)(BOOL b);
@end
