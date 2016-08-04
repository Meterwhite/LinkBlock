//
//  NSURL+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkBlock.h"

@interface NSObject(NSURLLinkBlock)
/** 系统照片url转图像，缩略图 */
@property (nonatomic,copy,readonly) UIImage*         (^urlAssetsToUIImageByThumbnail)();
/** 系统照片url转图像，高清图 */
@property (nonatomic,copy,readonly) UIImage*         (^urlAssetsToUIImageByFullResolution)();
/** 系统照片url转图像，全屏相片 */
@property (nonatomic,copy,readonly) UIImage*         (^urlAssetsToUIImageByFullScreen)();
@property (nonatomic,copy,readonly) NSData*          (^urlToNSDataFromContents)();
@end
