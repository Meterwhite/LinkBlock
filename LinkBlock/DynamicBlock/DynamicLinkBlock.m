//
//  DynamicLinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLinkBlock.h"
#import "DynamicLinkArgument.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlockInvocation.h"

@interface DynamicLinkBlock()
{
    
}
@property (nonatomic,strong) NSMutableArray<DynamicLinkArgument*>* items;

@end

@implementation DynamicLinkBlock
@synthesize objcTypesOfBlockArgs = _objcTypesOfBlockArgs;

+ (instancetype)dynamicLinkBlockWithCode:(NSString *)code
{
    DynamicLinkBlock * block = [[self alloc] initWithCode:code];
    if(!block.validate) return nil;
    return block;
}

- (instancetype)initWithCode:(NSString*)code
{
    self = [super init];
    if (self) {
        
        _stringValue = code;
        
        //blockName 字母+数字*空白*(
        NSRange rangeOfBlockName = [self.stringValue rangeOfString:@"[a-zA-Z_]+\\d*\\s*\\(" options:NSRegularExpressionSearch];
        NSString* blockName = [_stringValue substringWithRange:rangeOfBlockName];
        blockName = [blockName stringByReplacingOccurrencesOfString:@" " withString:@""];
        blockName = [blockName substringToIndex:blockName.length-1];
        _blockName = blockName;
        
        //block args
        if([NSObject classContainProperty:_blockName]){
            
            _validate = YES;
            id block = [NSObject valueForKey:_blockName];
            LinkBlockInvocation* inoke =[LinkBlockInvocation invocationWithBlock:block];
            NSMethodSignature* sig = inoke.methodSignature;
            NSMutableArray* objcTypesArr = [NSMutableArray new];
            for (NSUInteger i=1; i<sig.numberOfArguments; i++) {
                
                const char* objcType = [sig getArgumentTypeAtIndex:i];
                [objcTypesArr addObject:[NSString stringWithUTF8String:objcType]];
            }
            if(objcTypesArr.count){
                _objcTypesOfBlockArgs = [objcTypesArr copy];
            }
            _objcTypeOfBlockReturn = sig.methodReturnType;
            _lengthOfBlockReturn = sig.methodReturnLength;
        }else{
            
            _validate = NO;
        }
    }
    return self;
}

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

- (NSArray<NSString *> *)objcTypesOfBlockArgs
{
    if(!_objcTypesOfBlockArgs){
        _objcTypesOfBlockArgs = [NSArray new];
    }
    return _objcTypesOfBlockArgs;
}
@end
