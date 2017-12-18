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

- (id)invokeLinkWith:(id)linkObj args:(va_list)args_fp
{
    //无对象返回空
    if(!linkObj) goto END;
    
    //无code返回对象本身
    if(!self.code) return linkObj;
    
    va_list args;
    va_copy(args_fp, args);
    
    for (NSUInteger idxOfBlock = 0; idxOfBlock < self.countOfItems-1; idxOfBlock++) {
        
        DynamicLinkBlock* block = self.items[idxOfBlock];
        for (NSUInteger idxOfArgument = 0; idxOfArgument < block.countOfItems; idxOfArgument++) {
            DynamicLinkArgument* argument = [block argumentAt:idxOfArgument];
            
        }
        
    }

    
END:
    return [NSNull null];
}

#pragma mark - 构造
- (instancetype)initWithCode:(NSString*)code
{
    self = [super init];
    if (self) {
        _code = code;
        [self codeSplitting];
    }
    return self;
}
+ (instancetype)dynamicLinkWithCode:(NSString *)code
{
    return [[self alloc] initWithCode:code];
}

- (NSMutableArray<DynamicLinkBlock *> *)items
{
    if(!_items){
        _items = [NSMutableArray new];
    }
    return _items;
}

- (NSUInteger)countOfItems
{
    return self.items.count;
}

- (void)codeSplitting
{
    NSArray* blockStrings = [[LinkHelper help:_code] linkCodeSplite];
    [blockStrings enumerateObjectsUsingBlock:^(NSString*  _Nonnull blockString, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DynamicLinkBlock* dyLinkBlock = [DynamicLinkBlock dynamicLinkBlockWithCode:blockString];
        NSIndexPath* path0 = [NSIndexPath indexPathWithIndex:idx];
        [dyLinkBlock setValue:path0 forKey:@"indexPath"];
        [self.items addObject:dyLinkBlock];
    }];
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
    NSUInteger idx = [indexPath indexAtPosition:1];
    return  [block argumentAt:idx];
}

@end
