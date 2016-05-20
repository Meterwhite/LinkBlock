//
//  CALayer+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 16/5/19.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(CALayerLinkBlock)
- (CALayer *(^)(CALayer *))layerAddSublayer
{
    return ^(CALayer* layer){
        
        LinkError_REF_AUTO(CALayer, CALayer);
        [_self addSublayer:layer];
        return _self;
    };
}
- (void)setLayerAddSublayer:(CALayer *(^)(CALayer *))layerAddSublayer{};

- (CALayer *(^)(CALayer *, unsigned int))layerInsertSublayerAt
{
    return ^(CALayer* layer,unsigned idx){
        
        LinkError_REF_AUTO(CALayer, CALayer);
        [_self insertSublayer:layer atIndex:idx];
        return _self;
    };
}
- (void)setLayerInsertSublayerAt:(CALayer *(^)(CALayer *, unsigned int))layerInsertSublayerAt{};

- (CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerBelow
{
    return ^(CALayer* layer,CALayer* sibling){
        
        LinkError_REF_AUTO(CALayer, CALayer);
        [_self insertSublayer:layer below:sibling];
        return _self;
    };
}
- (void)setLayerInsertSublayerBelow:(CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerBelow{};

- (CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerAbove
{
    return ^(CALayer* layer,CALayer* sibling){
        
        LinkError_REF_AUTO(CALayer, CALayer);
        [_self insertSublayer:layer above:sibling];
        return _self;
    };
}
- (void)setLayerInsertSublayerAbove:(CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerAbove{};


@end
