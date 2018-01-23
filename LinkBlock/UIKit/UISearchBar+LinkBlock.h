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
LBDeclare       UISearchBar* (^searchBarText)(NSString* text);
/** <^(NSString* placeholder)> */
LBDeclare       UISearchBar* (^searchBarPlaceholder)(NSString* placeholder);
/** <^(id<UISearchBarDelegate> delegate)> */
LBDeclare       UISearchBar* (^searchBarDelegate)(id<UISearchBarDelegate> delegate);
/** <^(BOOL showsBookmarkButton)> */
LBDeclare       UISearchBar* (^searchBarShowsBookmarkButton)(BOOL showsBookmarkButton);
/** <^(BOOL showsCancelButton)> */
LBDeclare       UISearchBar* (^searchBarShowsCancelButton)(BOOL showsCancelButton);
/** <^(BOOL showsSearchResultsButton)> */
LBDeclare       UISearchBar* (^searchBarShowsSearchResultsButton)(BOOL showsSearchResultsButton);
/** <^(UIImage* backgroundImage)> */
LBDeclare       UISearchBar* (^searchBarBackgroundImage)(UIImage* backgroundImage);
#pragma mark - In LinkBlock
/** <^()> 获取文本框对象 */
LBDeclare       UITextField* (^searchBarSearchField)(void);
/** <^(UIColor* color)> 可用于修改SearchBar边框颜色 */
LBDeclare       UISearchBar* (^searchBarBackgroundImageColor)(UIColor* color);
/** <^(UIColor* color)> 可用于修改placeholder颜色 */
LBDeclare       UISearchBar* (^searchBarPlaceholderColor)(UIColor* color);
@end
