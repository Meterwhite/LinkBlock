//
//  UITableView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/9/28.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(UITableViewLinkBlock)
/** <^(id<UITableViewDelegate> delegate)> */
@property (nonatomic,copy,readonly) UITableView*       (^tab_viewDelegate)(id<UITableViewDelegate> delegate);
/** <^(id<UITableViewDataSource> datasource)> */
@property (nonatomic,copy,readonly) UITableView*       (^tab_viewDataSource)(id<UITableViewDataSource> datasource);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UITableView*       (^tab_viewShowsHorizontal)(BOOL b);
/** <^(BOOL b)> */
@property (nonatomic,copy,readonly) UITableView*       (^tab_viewShowsVertical)(BOOL b);
@end
