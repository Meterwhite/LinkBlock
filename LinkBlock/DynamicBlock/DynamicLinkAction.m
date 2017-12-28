//
//  DynamicLinkAction.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/15.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "DynamicLinkAction.h"
#import "DynamicLinkArgument.h"
#import "LinkBlockInvocation.h"
#import "LinkPropertyInvocation.h"
#import "NSObject+LinkBlock.h"
#import "LinkHelper.h"
#import "NSNil.h"

//调用类型
typedef enum LinkActionStyle{
    //未知调用
    LinkActionStyleUnknown  = 0,
    //block调用
    LinkActionStyleBlock    = 1,
    //暂不支持的函数调用
    LinkActionStyleFunction = 1 << 2,
    //属性调用，无参方法调用，指定命令调用
    LinkActionStyleProperty = 1 << 3
}LinkActionStyle;

@interface DynamicLinkAction()
{
    LinkActionStyle _mark;
}
@property (nonatomic,strong) NSMutableArray<DynamicLinkArgument*>* items;
@property (nonatomic,strong) NSPointerArray* pointsOfBridgingRetain;

@end

@implementation DynamicLinkAction
@synthesize objcTypeOfArguments = _objcTypeOfArguments;

+ (instancetype)dynamicLinkBlockWithCode:(NSString *)code index:(NSUInteger)index
{
    DynamicLinkAction * block = [[self alloc] initWithCode:code index:index];
    if(!block.validate) return nil;
    return block;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _validate = NO;
    }
    return self;
}

- (instancetype)initWithCode:(NSString*)code index:(NSUInteger)index0
{
    self = [self init];
    if (self) {
        
        //items
        NSArray<NSString*>* argsAsString = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        NSString* functionName = [[LinkHelper help:code] functionNameSplitFromFunctionCode];
        NSString* propertyName = [[LinkHelper help:code] propertyNameFromPropertyCode];
        
        _stringValue = code;
        _indexPath = [NSIndexPath indexPathWithIndex:index0];
        
        //是否是可调用的block属性
        if(functionName && [NSObject classContainProperty:functionName]){
            
            
            id block = [NSObject valueForKey:functionName];
            LinkBlockInvocation* inoke =[LinkBlockInvocation invocationWithBlock:block];
            NSMethodSignature* sig = inoke.methodSignature;
            NSMutableArray* objcTypesArr = [NSMutableArray new];
            for (NSUInteger i=1; i<sig.numberOfArguments; i++) {
                
                const char* objcType = [sig getArgumentTypeAtIndex:i];
                [objcTypesArr addObject:[NSString stringWithUTF8String:objcType]];
            }
            if(objcTypesArr.count){
                _objcTypeOfArguments = [objcTypesArr copy];
            }
            _actionName = functionName;
            _objcTypeOfActionReturn = sig.methodReturnType;
            _lengthOfActionReturn = sig.methodReturnLength;
            _numberOfArguments = sig.numberOfArguments - 1;
            _validate = YES;
            _mark = LinkActionStyleBlock;
            
            
            [argsAsString enumerateObjectsUsingBlock:^(NSString * _Nonnull argAsString, NSUInteger index1, BOOL * _Nonnull stop) {
                
                if(argAsString.length){
                    
                    DynamicLinkArgument* arg = [DynamicLinkArgument dynamicLinkArgumentFromVlueCode:argAsString];
                    if(arg){
                        NSIndexPath* indexPathOfArg = [NSIndexPath indexPathWithIndex:index0];
                        indexPathOfArg = [indexPathOfArg indexPathByAddingIndex:index1];
                        [arg setValue:indexPathOfArg forKey:@"indexPath"];
                        [self.items addObject:arg];
                    }
                }
            }];
            if(argsAsString.count > _numberOfArguments && LinkHelper.link_block_configuration_get_is_show_warning){
                
                NSLog(@"DynamicLink Warning:%@()中存在过多的%@个参数！如果这种做法有明确意义，请忽略该条警告",_actionName,@(argsAsString.count-_numberOfArguments));
            }
        }else if(!argsAsString && propertyName){
            //属性格式调用
            
            _actionName = propertyName;
            _objcTypeOfActionReturn = @encode(id);
            _lengthOfActionReturn = sizeof(id);
            _numberOfArguments = 0;
            _objcTypeOfArguments = nil;
            _validate = YES;
            _mark = LinkActionStyleProperty;
        }else if (functionName){
            
//            _objcTypeOfBlockReturn = @encode(void);
//            _lengthOfActionReturn = 0;
//            _numberOfArguments = 0;
//            _objcTypeOfArguments = nil;
//            _mark = LinkActionStyleFunction;
            if([[LinkHelper help:functionName] isUnavailableActionName]
               && LinkHelper.link_block_configuration_get_is_show_warning){
                NSLog(@"DynamicLink Warning:%@()明确禁止的调用!",functionName);
            }
            _validate = NO;
        }

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
            
            NSIndexPath* toPath;
            if(argument.indexPath.length>0){
                NSUInteger idxOfBlock = [_self.indexPath indexAtPosition:0];
                toPath = [NSIndexPath indexPathWithIndex:idxOfBlock];
            }
            if(argument.indexPath.length>1){
                NSUInteger idxOfArgument = [argument.indexPath indexAtPosition:1];
                toPath = [toPath indexPathByAddingIndex:idxOfArgument];
            }
            [argument setValue:toPath forKey:@"indexPath"];
        }];
    }
}

- (NSUInteger)index
{
    return [self.indexPath indexAtPosition:0];
}

- (NSUInteger)countOfItems
{
    return self.items.count;
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
    //节点1
    if(self.index != [indexPath indexAtPosition:0])
        return nil;
    //节点2
    NSUInteger idxMatched = [[self.items valueForKey:@"index"]
                             indexOfObject:@([indexPath indexAtPosition:1])];
    
    if(idxMatched == NSNotFound)
        return nil;
    
    return self.items[idxMatched];
}


- (id)invoke:(id)origin args:(va_list)vlist end:(BOOL*)end
{
    //验证的对象
    if(!self.validate) return [NSNull null];
    
    //action是否具有路径
    if(self.indexPath.length != 1) return [NSNull null];
    
    va_list*  list_copy = NULL;
    if(vlist){
        list_copy = malloc(sizeof(va_list));
        va_copy(*list_copy, vlist);
    }
    
    if(_mark & LinkActionStyleBlock){
        goto CODE_BLOCK_TYPE;
    }else if (_mark & LinkActionStyleProperty){
        goto CODE_PROPERTY_TYPE;
    }else if (_mark & LinkActionStyleFunction){
        goto CODE_FUNCTION_TYPE;
    }else{
        goto CODE_UNKNOWN_TYPE;
    }
    
    
CODE_BLOCK_TYPE:{
    
    if(![origin isKindOfClass:[NSObject class]]){
        return [NSNull null];
    }
    
    //构造block调用者
    id block = [origin valueForKeyPath:_actionName];
#error <#message#>
    LinkBlockInvocation* invocation =[LinkBlockInvocation invocationWithBlock:block];
    NSMethodSignature* signature = invocation.methodSignature;
    
    //验证是否有返回值
    if(strcmp(signature.methodReturnType, @encode(void)) == 0){
        [invocation invoke];
        return nil;
    }
    
    //入参
    for (NSUInteger idx_arg = 0; idx_arg < self.numberOfArguments && list_copy!=NULL; idx_arg++) {
        
        if(*end == YES) break;
        
        NSIndexPath* currentIndexPath = [NSIndexPath indexPathWithIndex:[self.indexPath indexAtPosition:0]];
        currentIndexPath = [currentIndexPath indexPathByAddingIndex:idx_arg];
        
        if([self containsIndexPathOfItem:currentIndexPath]){
            
            //脚本传参
            DynamicLinkArgument* arg = [self argumentAtIndexPath:currentIndexPath];
            [LinkHelper helpSwitchObjcType:arg.objcType caseVoid:nil caseId:^{
                void* val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
                [self.pointsOfBridgingRetain addPointer:val];
            } caseClass:^{
                Class val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseIMP:^{
                IMP val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseSEL:^{
                SEL val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseDouble:^{
                double val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseFloat:^{
                double val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } casePointer:^{
                void* val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCharPointer:^{
                char* val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLong:^{
                unsigned long val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLongLong:^{
                unsigned long long val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseLong:^{
                long val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseLongLong:^{
                long long val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseInt:^{
                int val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedInt:^{
                unsigned int val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseBOOL_Char_xyShort:^{
                int val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGRect:^{
                CGRect val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseNSRange:^{
                NSRange val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGSize:^{
                CGSize val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGPoint:^{
                CGPoint val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGVector:^{
                CGVector val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUIEdgeInsets:^{
                UIEdgeInsets val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUIOffset:^{
                UIOffset val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCATransform3D:^{
                CATransform3D val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGAffineTransform:^{
                CGAffineTransform val;
                [arg.objcValue getValue:&val];
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseNSDirectionalEdgeInsets:^{
                if (@available(iOS 11.0, *)) {
                    NSDirectionalEdgeInsets val;
                    [arg.objcValue getValue:&val];
                    [invocation setArgument:&val atIndex:idx_arg + 1];
                }
            } defaule:nil];
        }else{
            //方法传参
            
            const char* objcType = [signature getArgumentTypeAtIndex:idx_arg+1];
            
            [LinkHelper helpSwitchObjcType:objcType caseVoid:nil caseId:^{
                id val = va_arg(*list_copy, id);
                if(NSEqualNil(val)){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseClass:^{
                Class val = va_arg(*list_copy, Class);
                if(NSEqualNil(val)){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseIMP:^{
                IMP val = va_arg(*list_copy, IMP);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseSEL:^{
                SEL val = va_arg(*list_copy, SEL);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseDouble:^{
                double val = va_arg(*list_copy, double);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseFloat:^{
                float val = va_arg(*list_copy, double);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } casePointer:^{
                void* val = va_arg(*list_copy, void*);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCharPointer:^{
                char* val = va_arg(*list_copy, char*);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLong:^{
                unsigned long val = va_arg(*list_copy, unsigned long);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedLongLong:^{
                unsigned long long val = va_arg(*list_copy, unsigned long long);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseLong:^{
                long val = va_arg(*list_copy, long);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseLongLong:^{
                long long val = va_arg(*list_copy, long long);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseInt:^{
                int val = va_arg(*list_copy, int);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUnsignedInt:^{
                unsigned int val = va_arg(*list_copy, unsigned int);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseBOOL_Char_xyShort:^{
                int val = va_arg(*list_copy, int);
                if(!val){ *end = YES; return;}
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGRect:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGRect val = va_arg(*list_copy, CGRect);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseNSRange:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                NSRange val = va_arg(*list_copy, NSRange);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGSize:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGSize val = va_arg(*list_copy, CGSize);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGPoint:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGPoint val = va_arg(*list_copy, CGPoint);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGVector:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGVector val = va_arg(*list_copy, CGVector);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUIEdgeInsets:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                UIEdgeInsets val = va_arg(*list_copy, UIEdgeInsets);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseUIOffset:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                UIOffset val = va_arg(*list_copy, UIOffset);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCATransform3D:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CATransform3D val = va_arg(*list_copy, CATransform3D);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseCGAffineTransform:^{
                va_list check_list;
                va_copy(check_list, *list_copy);
                if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                    *end = YES;va_end(check_list);return;
                }
                va_end(check_list);
                CGAffineTransform val = va_arg(*list_copy, CGAffineTransform);
                [invocation setArgument:&val atIndex:idx_arg + 1];
            } caseNSDirectionalEdgeInsets:^{
                if (@available(iOS 11.0, *)) {
                    va_list check_list;
                    va_copy(check_list, *list_copy);
                    if(va_arg(check_list, void*)==NULL&&va_arg(check_list, NSInteger)==NSNotFound){
                        *end = YES;return;
                    }
                    NSDirectionalEdgeInsets val = va_arg(*list_copy, NSDirectionalEdgeInsets);
                    [invocation setArgument:&val atIndex:idx_arg + 1];
                }
            } defaule:nil];
        }
    }
    
    //调用
    [invocation invoke];
    
    __block BOOL returnID = NO;
    __block id re_id;
    __block BOOL returnNSNumber = NO;
    __block NSNumber* re_nsnumber;
    __block BOOL returnNSValue = NO;
    __block NSValue* re_nsvalue;
    //取返回值
    [LinkHelper helpSwitchObjcType:self.objcTypeOfActionReturn caseVoid:nil caseId:^{
        returnID = YES;
        [invocation getReturnValue:&re_id];
    } caseClass:^{
        returnNSValue = YES;
        Class re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(Class)];
    } caseIMP:^{
        returnNSValue = YES;
        IMP re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(IMP)];
    } caseSEL:^{
        returnNSValue = YES;
        SEL re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(SEL)];
    } caseDouble:^{
        returnNSNumber = YES;
        double re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithDouble:re];
    } caseFloat:^{
        returnNSNumber = YES;
        float re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithFloat:re];
    } casePointer:^{
        returnNSValue = YES;
        void* re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(void*)];
    } caseCharPointer:^{
        returnNSValue = YES;
        char* re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(char*)];
    } caseUnsignedLong:^{
        returnNSNumber = YES;
        unsigned long re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedLong:re];
    } caseUnsignedLongLong:^{
        returnNSNumber = YES;
        unsigned long long re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedLongLong:re];
    } caseLong:^{
        returnNSNumber = YES;
        long re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithLong:re];
    } caseLongLong:^{
        returnNSNumber = YES;
        long long re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithLongLong:re];
    } caseInt:^{
        returnNSNumber = YES;
        int re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithInt:re];
    } caseUnsignedInt:^{
        returnNSNumber = YES;
        unsigned int re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithUnsignedInt:re];
    } caseBOOL_Char_xyShort:^{
        returnNSNumber = YES;
        int re;
        [invocation getReturnValue:&re];
        re_nsnumber = [NSNumber numberWithInt:re];
    } caseCGRect:^{
        returnNSValue = YES;
        CGRect re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGRect)];
    } caseNSRange:^{
        returnNSValue = YES;
        NSRange re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(NSRange)];
    } caseCGSize:^{
        returnNSValue = YES;
        CGSize re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGSize)];
    } caseCGPoint:^{
        returnNSValue = YES;
        CGPoint re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGPoint)];
    } caseCGVector:^{
        returnNSValue = YES;
        CGVector re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGVector)];
    } caseUIEdgeInsets:^{
        returnNSValue = YES;
        UIEdgeInsets re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(UIEdgeInsets)];
    } caseUIOffset:^{
        returnNSValue = YES;
        UIOffset re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(UIOffset)];
    } caseCATransform3D:^{
        returnNSValue = YES;
        CATransform3D re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CATransform3D)];
    } caseCGAffineTransform:^{
        returnNSValue = YES;
        CGAffineTransform re;
        [invocation getReturnValue:&re];
        re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(CGAffineTransform)];
    } caseNSDirectionalEdgeInsets:^{
        returnNSValue = YES;
        if (@available(iOS 11.0, *)) {
            NSDirectionalEdgeInsets re;
            [invocation getReturnValue:&re];
            re_nsvalue = [NSValue valueWithBytes:&re objCType:@encode(NSDirectionalEdgeInsets)];
        }
    } defaule:nil];
    
    
    free(list_copy);
    va_end(*list_copy);
    
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
    
    //****************属性格式****************
CODE_PROPERTY_TYPE:{
    
    free(list_copy);
    va_end(*list_copy);
    LinkPropertyInvocation* invocation = [LinkPropertyInvocation invocationWithCommand:_actionName];
    return [invocation invokeWithTarget:origin];
}
    
    //****************方法调用****************
CODE_FUNCTION_TYPE:{
    
    free(list_copy);
    va_end(*list_copy);
    return nil;
}
    
    //****************未知类型****************
CODE_UNKNOWN_TYPE:
    
    free(list_copy);
    va_end(*list_copy);
    NSLog(@"DynamicLink Error:不能识别或不支持的调用%@", _actionName);
    return nil;
}

- (NSPointerArray *)pointsOfBridgingRetain
{
    if(!_pointsOfBridgingRetain){
        _pointsOfBridgingRetain = [NSPointerArray weakObjectsPointerArray];
    }
    return _pointsOfBridgingRetain;
}

- (NSMutableArray<DynamicLinkArgument*>*)items
{
    if(!_items){
        _items = [NSMutableArray new];
    }
    return _items;
}

- (void)dealloc
{
    for (NSUInteger i = 0; i < self.pointsOfBridgingRetain.count; i++) {
        CFBridgingRelease([self.pointsOfBridgingRetain pointerAtIndex:i]);
    }
}
@end
