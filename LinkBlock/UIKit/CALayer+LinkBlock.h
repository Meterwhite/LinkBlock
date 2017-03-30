//
//  CALayer+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef CALayerNew
#define CALayerNew ([CALayer layer])
#endif
@interface  NSObject(CALayerLinkBlock)
/** <^(CALayer* layer)> */
LBDeclare CALayer*     (^layerAddSublayer)(CALayer* layer);
/** <^(CALayer* layer,unsigned idx)> */
LBDeclare CALayer*     (^layerInsertSublayerAt)(CALayer* layer,unsigned idx);
/** <^(CALayer* layer,CALayer* sibling)> */
LBDeclare CALayer*     (^layerInsertSublayerBelow)(CALayer* layer,CALayer* sibling);
/** <^(CALayer* layer,CALayer* sibling)> */
LBDeclare CALayer*     (^layerInsertSublayerAbove)(CALayer* layer,CALayer* sibling);
@end
