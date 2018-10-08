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
@property LB_BK UITableView*       (^tab_viewDelegate)(id<UITableViewDelegate> delegate);
@property LB_BK UITableView*       (^tab_viewDataSource)(id<UITableViewDataSource> datasource);
@property LB_BK UITableView*       (^tab_viewShowsHorizontal)(BOOL b);
@property LB_BK UITableView*       (^tab_viewShowsVertical)(BOOL b);
@end
