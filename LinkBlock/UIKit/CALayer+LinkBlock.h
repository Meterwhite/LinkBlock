//
//  CALayer+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CALayerNew ([CALayer layer])
@interface  NSObject(CALayerLinkBlock)
@property (nonatomic,copy) CALayer*     (^layerAddSublayer)(CALayer* layer);
@property (nonatomic,copy) CALayer*     (^layerInsertSublayerAt)(CALayer* layer,unsigned idx);
@property (nonatomic,copy) CALayer*     (^layerInsertSublayerBelow)(CALayer* layer,CALayer* sibling);
@property (nonatomic,copy) CALayer*     (^layerInsertSublayerAbove)(CALayer* layer,CALayer* sibling);

@end
