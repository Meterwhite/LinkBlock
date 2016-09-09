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
/** <^(CALayer* layer)> */
@property (nonatomic,copy,readonly) CALayer*     (^layerAddSublayer)(CALayer* layer);
/** <^(CALayer* layer,unsigned idx)> */
@property (nonatomic,copy,readonly) CALayer*     (^layerInsertSublayerAt)(CALayer* layer,unsigned idx);
/** <^(CALayer* layer,CALayer* sibling)> */
@property (nonatomic,copy,readonly) CALayer*     (^layerInsertSublayerBelow)(CALayer* layer,CALayer* sibling);
/** <^(CALayer* layer,CALayer* sibling)> */
@property (nonatomic,copy,readonly) CALayer*     (^layerInsertSublayerAbove)(CALayer* layer,CALayer* sibling);
@end
