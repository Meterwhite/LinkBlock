//
//  LinkHelper.m
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/13.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import "LinkHelper.h"
#import "DynamicLink.h"
#import <objc/runtime.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface LinkHelper<__covariant ObjectType>()
@property (nonatomic,strong) id target;
@property (nonatomic,strong) JSContext* jscontext;
@end

@implementation LinkHelper

#pragma mark - 功能


- (BOOL)checkTargetType:(Class)type
{
    return [self.target isKindOfClass:type];
}

- (NSArray<NSString *> *)actionCommandSplitFromLinkCode
{
    if(![self checkTargetType:[NSString class]]) return nil;
    
    NSString* code = [self.target copy];
    if([code characterAtIndex:code.length-1] != '.'){
        code = [code stringByAppendingString:@"."];
    }
    NSMutableArray<NSString*>* blocksString = [NSMutableArray new];
    
    //函数名可空白(非贪婪个任意字符).
    //函数名.
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"[a-zA-Z_]+\\d*(\\s*\\(.*?\\)\\.|\\.)" options:0 error:nil];
    [regex enumerateMatchesInString:code options:0 range:NSMakeRange(0, code.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        
        [blocksString addObject: [code substringWithRange:NSMakeRange(result.range.location, result.range.length-1)]];
    }];
    
    return blocksString;
}

- (NSString *)functionNameSplitFromFunctionCode
{
    if(![self checkTargetType:[NSString class]]) return nil;
    
    NSRange rangeOfBlockName = [self.target rangeOfString:@"[a-zA-Z_]+\\d*\\s*\\(" options:NSRegularExpressionSearch];
    if(!rangeOfBlockName.length) return nil;
    NSString* functionName = [self.target substringWithRange:rangeOfBlockName];
    functionName = [functionName stringByReplacingOccurrencesOfString:@" " withString:@""];
    functionName = [functionName substringToIndex:functionName.length-1];
    return functionName;
}

- (NSString *)propertyNameFromPropertyCode
{
    if(![self checkTargetType:[NSString class]]) return nil;
    NSRange rangeOfPropertyName = [self.target rangeOfString:@"[a-zA-Z_]+\\d*" options:NSRegularExpressionSearch];
    if(!rangeOfPropertyName.length) return nil;
    NSString* propertyName = [self.target substringWithRange:rangeOfPropertyName];
    propertyName = [propertyName stringByReplacingOccurrencesOfString:@" " withString:@""];
    return propertyName;
}

- (NSValue*)valueFromValueCode
{
    if(![self checkTargetType:[NSString class]]){
        return nil;
    }
    if(!self.target){
        return nil;
    };
    
    NSString* code = [self.target copy];
    
    //NSString <可空白@"..."可空白>
    if([code rangeOfString:@"[\\s\\S]*@\"[\\s\\S]*\"[\\s\\S]*" options:NSRegularExpressionSearch].length){
        NSRange rangeOfMatch = [code rangeOfString:@"@\"[\\s\\S]*\"" options:NSRegularExpressionSearch];
        NSString* stringV = [code substringWithRange:NSMakeRange(rangeOfMatch.location+2, rangeOfMatch.length-3)];
        CFBridgingRetain(stringV);
        return [NSValue value:&stringV withObjCType:@encode(NSString*)];
    }
    
    //去空白
    code = [code stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:code];
    //整型
    int intV;
    if([scanner scanInt:&intV] && [scanner isAtEnd]){
        return [NSNumber numberWithInt:intV];
    }
    //double
    double doubleV;
    scanner.scanLocation = 0;
    if([scanner scanDouble:&doubleV] && [scanner isAtEnd]){
        return [NSNumber numberWithDouble:doubleV];
    }
    //十六进制整型
    unsigned unsignedV;
    scanner.scanLocation = 0;
    if([scanner scanHexInt:&unsignedV] && [scanner isAtEnd]){
        return [NSNumber numberWithUnsignedInt:unsignedV];
    }
    //十六进制浮点
    doubleV = 0.0;
    scanner.scanLocation = 0;
    if([scanner scanHexDouble:&doubleV] && [scanner isAtEnd]){
        return [NSNumber numberWithDouble:doubleV];
    }
    
    //布尔值
    BOOL boolV;
    if([code isEqualToString:@"YES"]     ||
       [code isEqualToString:@"NO"]      ||
       [code isEqualToString:@"true"]    ||
       [code isEqualToString:@"false"]) {
        boolV = [code isEqualToString:@"YES"]||[code isEqualToString:@"true"];
        return [NSNumber numberWithBool:boolV];
    }
    
    //char* "..."
    if([code rangeOfString:@"^\"[\\s\\S]*\"$" options:NSRegularExpressionSearch].length){
        const char* charV = [[code substringWithRange:NSMakeRange(1, [code length]-2)] UTF8String];
        return [NSValue valueWithBytes:&charV objCType:@encode(char*)];
    }
    
    //char 'A'
    if([code rangeOfString:@"^'\\w'$" options:NSRegularExpressionSearch].length){
        NSNumber* numberV = [NSNumber numberWithChar:[code characterAtIndex:1]];
        CFBridgingRetain(numberV);
        return [NSValue valueWithBytes:&numberV objCType:@encode(NSNumber*)];
    }
    
    //NSNumber @(number)
    if([code rangeOfString:@"^@\\([\\s\\S]*\\)$" options:NSRegularExpressionSearch].length){
        
        NSNumber* numberV = [NSNumber numberWithDouble:[[code substringWithRange:NSMakeRange(2, [code length]-3)] doubleValue]];
        CFBridgingRetain(numberV);
        return [NSValue valueWithBytes:&numberV objCType:@encode(NSNumber*)];
    }
    //NSNumber @number
    if([code rangeOfString:@"^@\\d+$" options:NSRegularExpressionSearch].length){
        NSNumber* numberV = [NSNumber numberWithDouble:
                             [[code substringWithRange:NSMakeRange(1, [code length]-1)]
                              doubleValue]];
        CFBridgingRetain(numberV);
        return [NSValue valueWithBytes:&numberV objCType:@encode(NSNumber*)];
    }
    //NSNumber @YES
    if([code isEqualToString:@"@YES"] || [code isEqualToString:@"@NO"] ||
       [code isEqualToString:@"@true"] || [code isEqualToString:@"@false"]){
        NSNumber* numberV =  [NSNumber numberWithBool:[code isEqualToString:@"@YES"]||[code isEqualToString:@"@true"]];
        CFBridgingRetain(numberV);
        return [NSValue valueWithBytes:&numberV objCType:@encode(NSNumber*)];
    }
    
    //SEL
    if([code rangeOfString:@"^@selector\\(.+\\)$" options:NSRegularExpressionSearch].length){
        //@selector(xxxx)
        NSString* selectorString = [code substringWithRange:NSMakeRange(10, [code length]-11)];
        selectorString = [selectorString stringByReplacingOccurrencesOfString:@" " withString:@""];
        SEL selectorV = NSSelectorFromString(selectorString);
        return [NSValue valueWithBytes:&selectorV objCType:@encode(SEL)];
    }
    
    
    /*********************
     NSValue支持的结构体
     *********************/
    if([code rangeOfString:@"^CGRectMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=4) return nil;
        CGRect rect =
        CGRectMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                   [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue],
                   [[[LinkHelper help:argsOfStringV[2]] numberEvalFromCode] doubleValue],
                   [[[LinkHelper help:argsOfStringV[3]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&rect withObjCType:@encode(CGRect)];
    }
    
    if([code rangeOfString:@"^CGSizeMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=2) return nil;
        CGSize size =
        CGSizeMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                   [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&size withObjCType:@encode(CGSize)];
    }
    
    if([code rangeOfString:@"^CGPointMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=2) return nil;
        CGPoint point =
        CGPointMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                    [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&point withObjCType:@encode(CGPoint)];
    }
    
    if([code rangeOfString:@"^NSMakeRange\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=2) return nil;
        NSRange range
        = NSMakeRange([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] unsignedIntegerValue],
                      [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] unsignedIntegerValue]);
        return [NSValue value:&range withObjCType:@encode(NSRange)];
    }
    
    if([code rangeOfString:@"^UIEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=4) return nil;
        UIEdgeInsets edgeInsets =
        UIEdgeInsetsMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                         [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue],
                         [[[LinkHelper help:argsOfStringV[2]] numberEvalFromCode] doubleValue],
                         [[[LinkHelper help:argsOfStringV[3]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&edgeInsets withObjCType:@encode(UIEdgeInsets)];
    }
    
    if([code rangeOfString:@"^CGVectorMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=2) return nil;
        CGVector vector =
        CGVectorMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                     [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&vector withObjCType:@encode(CGVector)];
    }
    
    if([code rangeOfString:@"^UIOffsetMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=2) return nil;
        UIOffset offset =
        UIOffsetMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                     [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&offset withObjCType:@encode(UIOffset)];
    }
    
    //CATransform3D无构造器和NSString形式所以都不支持识别
    
    if([code rangeOfString:@"^CGAffineTransformMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
        
        NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
        if(argsOfStringV.count!=6) return nil;
        CGAffineTransform affineTransform =
        CGAffineTransformMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                              [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue],
                              [[[LinkHelper help:argsOfStringV[2]] numberEvalFromCode] doubleValue],
                              [[[LinkHelper help:argsOfStringV[3]] numberEvalFromCode] doubleValue],
                              [[[LinkHelper help:argsOfStringV[4]] numberEvalFromCode] doubleValue],
                              [[[LinkHelper help:argsOfStringV[5]] numberEvalFromCode] doubleValue]);
        return [NSValue value:&affineTransform withObjCType:@encode(CGAffineTransform)];
    }
    
    if (@available(iOS 11.0, *)){
        if([code rangeOfString:@"^NSDirectionalEdgeInsetsMake\\(.+\\)$" options:NSRegularExpressionSearch].length){
            
            NSArray<NSString*>* argsOfStringV = [[LinkHelper help:code] functionArgumentSplitFromFunctionCallCode];
            if(argsOfStringV.count!=4) return nil;
            NSDirectionalEdgeInsets directionalEdgeInsets
            = NSDirectionalEdgeInsetsMake([[[LinkHelper help:argsOfStringV[0]] numberEvalFromCode] doubleValue],
                                          [[[LinkHelper help:argsOfStringV[1]] numberEvalFromCode] doubleValue],
                                          [[[LinkHelper help:argsOfStringV[2]] numberEvalFromCode] doubleValue],
                                          [[[LinkHelper help:argsOfStringV[3]] numberEvalFromCode] doubleValue]);
            return [NSValue value:&directionalEdgeInsets withObjCType:@encode(NSDirectionalEdgeInsets)];
        }
    }
    
    //类型
    if(NSClassFromString(code)){
        Class clz = NSClassFromString(code);
        return [NSValue valueWithBytes:&clz objCType:@encode(Class)];
    }
    
    //LinkBlock脚本代码
    NSArray<NSString*>* blockCommands = [[LinkHelper help:code] actionCommandSplitFromLinkCode];
    if(blockCommands.count){
        DynamicLink* link = [DynamicLink dynamicLinkWithCode:code];
        return [link invoke:[NSNull null] args:nil];
    }
    
    return nil;
}

- (NSArray<NSString *> *)functionArgumentSplitFromFunctionCallCode
{
    //检查格式
    //函数调用格式  字母[数字](...)
    if([self.target rangeOfString:@"[a-zA-Z_]+\\d*\\s*\\(.+\\)" options:NSRegularExpressionSearch].location == NSNotFound){
        return nil;
    }
    
    NSString* code = [self.target copy];
    NSRange range = [code rangeOfString:@"\\(.+\\)" options:NSRegularExpressionSearch];
    NSMutableArray* argsOfReturn = [NSMutableArray new];
    if(range.length){
        
        code = [code substringWithRange:NSMakeRange(range.location+1, range.length-2)];//去外层括号
        NSMutableArray<NSString*>* arrOfArgs = [[code componentsSeparatedByString:@","] mutableCopy];
        NSRegularExpression* leftRegex = [NSRegularExpression regularExpressionWithPattern:@"\\(" options:0 error:0];
        NSRegularExpression* rightRegex = [NSRegularExpression regularExpressionWithPattern:@"\\)" options:0 error:0];
        NSMutableString* stackString = [NSMutableString new];
        __block NSInteger flag = 0;//左括号 = -1，右括号 = 1
        [arrOfArgs enumerateObjectsUsingBlock:^(NSString * _Nonnull stringV, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSInteger rightFlag = [rightRegex numberOfMatchesInString:stringV options:0 range:NSMakeRange(0, stringV.length)];
            NSInteger leftFlag = [leftRegex numberOfMatchesInString:stringV options:0 range:NSMakeRange(0, stringV.length)];
            NSInteger currentFlag = rightFlag - leftFlag;
            if(flag == 0){
                
                //之前没有需要匹配的括号
                if(currentFlag == 0){
                    //当前没有需要匹配的括号 输出
                    [argsOfReturn addObject:stringV];
                }else{
                    //当前有需要匹配的括号 入栈
                    [stackString appendString:stringV];
                    [stackString appendString:@","];
                }
            }else{
                //之前有需要匹配的括号
                //入栈继续匹配
                [stackString appendString:stringV];
                if(flag + currentFlag == 0){
                    //一次匹配完成
                    [argsOfReturn addObject:[stackString copy]];//输出
                    [stackString setString:@""];//出栈
                }
            }
            //更新括号值
            flag += currentFlag;
        }];
    }
    return argsOfReturn;
}

- (NSNumber *)numberEvalFromCode
{
    //纯数字
    NSScanner* scanner = [[NSScanner alloc] initWithString:self.target];
    if([scanner scanInt:NULL] && [scanner isAtEnd]){
        return [NSNumber numberWithInt:[self.target intValue]];
    }
    scanner.scanLocation = 0;
    if([scanner scanDouble:NULL] && [scanner isAtEnd]){
        return [NSNumber numberWithDouble:[self.target doubleValue]];
    }
    
    //不能出现 } ; { 防止定义函数
    if([self.target containsString:@"{"]||
       [self.target containsString:@"}"]||
       [self.target containsString:@";"]){
        return nil;
    }
    
    //需要计算的情况交给JSCore
    JSValue* jsV = [self.jscontext evaluateScript:self.target];
    if(jsV.isNumber){
        return jsV.toNumber;
    }
    NSLog(@"DynamicLink Error:不能识别的值%@",self.target);
    return nil;
}

+ (void) helpSwitchObjcType:(const char*)objcType
                   caseVoid:(void(^)())caseVoid
                     caseId:(void(^)())caseId
                  caseClass:(void(^)())caseClass
                    caseIMP:(void(^)())caseIMP
                    caseSEL:(void(^)())caseSEL
                 caseDouble:(void(^)())caseDouble
                  caseFloat:(void(^)())caseFloat
                casePointer:(void(^)())casePointer
            caseCharPointer:(void(^)())caseCharPointer
           caseUnsignedLong:(void(^)())caseUnsignedLong
       caseUnsignedLongLong:(void(^)())caseUnsignedLongLong
                   caseLong:(void(^)())caseLong
               caseLongLong:(void(^)())caseLongLong
                    caseInt:(void(^)())caseInt
            caseUnsignedInt:(void(^)())caseUnsignedInt
      caseBOOL_Char_xyShort:(void(^)())casecaseBOOL_Char_xyShort
                 caseCGRect:(void(^)())caseCGRect
                caseNSRange:(void(^)())caseNSRange
                 caseCGSize:(void(^)())caseCGSize
                caseCGPoint:(void(^)())caseCGPoint
               caseCGVector:(void(^)())caseCGVector
           caseUIEdgeInsets:(void(^)())caseUIEdgeInsets
               caseUIOffset:(void(^)())caseUIOffset
          caseCATransform3D:(void(^)())caseCATransform3D
      caseCGAffineTransform:(void(^)())caseCGAffineTransform
caseNSDirectionalEdgeInsets:(void(^)())caseNSDirectionalEdgeInsets
                    defaule:(void(^)())defaule
{
    if(!objcType) return;
    
    do{
        if(caseVoid && strcmp(objcType, @encode(void)) == 0){
            caseVoid();
            break;
        };
        //常量则位移到类型符
        if (objcType[0] == _C_CONST) objcType++;
        
        if (objcType[0] == '@') {                                //id and block
            caseId();
            break;
        }else if (caseClass && strcmp(objcType, @encode(Class)) == 0){       //Class
            caseClass();
            break;
        }else if (caseIMP && strcmp(objcType, @encode(IMP)) == 0 ){         //IMP
            caseIMP();
            break;
        }else if (caseSEL && strcmp(objcType, @encode(SEL)) == 0) {         //SEL
            caseSEL();
            break;
        }else if (caseDouble && strcmp(objcType, @encode(double)) == 0){       //double
            caseDouble();
            break;
        }else if (caseFloat && strcmp(objcType, @encode(float)) == 0){       //float
            caseFloat();
            break;
        }else if (casePointer && objcType[0] == '^'){                           //pointer ( and const pointer)
            casePointer();
            break;
        }else if (caseCharPointer && strcmp(objcType, @encode(char *)) == 0) {      //char* (and const char*)
            caseCharPointer();
            break;
        }else if (caseUnsignedLong && strcmp(objcType, @encode(unsigned long)) == 0) {
            caseUnsignedLong();
            break;
        }else if (caseUnsignedLongLong && strcmp(objcType, @encode(unsigned long long)) == 0) {
            caseUnsignedLongLong();
            break;
        }else if (caseLong && strcmp(objcType, @encode(long)) == 0) {
            caseLong();
            break;
        }else if (caseLongLong && strcmp(objcType, @encode(long long)) == 0) {
            caseLongLong();
            break;
        }else if (caseInt && strcmp(objcType, @encode(int)) == 0) {
            caseInt();
            break;
        }else if (caseUnsignedInt && strcmp(objcType, @encode(unsigned int)) == 0) {
            caseUnsignedInt();
            break;
        }else if (casecaseBOOL_Char_xyShort &&
                  (strcmp(objcType, @encode(BOOL)) == 0           ||
                   strcmp(objcType, @encode(bool)) == 0           ||
                   strcmp(objcType, @encode(char)) == 0           ||
                   strcmp(objcType, @encode(short)) == 0          ||
                   strcmp(objcType, @encode(unsigned char)) == 0  ||
                   strcmp(objcType, @encode(unsigned short)) == 0) ){
                      casecaseBOOL_Char_xyShort();
                      break;
                  }else{                  //struct union and array
                      
                      if (caseCGRect && strcmp(objcType, @encode(CGRect)) == 0){
                          caseCGRect();
                          break;
                      }else if(caseCGPoint && strcmp(objcType, @encode(CGPoint)) == 0){
                          caseCGPoint();
                          break;
                      }else if (caseCGSize && strcmp(objcType, @encode(CGSize)) == 0){
                          caseCGSize();
                          break;
                      }else if (caseNSRange && strcmp(objcType, @encode(NSRange)) == 0){
                          caseNSRange();
                          break;
                      }else if (caseUIEdgeInsets && strcmp(objcType, @encode(UIEdgeInsets)) == 0){
                          caseUIEdgeInsets();
                          break;
                      }else if (caseCGVector && strcmp(objcType, @encode(CGVector)) == 0){
                          caseCGVector();
                          break;
                      }else if (caseUIOffset && strcmp(objcType, @encode(UIOffset)) == 0){
                          caseUIOffset();
                          break;
                      }else if(caseCATransform3D && strcmp(objcType, @encode(CATransform3D)) == 0){
                          caseCATransform3D();
                          break;
                      }else if(caseCGAffineTransform && strcmp(objcType, @encode(CGAffineTransform)) == 0){
                          caseCGAffineTransform();
                          break;
                      }
                      
                      if (@available(iOS 11.0, *)){
                          if(strcmp(objcType, @encode(NSDirectionalEdgeInsets)) == 0){
                              caseNSDirectionalEdgeInsets();
                              break;
                          }
                      }
                      
                      if(defaule){
                          defaule();
                          break;
                      }
                  }
    }while(0);
}


#pragma mark - 构造
- (instancetype)initWithTarget:(id)target
{
    _target = target;
    return self;
}
+ (id)help:(id)target
{
    return [[self alloc] initWithTarget:target];
}
- (JSContext *)jscontext
{
    if(!_jscontext){
        _jscontext = [[JSContext alloc] init];
    }
    return _jscontext;
}

#pragma mark - 消息转发
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//+ (BOOL)resolveClassMethod:(SEL)sel
//快速转发
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.target;
}

//普通转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [self.target methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //...
}

#pragma mark - NSObject
- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}




//- (void)dealloc
//{
//    @"end of help".nslog();
//}

@end
