//
//  UISearchBar+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 17/5/8.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef UISearchBarNew
#define UISearchBarNew ([UISearchBar new])
#endif

@interface NSObject(UISearchBarLinkBlock)
/** <^(NSString* text)> */
@property LB_BK       UISearchBar* (^searchBarText)(NSString* text);
/** <^(NSString* placeholder)> */
@property LB_BK       UISearchBar* (^searchBarPlaceholder)(NSString* placeholder);
/** <^(id<UISearchBarDelegate> delegate)> */
@property LB_BK       UISearchBar* (^searchBarDelegate)(id<UISearchBarDelegate> delegate);
/** <^(BOOL showsBookmarkButton)> */
@property LB_BK       UISearchBar* (^searchBarShowsBookmarkButton)(BOOL showsBookmarkButton);
/** <^(BOOL showsCancelButton)> */
@property LB_BK       UISearchBar* (^searchBarShowsCancelButton)(BOOL showsCancelButton);
/** <^(BOOL showsSearchResultsButton)> */
@property LB_BK       UISearchBar* (^searchBarShowsSearchResultsButton)(BOOL showsSearchResultsButton);
/** <^(UIImage* backgroundImage)> */
@property LB_BK       UISearchBar* (^searchBarBackgroundImage)(UIImage* backgroundImage);
#pragma mark - In LinkBlock
/** <^()> 获取文本框对象 */
@property LB_BK       UITextField* (^searchBarSearchField)(void);
/** <^(UIColor* color)> 可用于修改SearchBar边框颜色 */
@property LB_BK       UISearchBar* (^searchBarBackgroundImageColor)(UIColor* color);
/** <^(UIColor* color)> 可用于修改placeholder颜色 */
@property LB_BK       UISearchBar* (^searchBarPlaceholderColor)(UIColor* color);
@end
