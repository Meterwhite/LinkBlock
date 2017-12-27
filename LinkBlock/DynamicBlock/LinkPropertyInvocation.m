//
//  LinkPropertyInvocation.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkPropertyInvocation.h"
#import "LinkHelper.h"
#import "LinkBlock.h"
#import "LinkError.h"

@interface LinkPropertyInvocation()
@property (nonatomic,strong) NSInvocation* invocation;
@property (nonatomic,copy) NSString* command;
@end

@implementation LinkPropertyInvocation
+ (instancetype)invocationWithCommand:(NSString*)command
{
    return [[self alloc] initWithCommand:command];
}

- (instancetype)initWithCommand:(NSString*)command
{
    self = [super init];
    if (self) {
        NSMethodSignature* sig = [self methodSignatureForSelector:@selector(commandInvoke:)];
        self.invocation = [NSInvocation invocationWithMethodSignature:sig];
        self.invocation.target = self;
        self.invocation.selector = @selector(commandInvoke:);
        self.command = command;
    }
    return self;
}

- (id)commandInvoke:(id)target
{
    
    NSAssert([self.command isKindOfClass:[NSString class]], @"LinkBlock命令必须是objc字符串");
    
    //new 命令
    NSRegularExpression* regexOfNew = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z_]+\\d*New" options:0 error:0];
    NSRange rangeOfMatch = [regexOfNew rangeOfFirstMatchInString:self.command options:0 range:NSMakeRange(0, self.command.length)];
    if(rangeOfMatch.length){
        NSString* clzName = [self.command substringWithRange:rangeOfMatch];
        clzName = clzName.strTrimRight(@"New");
        Class clzz = NSClassFromString(clzName);
        if(clzz){
            return [[clzz alloc] init];
        }else if([[[self linkBlockCommandReflectList] allKeys] containsObject:self.command]){
            return [[self linkBlockCommandReflectList] objectForKey:self.command];
        }
    }
    
    
    //直接响应方法
    SEL sel = NSSelectorFromString(self.command);
    if([target respondsToSelector:sel]){
        [target methodSignatureForSelector:sel];
        
        NSMethodSignature* sig = [target methodSignatureForSelector:sel];
        if(sig.numberOfArguments>2){
            NSLog(@"DynamicLink Warning:%@,没有入参的方法调用!",self.command);
        };
        NSInvocation* invok = [NSInvocation invocationWithMethodSignature:sig];
        invok.selector = sel;
        [invok invokeWithTarget:target];
        __block id reV;
        [LinkHelper helpSwitchObjcType:sig.methodReturnType caseVoid:nil caseId:^{
            id val;
            [invok getReturnValue:&val];
            CFBridgingRetain(val);
            reV = val;
        } caseClass:^{
            Class val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithBytes:&val objCType:@encode(Class)];
        } caseIMP:^{
            IMP val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithBytes:&val objCType:@encode(IMP)];
        } caseSEL:^{
            SEL val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithBytes:&val objCType:@encode(SEL)];
        } caseDouble:^{
            double val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithDouble:val];
        } caseFloat:^{
            float val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithFloat:val];
        } casePointer:^{
            SEL val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithBytes:&val objCType:@encode(void*)];
        } caseCharPointer:^{
            char* val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithBytes:&val objCType:@encode(char*)];
        } caseUnsignedLong:^{
            unsigned long val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithUnsignedLong:val];
        } caseUnsignedLongLong:^{
            unsigned long long val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithUnsignedLongLong:val];
        } caseLong:^{
            long val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithLong:val];
        } caseLongLong:^{
            long long val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithLongLong:val];
        } caseInt:^{
            int val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithInt:val];
        } caseUnsignedInt:^{
            unsigned int val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithUnsignedInt:val];
        } caseBOOL_Char_xyShort:^{
            int val;
            [invok getReturnValue:&val];
            reV = [NSNumber numberWithInt:val];
        } caseCGRect:^{
            CGRect val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCGRect:val];
        } caseNSRange:^{
            NSRange val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithRange:val];
        } caseCGSize:^{
            CGSize val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCGSize:val];
        } caseCGPoint:^{
            CGPoint val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCGPoint:val];
        } caseCGVector:^{
            CGVector val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCGVector:val];
        } caseUIEdgeInsets:^{
            UIEdgeInsets val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithUIEdgeInsets:val];
        } caseUIOffset:^{
            UIOffset val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithUIOffset:val];
        } caseCATransform3D:^{
            CATransform3D val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCATransform3D:val];
        } caseCGAffineTransform:^{
            CGAffineTransform val;
            [invok getReturnValue:&val];
            reV = [NSValue valueWithCGAffineTransform:val];
        } caseNSDirectionalEdgeInsets:^{
            if (@available(iOS 11.0, *)) {
                NSDirectionalEdgeInsets val;
                [invok getReturnValue:&val];
                reV = [NSValue valueWithDirectionalEdgeInsets:val];
            }
        } defaule:^{
            NSLog(@"DynamicLink Error:不支持的结构体类型或共用体");
        }];
        return reV;
    }
    
END:
    return [LinkError errorWithCustomDescription:[NSString stringWithFormat:@"无法计算%@；不能识别的属性、命令或者无参方法"
                                                  ,self.command]];
}

static NSDictionary* _linkBlockCommandReflectList;
- (NSDictionary*)linkBlockCommandReflectList
{
    if(!_linkBlockCommandReflectList){
        _linkBlockCommandReflectList = @{
                                         @"AttrDictNew":NSMutableDictionaryNew
                                         };
    }
    return _linkBlockCommandReflectList;
}

static NSArray* _linkBlockUsingListOfva_list;
- (NSArray*)linkBlockUsingListOfva_list
{
    if(!_linkBlockUsingListOfva_list){
        _linkBlockUsingListOfva_list = @[];
    }
    return _linkBlockUsingListOfva_list;
}


#pragma mark - override
- (id)invokeWithTarget:(id)target
{
    if(target){
        [self.invocation setArgument:&target atIndex:2];
    }

    [self.invocation invoke];
    
    id reV;
    [self.invocation getReturnValue:&reV];
    CFBridgingRetain(reV);
    return reV;
}
@end
