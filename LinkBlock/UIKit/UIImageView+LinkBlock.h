//
//  UIImageView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/30.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIImageViewNew ([UIImageView new])
@interface NSObject(UIImageViewLinkBlock)
@property (nonatomic,copy,readonly) UIImageView*         (^img_viewImage)(UIImage* image);
@property (nonatomic,copy,readonly) UIImageView*         (^img_viewImageHighlight)(UIImage* image);
@property (nonatomic,copy,readonly) UIImageView*         (^img_viewImageStr)(NSString* imageStr);
@property (nonatomic,copy,readonly) UIImageView*         (^img_viewImageStrHighlight)(NSString* imageStr);
@property (nonatomic,copy,readonly) UIImageView*         (^img_viewHighlight)(BOOL b);
@end
