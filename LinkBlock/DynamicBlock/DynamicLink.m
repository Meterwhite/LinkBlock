//
//  DynamicLink.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLink.h"
#import "DynamicLinkBlock.h"
#import "DynamicLinkArgument.h"
#import "LinkHelper.h"

@interface DynamicLink()
@property (nonatomic,strong) NSMutableArray<DynamicLinkBlock*>* items;
@end

@implementation DynamicLink

- (id)invoke:(id)origin args:(va_list)list
{
    //无对象返回空
    if(!origin) return nil;
    
    //无code返回对象本身
    if(!self.code) return origin;
    
    BOOL isEnd = NO;
    id currentOrigin = origin;
    for (NSUInteger idx_bk = 0; idx_bk < self.countOfItems; idx_bk++) {
        
        DynamicLinkBlock* block = self.items[idx_bk];
        currentOrigin = [block invoke:currentOrigin args:list end:&isEnd];
        if(isEnd == YES){
            break;
        }
        if(!currentOrigin){
            //void返回类型后不能再有链条
            NSLog(@"DynamicLink Error:%@不可接受的返回类型",self.items[idx_bk].blockName);
            break;
        }
    }
    
    return currentOrigin;
}

#pragma mark - 构造
- (instancetype)initWithCode:(NSString*)code
{
    self = [super init];
    if (self) {
        
        _code = code;
        
        NSArray* blockStrings = [[LinkHelper help:_code] blocksSplitFromLinkCode];
        [blockStrings enumerateObjectsUsingBlock:^(NSString*  _Nonnull blockString, NSUInteger idx, BOOL * _Nonnull stop) {
            
            //构造block
            DynamicLinkBlock* dyLinkBlock = [DynamicLinkBlock dynamicLinkBlockWithCode:blockString];
            if(!dyLinkBlock){
                *stop = YES;
                return;
            }
            NSIndexPath* path0 = [NSIndexPath indexPathWithIndex:idx];
            //block.indexPath
            [dyLinkBlock setValue:path0 forKey:@"indexPath"];
            //block.items
            [self.items addObject:dyLinkBlock];
        }];
    }
    return self;
}
+ (instancetype)dynamicLinkWithCode:(NSString *)code
{
    return [[self alloc] initWithCode:code];
}
- (NSUInteger)countOfItems
{
    return self.items.count;
}
- (DynamicLinkBlock *)blockAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger idx = [indexPath indexAtPosition:0];
    if(idx > self.items.count-1 ) return nil;
    return self.items[idx];
}
- (DynamicLinkArgument *)argumentAtIndexPath:(NSIndexPath *)indexPath
{
    DynamicLinkBlock* block = [self blockAtIndexPath:indexPath];
    if(!block) return nil;
    return  [block argumentAtIndexPath:indexPath];
}
- (NSMutableArray<DynamicLinkBlock *> *)items
{
    if(!_items){
        _items = [NSMutableArray new];
    }
    return _items;
}
@end
