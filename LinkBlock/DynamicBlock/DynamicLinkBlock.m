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
        _blockName = [[LinkHelper help:code] functionNameSplitFromFunctionCode];
        
        //property of runtime
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
        
        //items
        NSArray<NSString*>* argsAsString = [[LinkHelper help:code] functionArgumentSplitFromFunctionCode];
        [argsAsString enumerateObjectsUsingBlock:^(NSString * _Nonnull argAsString, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if(argAsString.length){
                
                DynamicLinkArgument* arg = [DynamicLinkArgument dynamicLinkArgumentFromVlueCode:argAsString];
                if(arg){
                    [self.items addObject:arg];
                    NSIndexPath* indexPathOfArg = [NSIndexPath indexPathWithIndex:self.index];
                    [indexPathOfArg indexPathByAddingIndex:idx];
                    [arg setValue:indexPathOfArg forKey:@"indexPath"];
                    [self.items addObject:arg];
                }
            }
        }];
        
    }
    return self;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    [self indexPathDidChanged];
}
- (void)indexPathDidChanged
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

- (NSUInteger)index
{
    return [self.indexPath indexAtPosition:0];
}

- (BOOL)containsIndexPathOfItem:(NSIndexPath *)indexPath
{
    //子节点路径至少为2
    if(indexPath.length<2)
        return NO;
    
    if(self.index != [indexPath indexAtPosition:0])
        return NO;
    
    return [[self.items valueForKey:@"index"] containsObject:@([indexPath indexAtPosition:1])];
}

- (DynamicLinkArgument *)argumentAtIndexPath:(NSIndexPath *)indexPath
{
    //子节点路径至少为2
    if(indexPath.length<2)
        return nil;
    
    if(self.index != [indexPath indexAtPosition:0])
        return nil;
    
    NSUInteger idxMatched = [[self.items valueForKey:@"index"]
                             indexOfObject:@([indexPath indexAtPosition:0])];
    if(idxMatched == NSNotFound)
        return nil;
    
    return self.items[idxMatched];
}


- (id)invoke:(id)origin args:(va_list)vlist end:(BOOL*)end
{
    //验证的对象
    if(!self.validate) return [NSNull null];
    //是否响应block
    
    
    if(![origin isKindOfClass:[NSObject class]] ||
       ![NSObject classContainProperty:_blockName]){
        return [NSNull null];
    }
         
    //block是否具有路径
    if(self.indexPath.length != 1) return [NSNull null];
    
    //构造block调用者
    id block = [origin valueForKey:_blockName];
    LinkBlockInvocation* invok =[LinkBlockInvocation invocationWithBlock:block];
    NSMethodSignature* signature = invok.methodSignature;
    
    //验证是否有返回值
    if(strcmp(signature.methodReturnType, @encode(void)) == 0){
        return nil;
    }
    
    //入参
    for (NSUInteger idx_arg = 0; idx_arg < self.numberOfArguments-1; idx_arg++) {
        
        if(*end == YES) break;
        
        NSIndexPath* currentIndexPath = [NSIndexPath indexPathWithIndex:[self.indexPath indexAtPosition:0]];
        [currentIndexPath indexPathByAddingIndex:idx_arg];
        
        if([self containsIndexPathOfItem:currentIndexPath]){
            
            //脚本传参
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
            //方法传参
            
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
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGRect val = va_arg(vlist, CGRect);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSRange:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                NSRange val = va_arg(vlist, NSRange);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGSize:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGSize val = va_arg(vlist, CGSize);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGPoint:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGPoint val = va_arg(vlist, CGPoint);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGVector:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGVector val = va_arg(vlist, CGVector);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIEdgeInsets:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                UIEdgeInsets val = va_arg(vlist, UIEdgeInsets);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseUIOffset:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                UIOffset val = va_arg(vlist, UIOffset);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCATransform3D:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CATransform3D val = va_arg(vlist, CATransform3D);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseCGAffineTransform:^{
                va_list check_list;
                va_copy(check_list, vlist);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGAffineTransform val = va_arg(vlist, CGAffineTransform);
                [invok setArgument:&val atIndex:idx_arg + 1];
            } caseNSDirectionalEdgeInsets:^{
                if (@available(iOS 11.0, *)) {
                    va_list check_list;
                    va_copy(check_list, vlist);
                    if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                        *end = YES;return;
                    }
                    NSDirectionalEdgeInsets val = va_arg(vlist, NSDirectionalEdgeInsets);
                    [invok setArgument:&val atIndex:idx_arg + 1];
                }
            } defaule:nil];
        }
    }
    
    //调用
    [invok invoke];
    
    __block BOOL returnID = NO;
    __block id re_id;
    __block BOOL returnNSNumber = NO;
    __block NSNumber* re_nsnumber;
    __block BOOL returnNSValue = NO;
    __block NSValue* re_nsvalue;
    //取返回值
    [LinkHelper helpSwitchObjcType:self.objcTypeOfBlockReturn caseVoid:nil caseId:^{
        returnID = YES;
        [invok getReturnValue:&re_id];
    } caseClass:^{
        returnNSValue = YES;
        Class re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(Class)];
    } caseIMP:^{
        returnNSValue = YES;
        IMP re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(IMP)];
    } caseSEL:^{
        returnNSValue = YES;
        SEL re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(SEL)];
    } caseDouble:^{
        returnNSNumber = YES;
        double re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithDouble:re];
    } caseFloat:^{
        returnNSNumber = YES;
        float re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithFloat:re];
    } casePointer:^{
        returnNSValue = YES;
        void* re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(void*)];
    } caseCharPointer:^{
        returnNSValue = YES;
        char* re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(char*)];
    } caseUnsignedLong:^{
        returnNSNumber = YES;
        unsigned long re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedLong:re];
    } caseUnsignedLongLong:^{
        returnNSNumber = YES;
        unsigned long long re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedLongLong:re];
    } caseLong:^{
        returnNSNumber = YES;
        long re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithLong:re];
    } caseLongLong:^{
        returnNSNumber = YES;
        long long re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithLongLong:re];
    } caseInt:^{
        returnNSNumber = YES;
        int re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithInt:re];
    } caseUnsignedInt:^{
        returnNSNumber = YES;
        unsigned int re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedInt:re];
    } caseBOOL_Char_xyShort:^{
        returnNSNumber = YES;
        int re;
        [invok getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithInt:re];
    } caseCGRect:^{
        returnNSValue = YES;
        CGRect re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGRect)];
    } caseNSRange:^{
        returnNSValue = YES;
        NSRange re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(NSRange)];
    } caseCGSize:^{
        returnNSValue = YES;
        CGSize re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGSize)];
    } caseCGPoint:^{
        returnNSValue = YES;
        CGPoint re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGPoint)];
    } caseCGVector:^{
        returnNSValue = YES;
        CGVector re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGVector)];
    } caseUIEdgeInsets:^{
        returnNSValue = YES;
        UIEdgeInsets re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(UIEdgeInsets)];
    } caseUIOffset:^{
        returnNSValue = YES;
        UIOffset re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(UIOffset)];
    } caseCATransform3D:^{
        returnNSValue = YES;
        CATransform3D re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CATransform3D)];
    } caseCGAffineTransform:^{
        returnNSValue = YES;
        CGAffineTransform re;
        [invok getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGAffineTransform)];
    } caseNSDirectionalEdgeInsets:^{
        returnNSValue = YES;
        if (@available(iOS 11.0, *)) {
            NSDirectionalEdgeInsets re;
            [invok getReturnValue:&re];
            re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(NSDirectionalEdgeInsets)];
        }
    } defaule:nil];
    
    if(returnID){
        CFBridgingRetain(re_id);
        return re_id;
    }else if (returnNSValue){
        return re_nsvalue;
    }else if (returnNSNumber){
        return re_nsnumber;
    }
    //其他结构体和共用体
    NSLog(@"DynamicLink Error:不支持的结构体类型或共用体");
    return nil;
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
