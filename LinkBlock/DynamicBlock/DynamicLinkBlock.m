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
#import "LinkHelper.h"

@interface DynamicLinkBlock()
{
    
}
@property (nonatomic,strong) NSMutableArray<DynamicLinkArgument*>* items;
@property (nonatomic,strong) NSPointerArray* pointsOfBridgingRetain;
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
        
        _validate = NO;
        _stringValue = code;
        //blockName 字母+数字*空白*(
        NSRange rangeOfBlockName = [self.stringValue rangeOfString:@"[a-zA-Z_]+\\d*\\s*\\(" options:NSRegularExpressionSearch];
        NSString* blockName = [_stringValue substringWithRange:rangeOfBlockName];
        blockName = [blockName stringByReplacingOccurrencesOfString:@" " withString:@""];
        blockName = [blockName substringToIndex:blockName.length-1];
        _blockName = blockName;
        
        //block args
        if([NSObject classContainProperty:_blockName]){
            
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
            _numberOfArguments = sig.numberOfArguments <= 1 ? 0 : sig.numberOfArguments;
            _validate = YES;
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

- (id)invoke:(id)origin args:(va_list)vlist end:(BOOL*)end
{
    if(!self.validate) return [NSNull null];
    
    if(![origin classContainProperty:_blockName]) return [NSNull null];
    
    if(self.indexPath.length != 1) return [NSNull null];
    
    id block = [origin valueForKey:_blockName];
    LinkBlockInvocation* invok =[LinkBlockInvocation invocationWithBlock:block];
    NSMethodSignature* signature = invok.methodSignature;
    
    //idxPath 去找自己的
    
    for (NSUInteger idx_arg = 0; idx_arg < self.numberOfArguments; idx_arg++) {
        
        NSIndexPath* currentIndexPath = [NSIndexPath indexPathWithIndex:[self.indexPath indexAtPosition:0]];
        [currentIndexPath indexPathByAddingIndex:idx_arg];
        
        if([self containsIndexPathOfItem:currentIndexPath]){
            
            //use code value
            DynamicLinkArgument* arg = [self argumentAtIndexPath:currentIndexPath];
            [LinkHelper helpSwitchObjcType:arg.objcType caseVoid:nil caseId:^{
                void* val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
                [self.pointsOfBridgingRetain addPointer:val];
            } caseClass:^{
                Class val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseIMP:^{
                IMP val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseSEL:^{
                SEL val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseDouble:^{
                double val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseFloat:^{
                double val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } casePointer:^{
                void* val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCharPointer:^{
                char* val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLong:^{
                unsigned long val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLongLong:^{
                unsigned long long val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseLong:^{
                long val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseLongLong:^{
                long long val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseInt:^{
                int val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedInt:^{
                unsigned int val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseBOOL_Char_xyShort:^{
                int val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGRect:^{
                CGRect val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSRange:^{
                NSRange val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGSize:^{
                CGSize val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGPoint:^{
                CGPoint val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGVector:^{
                CGVector val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIEdgeInsets:^{
                UIEdgeInsets val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIOffset:^{
                UIOffset val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCATransform3D:^{
                CATransform3D val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGAffineTransform:^{
                CGAffineTransform val;
                [arg.objcValue getValue:&val];
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSDirectionalEdgeInsets:^{
                if (@available(iOS 11.0, *)) {
                    NSDirectionalEdgeInsets val;
                    [arg.objcValue getValue:&val];
                    [invok setArgument:&val atIndex:idx_arg + 1];
                }
            } defaule:nil];
        }else{
            
            //use args value
            
            const char* objcType = [signature getArgumentTypeAtIndex:idx_arg+1];
            
            [LinkHelper helpSwitchObjcType:objcType caseVoid:nil caseId:^{
                id val = va_arg(vlist, id);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseClass:^{
                Class val = va_arg(vlist, Class);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseIMP:^{
                IMP val = va_arg(vlist, IMP);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseSEL:^{
                SEL val = va_arg(vlist, SEL);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseDouble:^{
                double val = va_arg(vlist, double);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseFloat:^{
                float val = va_arg(vlist, double);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } casePointer:^{
                void* val = va_arg(vlist, void*);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCharPointer:^{
                char* val = va_arg(vlist, char*);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLong:^{
                unsigned long val = va_arg(vlist, unsigned long);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLongLong:^{
                unsigned long long val = va_arg(vlist, unsigned long long);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseLong:^{
                long val = va_arg(vlist, long);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseLongLong:^{
                long long val = va_arg(vlist, long long);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseInt:^{
                int val = va_arg(vlist, int);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedInt:^{
                unsigned int val = va_arg(vlist, unsigned int);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseBOOL_Char_xyShort:^{
                int val = va_arg(vlist, int);
                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGRect:^{
                CGRect val = va_arg(vlist, CGRect);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSRange:^{
                NSRange val = va_arg(vlist, NSRange);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGSize:^{
                CGSize val = va_arg(vlist, CGSize);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGPoint:^{
                CGPoint val = va_arg(vlist, CGPoint);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGVector:^{
                CGVector val = va_arg(vlist, CGVector);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIEdgeInsets:^{
                UIEdgeInsets val = va_arg(vlist, UIEdgeInsets);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIOffset:^{
                UIOffset val = va_arg(vlist, UIOffset);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCATransform3D:^{
                CATransform3D val = va_arg(vlist, CATransform3D);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGAffineTransform:^{
                CGAffineTransform val = va_arg(vlist, CGAffineTransform);
//                if(!val){ *end = YES; return;}
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSDirectionalEdgeInsets:^{
                if (@available(iOS 11.0, *)) {
                    NSDirectionalEdgeInsets val = va_arg(vlist, NSDirectionalEdgeInsets);
//                    if(!val){ *end = YES; return;}
                    [invok setArgument:&val atIndex:idx_arg + 1];
                }
            } defaule:nil];
        }
    }
    
    
    return [NSNull null];
}

- (NSPointerArray *)pointsOfBridgingRetain
{
    if(!_pointsOfBridgingRetain){
        _pointsOfBridgingRetain = [NSPointerArray weakObjectsPointerArray];
    }
    return _pointsOfBridgingRetain;
}

- (void)dealloc
{
    for (NSUInteger i = 0; i < self.pointsOfBridgingRetain.count; i++) {
        CFBridgingRelease([self.pointsOfBridgingRetain pointerAtIndex:i]);
    }
}
@end
