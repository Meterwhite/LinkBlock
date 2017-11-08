//
//  UIView+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"
#import <objc/runtime.h>

@implementation NSObject(UIViewLinkBlock)
- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))viewSetFrame
{
    return ^id(CGFloat x,CGFloat y, CGFloat width, CGFloat height){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetFrame,x,y,width,height)
        _self.frame= CGRectMake(x, y, width, height);
        return _self;
    };
}

- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))viewSetBounds
{
    return ^id(CGFloat x,CGFloat y, CGFloat width, CGFloat height){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetBounds,x,y,width,height)
        _self.bounds= CGRectMake(x, y, width, height);
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetX
{
    return ^id(CGFloat x){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetX,x)
        CGRect frame = _self.frame;
        frame.origin.x = x;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetY
{
    return ^id(CGFloat y){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetY,y)
        CGRect frame = _self.frame;
        frame.origin.y = y;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetCenterX
{
    return ^id(CGFloat centerX){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetCenterX,centerX)
        CGPoint center = _self.center;
        center.x = centerX;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetCenterY
{
    return ^id(CGFloat centerY){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetCenterY,centerY)
        CGPoint center = _self.center;
        center.y = centerY;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetWidth
{
    return ^id(CGFloat width){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetWidth,width)
        CGRect frame= _self.frame;
        frame.size.width= width;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetHeight
{
    return ^id(CGFloat height){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetHeight,height)
        CGRect frame= _self.frame;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat,CGFloat))viewSetSize
{
    return ^id(CGFloat width, CGFloat height){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetSize,width,height)
        CGRect frame= _self.frame;
        frame.size.width= width;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(NSInteger))viewSetTag
{
    return ^id(NSInteger tag){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetTag,tag)
        _self.tag = tag;
        return _self;
    };
}

- (UIView *(^)(CGFloat,CGFloat))viewSetOrigin
{
    return ^id(CGFloat x,CGFloat y){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetOrigin,x,y)
        CGRect frame= _self.frame;
        frame.origin.x= x;
        frame.origin.y= y;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(UIColor *))viewBGColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBGColor,color)
        _self.backgroundColor= color;
        return _self;
    };
}

- (UIView *(^)())viewBGColorRandom
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBGColorRandom)
        _self.backgroundColor= [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        return _self;
    };
}

- (UIView *(^)(CGFloat x,CGFloat y))viewSetCenter
{
    return ^id(CGFloat x,CGFloat y){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetCenter,x,y)
        _self.center = CGPointMake(x, y);
        return _self;
    };
}

- (UIView *(^)(UIColor *))viewBorderColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBorderColor,color)
        if([color isKindOfClass:[UIColor class]]){
            _self.layer.borderColor= color.CGColor;
        }
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewBorderWidth
{
    return ^id(CGFloat width){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBorderWidth,width)
        _self.layer.borderWidth= width;
        return _self;
    };
}

- (UIView *(^)(UIColor *, CGFloat))viewBorderColorAndWidth
{
    return ^id(UIColor* color,CGFloat w){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBorderColorAndWidth,color,w)
        _self.layer.borderWidth= w;
        _self.layer.borderColor= color.CGColor;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewCornerRadius
{
    return ^id(CGFloat cornerRadius){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCornerRadius,cornerRadius)
        _self.layer.cornerRadius= cornerRadius;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return ^id(BOOL flag){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewMasksToBounds,flag)
        _self.layer.masksToBounds= flag;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewClipsToBounds
{
    return ^id(BOOL flag){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewClipsToBounds,flag)
        _self.clipsToBounds= flag;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewEndEditing
{
    return ^id(BOOL force){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewEndEditing,force)
        [_self endEditing:force];
        return _self;
    };
}

- (BOOL (^)())viewIsFirstResponder
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsFirstResponder)
        return _self.isFirstResponder;
    };
}

- (UIView *(^)())viewBecomeFirstResponder
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBecomeFirstResponder)
        [_self becomeFirstResponder];
        return _self;
    };
}

- (UIView *(^)())viewResignFirstResponder
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewResignFirstResponder)
        [_self resignFirstResponder];
        return _self;
    };
}

- (UIView *(^)())viewFirstResponderSubViewForInput
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewFirstResponderSubViewForInput)
        __block UIView *re= nil;
        [_self.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
            
            if([v isKindOfClass:[UITextView class]] ||
               [v isKindOfClass:[UITextField class]]||
               [v isKindOfClass:[UISearchBar class]]){
                if(v.isFirstResponder){
                    re= v;
                    *stop= YES;
                }
            }else{
                re= v.viewFirstResponderSubViewForInput();
                if(re) {
                    *stop= YES;
                }
            }
        }];
        return re;
    };
}

- (CGRect (^)())viewConvertRectToWindow
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return CGRectZero;
        }
        LinkGroupHandle_VAL(viewConvertRectToWindow)
        return [_self.superview convertRect:_self.frame toView:nil];
    };
}

- (UIView *(^)(UIView *, BOOL))viewConvertSuperverTo
{
    return ^id(UIView* aView, BOOL isKeep){
        
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewConvertSuperverTo,aView,isKeep)
        if(isKeep){
            
            CGRect toAViewRect = [_self.superview convertRect:_self.frame toView:aView];
            [_self removeFromSuperview];
            [aView addSubview:_self];
            _self.frame=toAViewRect;
        }else{
            [_self removeFromSuperview];
            [aView addSubview:_self];
        }
        
        return _self;
    };
}

- (BOOL (^)(UIView *))viewIsSubviewTo
{
    return ^(UIView *theView){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsSubviewTo,theView)
        __block BOOL reIsBool= NO;
        if([_self.superview isEqual:theView]){
            reIsBool = YES;
        }else{
            reIsBool = _self.superview.viewIsSubviewTo(theView);
        }
        return reIsBool;
    };
}

- (UIView *(^)(BOOL))viewUserInteractionEnabled
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewUserInteractionEnabled,b)
        _self.userInteractionEnabled = b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMultipleTouchEnabled
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewMultipleTouchEnabled,b)
        _self.multipleTouchEnabled =b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewExclusiveTouch
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewExclusiveTouch,b)
        _self.exclusiveTouch = b;
        return _self;
    };
}

- (UIView *(^)(UIViewAutoresizing))viewAutoresizingMask
{
    return ^id(UIViewAutoresizing mask){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAutoresizingMask,mask)
        _self.autoresizingMask = mask;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewAlpha
{
    return ^id(CGFloat alpha){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAlpha,alpha)
        _self.alpha= alpha;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewOpaque
{
    return ^id(CGFloat opaque){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewOpaque,opaque)
        _self.opaque = opaque;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewHidden
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewHidden,b)
        _self.hidden= b;
        return _self;
    };
}

- (UIView *(^)())viewHiddenYES
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewHiddenYES)
        _self.hidden= YES;
        return _self;
    };
}

- (UIView *(^)())viewHiddenNO
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewHiddenNO)
        _self.hidden= NO;
        return _self;
    };
}

- (UIView *(^)(UIViewContentMode))viewContentMode
{
    return ^id(UIViewContentMode contentMode){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewContentMode,contentMode)
        _self.contentMode = contentMode;
        return _self;
    };
}

- (UIView *(^)(NSUInteger))viewSubviewAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSubviewAt,index)
        if(index< _self.subviews.count) return _self.subviews[index];
        return [[LinkError errorWithCustomDescription:[NSString stringWithFormat:@"数组%p越界",_self.subviews]] logError];
    };
}

- (NSUInteger (^)())viewIndexInSuperview
{
    return ^NSUInteger(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0;
        }
        LinkGroupHandle_VAL(viewIndexInSuperview)
        
        
        for (NSUInteger i=0; i<_self.superview.subviews.count; i++) {
            
            if([_self.superview.subviews[i] isEqual:_self]){
                return i;
            }
        }
        return 0;
    };
}

- (UIView *(^)())viewRemoveFromSuperview
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRemoveFromSuperview)
        [_self removeFromSuperview];
        return _self;
    };
}

- (UIView *(^)(NSUInteger))viewRemoveSubviewAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRemoveSubviewAt,index)
        return _self.viewSubviewAt(index).viewRemoveFromSuperview();
    };
}

- (UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex
{
    return ^id(NSUInteger index1, NSUInteger index2){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewExchangeSubviewByIndex,index1,index2)
        [_self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return _self;
    };
}

- (UIView *(^)())viewRemoveAllSubview
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRemoveAllSubview)
        
        [_self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        return _self;
    };
}

- (UIView *(^)(UIView *))viewAddSubview
{
    return ^id(UIView* subview){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAddSubview,subview)
        if([subview isKindOfClass:[UIView class]]){
            [_self addSubview:subview];
        }
        return _self;
    };
}

- (UIView *(^)(UIView *, ...))viewAddSubviews
{
    return ^id(UIView* view0,...){
        LinkHandle_REF(UIView)
        
        NSMutableArray* argList = [NSMutableArray new];
        if(view0){
            [argList addObject:view0];
            va_list args;
            va_start(args, view0);
            id parm;
            while (( parm = va_arg(args, UIView*)) ) {
                [argList addObject:parm];
            }
            va_end(args);
        }
        
        ///////////////////////
        //LinkGroupHandle_VAL
        if([self isKindOfClass:[LinkGroup class]]){
            
            LinkGroup* group = (LinkGroup*)self;
            NSMutableArray* newObjs = [NSMutableArray new];
            [group.linkObjects enumerateObjectsUsingBlock:^(id view, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if([view isKindOfClass:[UIView class]]){
                    
                    [argList enumerateObjectsUsingBlock:^(id  _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
                        [view addSubview:subView];
                    }];
                }else{
                    
                    [argList enumerateObjectsUsingBlock:^(id  _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
                        LinkError* error = [LinkError new];
                        error.needClass = @"UIView";
                        error.errorClass = NSStringFromClass([subView class]);
                        error.inFunc = @(__func__);
                        [newObjs addObject:error];
                    }];
                    group.linkObjects = newObjs;
                }
            }];
            return group;
        }
        //LinkGroupHandle_VAL
        ///////////////////////
        
        [argList enumerateObjectsUsingBlock:^(id  _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
            [_self addSubview:subView];
        }];
        return _self;
    };
}

- (UIView *(^)(__weak UIView *))viewAddToView
{
    return ^id(__weak UIView* view){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAddToView,view)
        if([view isKindOfClass:[UIView class]]){
            [view addSubview:_self];
        }
        return _self;
    };
}

- (NSMutableArray *(^)(__unsafe_unretained Class))viewFindSubviews
{
    return ^id(Class clazz){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewFindSubviews,clazz)
        NSMutableArray* re = [NSMutableArray new];
        [_self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull v, NSUInteger idx, BOOL * _Nonnull stop) {
            if([v isKindOfClass:clazz]) [re addObject:v];
        }];
        return re;
    };
}

- (UIView *(^)())viewSetNeedsLayout
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetNeedsLayout)
        [_self setNeedsLayout];
        return _self;
    };
}

- (UIView *(^)())viewLayoutIfNeeded
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetNeedsLayout)
        [_self viewLayoutIfNeeded];
        return _self;
    };
}

- (UIView *(^)())viewSetNeedsDisplay
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetNeedsLayout)
        [_self setNeedsDisplay];
        return _self;
    };
}

- (UIView *(^)(UIView *, NSUInteger))viewInsertSubviewAtIndex
{
    return ^id(UIView* view, NSUInteger index){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertSubviewAtIndex,view,index)
        [_self insertSubview:view atIndex:index];
        return _self;
    };
}

- (UIView *(^)(UIView *, NSUInteger))viewInsertToViewAtIndex
{
    return ^id(UIView* view, NSUInteger index){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertToViewAtIndex,view,index)
        [view insertSubview:_self atIndex:index];
        return _self;
    };
}

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewBelow
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertSubviewBelow,view,belowView)
        [_self insertSubview:view belowSubview:belowView];
        return _self;
    };
}

- (UIView *(^)(UIView *, UIView *))viewInsertToViewBelow
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertSubviewBelow,view,belowView)
        [view insertSubview:_self belowSubview:belowView];
        return _self;
    };
}

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewAbouve
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertSubviewAbouve,view,belowView)
        [_self insertSubview:view aboveSubview:belowView];
        return _self;
    };
}

- (UIView *(^)(UIView *, UIView *))viewInsertToViewAbouve
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewInsertSubviewAbouve,view,belowView)
        [view insertSubview:_self aboveSubview:belowView];
        return _self;
    };
}

- (UIView* (^)(BOOL))viewSubiewsExclusiveTouch
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSubiewsExclusiveTouch,b)
        [_self.subviews enumerateObjectsUsingBlock:^(UIView* subView, NSUInteger idx, BOOL *stop) {
            if([subView isKindOfClass:[UIView class]]){
                subView.exclusiveTouch = b;
            }
        }];
        return _self;
    };
}

- (UIView *(^)(UIRectCorner, CGSize))viewCornerRadiusSide
{
    return ^id(UIRectCorner side , CGSize radius){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCornerRadiusSide,side,radius)
        __block CGRect bounds = _self.bounds;
        if(_self.constraints.count){
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                if(constraint.firstAttribute==NSLayoutAttributeWidth){
                    bounds.size.width = constraint.constant;
                }else if (constraint.firstAttribute==NSLayoutAttributeHeight){
                    bounds.size.height = constraint.constant;
                }
            }];
        }
        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:side
                                                         cornerRadii:radius];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        shape.frame= bounds;
        shape.path= path.CGPath;
        _self.layer.mask = shape;
        return _self;
    };
}

- (BOOL (^)())viewIsZeroSize
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return YES;
        }
        LinkGroupHandle_VAL(viewIsZeroSize)
        if(CGRectEqualToRect(_self.frame, CGRectZero))
            return NO;
        return YES;
    };
}

- (CGFloat (^)())viewX
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewX)
        return _self.frame.origin.x;
    };
}

- (CGFloat (^)())viewY
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewY)
        return _self.frame.origin.y;
    };
}

- (CGFloat (^)())viewCenterX
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewCenterX)
        return _self.center.x;
    };
}

- (CGFloat (^)())viewCenterY
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewCenterY)
        return _self.center.y;
    };
}

- (CGSize (^)())viewSize
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return CGSizeZero;
        }
        LinkGroupHandle_VAL(viewSize)
        return _self.frame.size;
    };
}

- (CGFloat (^)())viewWidth
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewWidth)
        return _self.frame.size.width;
    };
}

- (CGFloat (^)())viewHeight
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewHeight)
        return _self.frame.size.height;
    };
}

- (CGPoint (^)())viewOrigin
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return CGPointZero;
        }
        LinkGroupHandle_VAL(viewOrigin)
        return _self.frame.origin;
    };
}

- (UIView *(^)(double))viewAnimateShakeHorizental
{
    return ^id(double duration){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateShakeHorizental,duration)
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = duration;
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        [_self.layer addAnimation:animation forKey:@"shake"];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveUp
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateMoveUp,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , -distance);
        }];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveDown
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateMoveDown,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , distance);
        }];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveRight
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateMoveRight,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,distance, 0);
        }];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveLeft
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateMoveLeft,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform, -distance, 0);
        }];
        
        return _self;
    };
}

- (UIView *(^)(double))viewAnimateShakeVertical
{
    return ^id(double duration){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateShakeVertical,duration)
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = duration;
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        
        [_self.layer addAnimation:animation forKey:@"shake"];
        return _self;
    };
}

- (UIView *(^)())viewAnimateAppleMotionEffects
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateAppleMotionEffects)
        // Motion effects are available starting from iOS 7.
        if (([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending))
        {
            
            UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                            type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            horizontalEffect.minimumRelativeValue = @(-10.0f);
            horizontalEffect.maximumRelativeValue = @( 10.0f);
            UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                          type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            verticalEffect.minimumRelativeValue = @(-10.0f);
            verticalEffect.maximumRelativeValue = @( 10.0f);
            UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
            motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
            
            [_self addMotionEffect:motionEffectGroup];
        }
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, BOOL))viewAnimatePulse
{
    return ^id(CGFloat scale,NSTimeInterval duration,BOOL repeat){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimatePulse,scale,duration,repeat)
        CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulseAnimation.duration = duration;
        pulseAnimation.toValue = [NSNumber numberWithFloat:scale];
        pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pulseAnimation.autoreverses = YES;
        pulseAnimation.repeatCount = repeat ? HUGE_VALF : 0;
        [_self.layer addAnimation:pulseAnimation forKey:@"pulse"];
        return _self;
    };
}

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromTop
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromTop,duration,repeatCount,shouldAutoreverse)
        
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.subtype = kCATransitionFromTop;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        [_self.layer addAnimation:transition forKey:@"oglFlipAnimation"];
        return _self;
    };
}

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromBottom
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromBottom,duration,repeatCount,shouldAutoreverse)
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.subtype = kCATransitionFromBottom;
        transition.duration = 1.0;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        [_self.layer addAnimation:transition forKey:@"oglFlipAnimation"];
        return _self;
    };
}

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromLeft
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromLeft,duration,repeatCount,shouldAutoreverse)
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.subtype = kCATransitionFromLeft;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        [_self.layer addAnimation:transition forKey:@"oglFlipAnimation"];
        return _self;
    };
}

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromRight
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromRight,duration,repeatCount,shouldAutoreverse)
        
        CATransition *transition = [CATransition animation];
        transition.type = @"oglFlip";
        transition.subtype = kCATransitionFromRight;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        [_self.layer addAnimation:transition
                           forKey:@"spin"];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToLeft
{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateRotateToLeft,angle,duration,repeatCount,shouldAutoreverse)
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = @(-angle);
        rotationAnimation.duration = duration;
        rotationAnimation.autoreverses = shouldAutoreverse;
        rotationAnimation.repeatCount = repeatCount;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_self.layer addAnimation:rotationAnimation
                          forKey:@"transform.rotation.z"];
        return _self;
    };
}

- (UIView *(^)(CGFloat, CGFloat, NSTimeInterval))viewAnimateOpacity
{
    return ^id(CGFloat from , CGFloat to , NSTimeInterval duration){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateOpacity,from,to,duration);
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
        anima.fromValue = @(from);
        anima.toValue = @(to);
        anima.duration = duration;
        [_self.layer addAnimation:anima forKey:@"opacityAniamtion"];
        return _self;
    };
}

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToRight
{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateRotateToRight,angle,duration,repeatCount,shouldAutoreverse)
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = @(angle);
        rotationAnimation.duration = duration;
        rotationAnimation.autoreverses = shouldAutoreverse;
        rotationAnimation.repeatCount = repeatCount;
        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [_self.layer addAnimation:rotationAnimation
                           forKey:@"transform.rotation.z"];
        return _self;
    };
}

- (UIView *(^)())viewAnimateRemove
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateRemove)
        [CATransaction begin];
        [_self.layer removeAllAnimations];
        [CATransaction commit];
        [CATransaction flush];
        return _self;
    };
}

- (BOOL (^)())viewAnimateIsDoing
{
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewAnimateIsDoing)
        return [_self.layer.animationKeys count];
    };
}

- (UIView *(^)())viewAnimatePause
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimatePause)
        CFTimeInterval pausedTime= [_self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        _self.layer.speed= 0.0;
        _self.layer.timeOffset= pausedTime;
        return _self;
    };
}

- (UIView *(^)())viewAnimateResume
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewAnimateResume)
        CFTimeInterval pausedTime= [_self.layer timeOffset];
        _self.layer.speed= 1.0;
        _self.layer.timeOffset= 0.0;
        _self.layer.beginTime= 0.0;
        CFTimeInterval timeSincePause= [_self.layer convertTime:CACurrentMediaTime() fromLayer:nil]- pausedTime;
        _self.layer.beginTime= timeSincePause;
        return _self;
    };
}

- (UIImage *(^)())viewSnapshot
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSnapshot)
        UIGraphicsBeginImageContextWithOptions(_self.bounds.size, YES, 0);
        [_self drawViewHierarchyInRect:_self.bounds afterScreenUpdates:YES];
        UIImage *re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}

- (UIView *(^)(UIView *))viewCopyX
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyX,fromView)
        CGRect frame = _self.frame;
        frame.origin.x = fromView.frame.origin.x;
        _self.frame= fromView.frame;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopyY
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyY,fromView)
        CGRect frame = _self.frame;
        frame.origin.y = fromView.frame.origin.y;
        _self.frame= fromView.frame;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopyFrame
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyFrame,fromView)
        _self.frame= fromView.frame;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopySize
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopySize,fromView)
        CGRect frame = _self.frame;
        frame.size= fromView.frame.size;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopyOrigin
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyOrigin,fromView)
        CGRect frame = _self.frame;
        frame.origin= fromView.frame.origin;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopyCenter
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyCenter,fromView)
        _self.center = fromView.center;
        return _self;
    };
}



- (UIView *(^)(UIView *))viewCopyCenterX
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyCenterX,fromView)
        CGPoint center = _self.center;
        center.x= fromView.center.x;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(UIView *))viewCopyCenterY
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewCopyCenterY,fromView)
        CGPoint center = _self.center;
        center.y= fromView.center.y;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(UIView *, CGFloat))viewTopTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewTopTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.y = toView.viewMaxY()+ margin;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(UIView *, CGFloat))viewBottomTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBottomTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.y = toView.frame.origin.y - margin;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(UIView *, CGFloat))viewLeftTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewLeftTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.x = toView.frame.origin.x - frame.size.width- margin;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(UIView *, CGFloat))viewRightTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRightTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.x = toView.viewMaxX() + margin;
        _self.frame = frame;
        return _self;
    };
}

- (CGFloat (^)())viewMaxX
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewMaxX)
        return CGRectGetMaxX(_self.frame);
    };
}

- (CGFloat (^)())viewMaxY
{
    return ^CGFloat(){
        LinkHandle_VAL_IFNOT(UIView){
            return 0.0;
        }
        LinkGroupHandle_VAL(viewMaxY)
        return CGRectGetMaxY(_self.frame);
    };
}

- (UIView *(^)())viewBringFrontInView
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBringFrontInView)
        if(_self.superview)
            [_self.superview bringSubviewToFront:_self];
        return _self;
    };
}

- (UIView *(^)())viewSendBackInView
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSendBackInView)
        if(_self.superview)
            [_self.superview sendSubviewToBack:_self];
        return _self;
    };
}

- (UIView *(^)())viewRemoveConstraints
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRemoveConstraints)
        [_self removeConstraints:_self.constraints];
        if(_self.superview){
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                if([constraint.firstItem isEqual:_self])
                    [_self.superview removeConstraint:constraint];
            }];
        }
        return _self;
    };
}

- (BOOL (^)())viewIsUsingAutolayout
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsUsingAutolayout)
        if([_self.constraints count]>1)
            return YES;
        return NO;
    };
}

- (BOOL (^)())viewIsUsingAutoresizing
{
    return ^BOOL(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsUsingAutoresizing)
        return _self.autoresizingMask;
    };
}

- (UIView *(^)())viewRemoveAutoresizing
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewRemoveAutoresizing)
        _self.autoresizingMask=UIViewAutoresizingNone;
        _self.translatesAutoresizingMaskIntoConstraints=NO;
        return _self;
    };
}

- (UIView *(^)())viewBeforeIndexView
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewBeforeIndexView)
        return _self.objBeforeInArr(_self.subviews);
    };
}

- (UIView *(^)())viewNextIndexView
{
    return ^id(){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewNextIndexView)
        return _self.objNextInArr(_self.subviews);
    };
}

- (BOOL (^)(UIView *))viewIsSuperviewTo
{
    return ^(UIView* aView){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsSuperviewTo,aView)
        __block BOOL re = NO;
        [aView viewEnumerateSuperviewUsingBlock:^(UIView *superview, BOOL *stop) {
            if([superview isEqual: _self]) {
                re = YES;*stop = re;
            }
        }];
        return re;
    };
}

- (UIView *(^)(CGFloat))viewSetWidthAspect
{
    return ^id(CGFloat newWidth){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetWidthAspect,newWidth)
        __block CGFloat w = 0;
        __block CGFloat h = 0;
        CGFloat k;
        CGFloat newHeight;
        if(_self.constraints.count){
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if(constraint.firstAttribute == NSLayoutAttributeWidth){
                    w = constraint.constant;
                }else if (constraint.firstAttribute == NSLayoutAttributeHeight){
                    h = constraint.constant;
                }
            }];
        }
        
        if(w && h){//使用autolayout时
            if(!w)  return _self;
            k =  newWidth/w;
            newHeight = k*h;
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if(constraint.firstAttribute == NSLayoutAttributeWidth){
                    constraint.constant = newWidth;
                }else if (constraint.firstAttribute == NSLayoutAttributeHeight){
                    constraint.constant = newHeight;
                }
            }];
        }else{
            w = _self.frame.size.width;
            h = _self.frame.size.height;
            k =  newWidth/w;
            if(!w)  return _self;
            newHeight = k*h;
            CGRect frame = _self.frame;
            frame.size.width = newWidth;
            frame.size.height = newHeight;
            _self.frame = frame;
        }
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetHeightAspect
{
    return ^id(CGFloat newHeight){
        LinkHandle_REF(UIView)
        LinkGroupHandle_REF(viewSetHeightAspect,newHeight)
        CGFloat k;
        CGFloat newWidth;
        __block CGFloat w = 0;
        __block CGFloat h = 0;
        if(_self.constraints.count){
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if(constraint.firstAttribute == NSLayoutAttributeWidth){
                    w = constraint.constant;
                }else if (constraint.firstAttribute == NSLayoutAttributeHeight){
                    h = constraint.constant;
                }
            }];
        }
        
        if(w && h){//使用autolayout时
            if(!h)  return _self;
            k =  newHeight/h;
            newWidth = k*w;
            [_self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if(constraint.firstAttribute == NSLayoutAttributeWidth){
                    constraint.constant = newWidth;
                }else if (constraint.firstAttribute == NSLayoutAttributeHeight){
                    constraint.constant = newHeight;
                }
            }];
        }else{
            w = _self.frame.size.width;
            h = _self.frame.size.height;
            k =  newHeight/h;
            if(!h)  return _self;
            newWidth = k*w;
            CGRect frame = _self.frame;
            frame.size.width =  newWidth;
            frame.size.height = newHeight;
            _self.frame = frame;
        }
        return _self;
    };
}
@end


@implementation UIView (UIViewLinkBlock)
- (UIButton*)viewAddTestBtn:(CGRect)frame block:(void(^)(NSInteger idx, UIButton* testButton))block
{
    UIButton* btn=UIButtonNew.viewBGColor([UIColor lightGrayColor])
    .viewAddToView(self).btnTitleFont([UIFont systemFontOfSize:12]);
    btn.frame=frame;;
    [btn addTarget:btn action:@selector(lb_ClickTestBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [btn lb_SetBlock_ClickTestBtnBlock:block];
    [btn lb_SetBlock_ClickTestBtnNumFlag:0];
    return btn;
}

- (void)viewEnumerateSuperviewUsingBlock:(void (^)(UIView *, BOOL *))block
{
    BOOL stop=NO;
    [self viewEnumerateSuperview:&stop blcok:block];
}
//private
- (void)viewEnumerateSuperview:(BOOL*)stop blcok:(void (^)(UIView *, BOOL *))block
{
    if(*stop)return;
    if(self.superview){
        block(self.superview , stop);
        [self.superview viewEnumerateSuperview:stop blcok:block];
    }
}

- (void)viewEnumerateSubviewsUsingBlock:(void (^)(UIView *, NSUInteger,NSUInteger, BOOL *))block
{
    [self viewEnumerateSubviewsFromDeep:0 usingBlock:block];
}

//private
- (void)viewEnumerateSubviewsFromDeep:(NSUInteger)deep usingBlock:(void (^)(UIView *subview, NSUInteger deep,NSUInteger idx, BOOL *stop))block
{
    if(self.subviews.count){
        
        deep++;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subview, NSUInteger idx, BOOL * _Nonnull stop) {
            
            block(subview,deep,idx,stop);
            if(subview.subviews.count){
                [subview viewEnumerateSubviewsFromDeep:deep usingBlock:block];
            }
        }];
    }
}

- (void)lb_ClickTestBtnAction
{
    if(![self isKindOfClass:[UIButton class]])
        return;
    UIButton* _self= (UIButton*)self;
    
    void(^block)(NSInteger idx, UIButton* testButton) = [self lb_GetBlock_ClickTestBtnBlock];
    if(block){
        NSInteger num=[self lb_GetBlock_ClickTestBtnNumFlag];
        block(num,_self);
        [self lb_SetBlock_ClickTestBtnNumFlag:++num];
    }
}

/** 回调block */
static char _lb_key_clickTestBtnBlock;
- (void)lb_SetBlock_ClickTestBtnBlock:(id)block
{
    objc_setAssociatedObject(self, &_lb_key_clickTestBtnBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (id)lb_GetBlock_ClickTestBtnBlock
{
    return objc_getAssociatedObject(self, &_lb_key_clickTestBtnBlock);
}
/** 点击次数 */
static char _lb_key_clickTestBtnNumFlag;
- (void)lb_SetBlock_ClickTestBtnNumFlag:(NSInteger)num
{
    objc_setAssociatedObject(self, &_lb_key_clickTestBtnNumFlag, @(num), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSInteger)lb_GetBlock_ClickTestBtnNumFlag
{
    return [objc_getAssociatedObject(self, &_lb_key_clickTestBtnNumFlag) integerValue];
}
@end
