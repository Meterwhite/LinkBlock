//
//  DynamicLinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLinkBlock.h"
#import "DynamicLinkArgument.h"

@interface DynamicLinkBlock()
@property (nonatomic,strong) NSMutableArray<DynamicLinkArgument*>* items;
@end

@implementation DynamicLinkBlock

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    [self reSetItemsIndexPath];
}

- (void)reSetItemsIndexPath
{
    if(self.countOfItems != 0){
        
        __weak typeof(self) _self = self;
        [self.items enumerateObjectsUsingBlock:^(DynamicLinkArgument * _Nonnull argument, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSIndexPath* pathOfArgument = argument.indexPath;
            NSIndexPath* newPathOfArgument;
            NSUInteger idxOfBlock , idxOfArgument;
            if(pathOfArgument.length>0){
                idxOfBlock = [_self.indexPath indexAtPosition:0];
                newPathOfArgument = [NSIndexPath indexPathWithIndex:idxOfBlock];
            }
            if(pathOfArgument.length>1){
                idxOfArgument = [argument.indexPath indexAtPosition:1];
                [newPathOfArgument indexPathByAddingIndex:idxOfArgument];
            }
        }];
    }
}
@end
