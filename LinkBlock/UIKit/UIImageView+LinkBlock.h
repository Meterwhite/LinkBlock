//
//  UIImageView+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/30.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIImageViewNew ([UIImageView new])
@interface NSObject(UIImageViewLinkBlock)
@property (nonatomic,copy) UIImageView*         (^img_viewImage)(UIImage* image);
@property (nonatomic,copy) UIImageView*         (^img_viewImageStr)(NSString* imageStr);
@property (nonatomic,copy) UIImageView*         (^img_viewImageHighlight)(UIImage* image);
@property (nonatomic,copy) UIImageView*         (^img_viewImageStrHighlight)(NSString* imageStr);
@property (nonatomic,copy) UIImageView*         (^img_viewHighlight)(BOOL b);
@end
