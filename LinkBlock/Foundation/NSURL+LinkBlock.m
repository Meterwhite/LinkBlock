//
//  NSURL+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation NSObject(NSURLLinkBlock)


- (UIImage *(^)())urlAssetsToUIImageByThumbnail
{
    return ^(){
        LinkError_REF_AUTO(UIImage, NSURL);
        __block UIImage* re = nil;
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:_self resultBlock:^(ALAsset *asset) {
            re = [UIImage imageWithCGImage:[asset thumbnail]];
        } failureBlock:nil];
        return re;
    };
}
- (void)setUrlAssetsToUIImageByThumbnail:(UIImage *(^)())urlAssetsToUIImageByThumbnail{};

- (UIImage *(^)())urlAssetsToUIImageByFullScreen
{
    return ^(){
        LinkError_REF_AUTO(UIImage, NSURL);
        __block UIImage* re = nil;
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:_self resultBlock:^(ALAsset *asset) {
            re = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
        } failureBlock:nil];
        return re;
    };
}
- (void)setUrlAssetsToUIImageByFullScreen:(UIImage *(^)())urlAssetsToUIImageByFullScreen{};

- (UIImage *(^)())urlAssetsToUIImageByFullResolution
{
    return ^(){
        LinkError_REF_AUTO(UIImage, NSURL);
        __block UIImage* re = nil;
        ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
        [assetslibrary assetForURL:_self resultBlock:^(ALAsset *asset) {
            re = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
        } failureBlock:nil];
        return re;
    };
}
- (void)setUrlAssetsToUIImageByFullResolution:(UIImage *(^)())urlAssetsToUIImageByFullResolution{};

- (NSData *(^)())urlToNSDataFromContents
{
    return ^(){
        LinkError_REF_AUTO(NSData, NSURL);
        return [NSData dataWithContentsOfURL:_self];
    };
}
- (void)setUrlToNSDataFromContents:(NSData *(^)())urlToNSDataFromContents{};
@end
