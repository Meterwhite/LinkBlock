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
    return ^id(CALayer* layer){
        
        LinkHandle_REF(CALayer)
        LinkGroupHandle_REF(layerAddSublayer,layer)
        [_self addSublayer:layer];
        return _self;
    };
}

- (CALayer *(^)(CALayer *, unsigned int))layerInsertSublayerAt
{
    return ^id(CALayer* layer,unsigned idx){
        
        LinkHandle_REF(CALayer)
        LinkGroupHandle_REF(layerInsertSublayerAt,layer,idx)
        [_self insertSublayer:layer atIndex:idx];
        return _self;
    };
}

- (CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerBelow
{
    return ^id(CALayer* layer,CALayer* sibling){
        
        LinkHandle_REF(CALayer)
        LinkGroupHandle_REF(layerInsertSublayerBelow,layer,sibling)
        [_self insertSublayer:layer below:sibling];
        return _self;
    };
}

- (CALayer *(^)(CALayer *, CALayer *))layerInsertSublayerAbove
{
    return ^id(CALayer* layer,CALayer* sibling){
        
        LinkHandle_REF(CALayer)
        LinkGroupHandle_REF(layerInsertSublayerAbove,layer,sibling)
        [_self insertSublayer:layer above:sibling];
        return _self;
    };
}

@end
