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
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetFrame,x,y,width,height)
        _self.frame= CGRectMake(x, y, width, height);
        return _self;
    };
}
- (void)setViewSetFrame:(UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))viewSetFrame{};

- (UIView *(^)(CGFloat))viewSetX
{
    return ^id(CGFloat x){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetX,x)
        CGRect frame = _self.frame;
        frame.origin.x = x;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewSetX:(UIView *(^)(CGFloat))viewSetX{};

- (UIView *(^)(CGFloat))viewSetY
{
    return ^id(CGFloat y){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetY,y)
        CGRect frame = _self.frame;
        frame.origin.y = y;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewSetY:(UIView *(^)(CGFloat))viewSetY{};

- (UIView *(^)(CGFloat))viewSetCenterX
{
    return ^id(CGFloat centerX){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetCenterX,centerX)
        CGPoint center = _self.center;
        center.x = centerX;
        _self.center = center;
        return _self;
    };
}
- (void)setViewSetCenterX:(UIView *(^)(CGFloat))viewSetCenterX{};

- (UIView *(^)(CGFloat))viewSetCenterY
{
    return ^id(CGFloat centerY){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetCenterY,centerY)
        CGPoint center = _self.center;
        center.y = centerY;
        _self.center = center;
        return _self;
    };
}
- (void)setViewSetCenterY:(UIView *(^)(CGFloat))viewSetCenterY{};

- (UIView *(^)(CGFloat))viewSetWidth
{
    return ^id(CGFloat width){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetWidth,width)
        CGRect frame= _self.frame;
        frame.size.width= width;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetWidth:(UIView *(^)(CGFloat))viewSetWidth{};

- (UIView *(^)(CGFloat))viewSetHeight
{
    return ^id(CGFloat height){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetHeight,height)
        CGRect frame= _self.frame;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetHeight:(UIView *(^)(CGFloat))viewSetHeight{};

- (UIView *(^)(CGFloat,CGFloat))viewSetSize
{
    return ^id(CGFloat width, CGFloat height){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetSize,width,height)
        CGRect frame= _self.frame;
        frame.size.width= width;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetSize:(UIView *(^)(CGFloat, CGFloat))viewSetSize{};

- (UIView *(^)(CGFloat,CGFloat))viewSetOrigin
{
    return ^id(CGFloat x,CGFloat y){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetOrigin,x,y)
        CGRect frame= _self.frame;
        frame.origin.x= x;
        frame.origin.y= y;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetOrigin:(UIView *(^)(CGFloat, CGFloat))viewSetOrigin{};

- (UIView *(^)(UIColor *))viewBGColor
{
    return ^id(UIColor *color){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBGColor,color)
        _self.backgroundColor= color;
        return _self;
    };
}
- (void)setViewBGColor:(UIView *(^)(UIColor *))viewBGColor{};

- (UIView *(^)())viewBGColorRandom
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBGColorRandom)
        _self.backgroundColor= [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        return _self;
    };
}
- (void)setViewBGColorRandom:(UIView *(^)())viewBGColorRandom{};

- (UIView *(^)(CGFloat x,CGFloat y))viewSetCenter
{
    return ^id(CGFloat x,CGFloat y){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSetCenter,x,y)
        _self.center = CGPointMake(x, y);
        return _self;
    };
}
- (void)setViewSetCenter:(UIView *(^)(CGFloat, CGFloat))viewSetCenter{};

- (UIView *(^)(UIColor *))viewBorderColor
{
    return ^id(UIColor* color){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBorderColor,color)
        if([color isKindOfClass:[UIColor class]]){
            _self.layer.borderColor= color.CGColor;
        }
        return _self;
    };
}
- (void)setViewBorderColor:(UIView *(^)(UIColor *))viewBorderColor{};

- (UIView *(^)(CGFloat))viewBorderWidth
{
    return ^id(CGFloat width){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBorderWidth,width)
        _self.layer.borderWidth= width;
        return _self;
    };
}
- (void)setViewBorderWidth:(UIView *(^)(CGFloat))viewBorderWidth{};

- (UIView *(^)(CGFloat))viewCornerRadius
{
    return ^id(CGFloat cornerRadius){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCornerRadius,cornerRadius)
        _self.layer.cornerRadius= cornerRadius;
        return _self;
    };
}
- (void)setViewCornerRadius:(UIView *(^)(CGFloat))viewCornerRadius{};

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return ^id(BOOL flag){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewMasksToBounds,flag)
        _self.layer.masksToBounds= flag;
        return _self;
    };
}
- (void)setViewMasksToBounds:(UIView *(^)(BOOL))viewMasksToBounds{};

- (UIView *(^)())viewFirstResponderSubViewForInput
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewFirstResponderSubViewForInput:(UIView *(^)())viewFirstResponderSubViewForInput{};

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
- (void)setViewConvertRectToWindow:(CGRect (^)())viewConvertRectToWindow{};

- (UIView *(^)(UIView *, BOOL))viewConvertSuperverTo
{
    return ^id(UIView* aView, BOOL isKeep){
        
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewConvertSuperverTo:(UIView *(^)(UIView *, BOOL))viewConvertSuperverTo{};

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
- (void)setViewIsSubviewTo:(BOOL (^)(UIView *))viewIsSubviewTo{};

- (UIView *(^)(BOOL))viewUserInteractionEnabled
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewUserInteractionEnabled,b)
        _self.userInteractionEnabled = b;
        return _self;
    };
}
- (void)setViewUserInteractionEnabled:(UIView *(^)(BOOL))viewUserInteractionEnabled{};

- (UIView *(^)(BOOL))viewMultipleTouchEnabled
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewMultipleTouchEnabled,b)
        _self.multipleTouchEnabled =b;
        return _self;
    };
}
- (void)setViewMultipleTouchEnabled:(UIView *(^)(BOOL))viewMultipleTouchEnabled{};

- (UIView *(^)(BOOL))viewExclusiveTouch
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewExclusiveTouch,b)
        _self.exclusiveTouch = b;
        return _self;
    };
}
- (void)setViewExclusiveTouch:(UIView *(^)(BOOL))viewExclusiveTouch{};

- (UIView *(^)(UIViewAutoresizing))viewAutoresizingMask
{
    return ^id(UIViewAutoresizing mask){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAutoresizingMask,mask)
        _self.autoresizingMask = mask;
        return _self;
    };
}
- (void)setViewAutoresizingMask:(UIView *(^)(UIViewAutoresizing))viewAutoresizingMask{};

- (UIView *(^)(BOOL))viewClipsToBounds
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewClipsToBounds,b)
        _self.clipsToBounds = YES;
        return _self;
    };
}
- (void)setViewClipsToBounds:(UIView *(^)(BOOL))viewClipsToBounds{};

- (UIView *(^)(CGFloat))viewAlpha
{
    return ^id(CGFloat alpha){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAlpha,alpha)
        _self.alpha= alpha;
        return _self;
    };
}
- (void)setViewAlpha:(UIView *(^)(CGFloat))viewAlpha{};

- (UIView *(^)(CGFloat))viewOpaque
{
    return ^id(CGFloat opaque){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewOpaque,opaque)
        _self.opaque = opaque;
        return _self;
    };
}
- (void)setViewOpaque:(UIView *(^)(CGFloat))viewOpaque{};

- (UIView *(^)(BOOL))viewHidden
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewHidden,b)
        _self.hidden= b;
        return _self;
    };
}
- (void)setViewHidden:(UIView *(^)(BOOL))viewHidden{};

- (UIView *(^)(UIViewContentMode))viewContentMode
{
    return ^id(UIViewContentMode contentMode){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewContentMode,contentMode)
        _self.contentMode = contentMode;
        return _self;
    };
}
- (void)setViewContentMode:(UIView *(^)(UIViewContentMode))viewContentMode{};

- (UIView *(^)(NSUInteger))viewSubviewAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSubviewAt,index)
        if(index< _self.subviews.count)
            return (UIView*)(_self.subviews[index]);
        return (UIView*)[LinkError new];
    };
}
- (void)setViewSubviewAt:(UIView *(^)(NSUInteger))viewSubviewAt{};

- (UIView *(^)())viewRemoveFromSuperview
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRemoveFromSuperview)
        [_self removeFromSuperview];
        return _self;
    };
}
- (void)setViewRemoveFromSuperview:(UIView *(^)())viewRemoveFromSuperview{};

- (UIView *(^)(NSUInteger))viewRemoveSubviewAt
{
    return ^id(NSUInteger index){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRemoveSubviewAt,index)
        return _self.viewSubviewAt(index).viewRemoveFromSuperview();
    };
}
- (void)setViewRemoveSubviewAt:(UIView *(^)(NSUInteger))viewRemoveSubviewAt{};

- (UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex
{
    return ^id(NSUInteger index1, NSUInteger index2){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewExchangeSubviewByIndex,index1,index2)
        [_self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return _self;
    };
}
- (void)setViewExchangeSubviewByIndex:(UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex{};

- (UIView *(^)(UIView *))viewRemoveSubviewTry
{
    return ^id(UIView* view){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRemoveSubviewTry,view)
        if([view isKindOfClass:[UIView class]] && view.viewIsSubviewTo(_self)){
            view.viewRemoveFromSuperview();
        }
        return _self;
    };
}
- (void)setViewRemoveSubviewTry:(UIView *(^)(UIView *))viewRemoveSubviewTry{};

- (UIView *(^)())viewRemoveAll
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRemoveAll)
        [_self.subviews enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if([v isKindOfClass:[UIView class]]){
                [v removeFromSuperview];
            }
        }];
        return _self;
    };
}
- (void)setViewRemoveAll:(UIView *(^)())viewRemoveAll{};

- (UIView *(^)(UIView *))viewAddSubview
{
    return ^id(UIView* subview){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAddSubview,subview)
        if([subview isKindOfClass:[UIView class]]){
            [_self addSubview:subview];
        }
        return _self;
    };
}
- (void)setViewAddSubview:(UIView *(^)(UIView *))viewAddSubview{};

- (UIView *(^)(__weak UIView *))viewAddToView
{
    return ^id(__weak UIView* view){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAddToView,view)
        if([self isKindOfClass:[LinkError class]])
            return (UIView *)self;
        if(![self isKindOfClass:[UIView class]])
            return (UIView *)[LinkError new];
        
        if([view isKindOfClass:[UIView class]]){
            [view addSubview:_self];
        }
        return _self;
    };
}
- (void)setViewAddToView:(UIView *(^)(__weak UIView *))viewAddToView{};

- (UIView *(^)(UIView *, NSUInteger))viewInsertSubviewAtIndex
{
    return ^id(UIView* view, NSUInteger index){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewInsertSubviewAtIndex,view,index)
        [_self insertSubview:view atIndex:index];
        return _self;
    };
}
- (void)setViewInsertSubviewAtIndex:(UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex{};

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewBelow
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewInsertSubviewBelow,view,belowView)
        [_self insertSubview:view belowSubview:belowView];
        return _self;
    };
}
- (void)setViewInsertSubviewBelow:(UIView *(^)(UIView *, UIView *))viewInsertSubviewBelow{};

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewAbouve
{
    return ^id(UIView* view, UIView* belowView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewInsertSubviewAbouve,view,belowView)
        [_self insertSubview:view aboveSubview:belowView];
        return _self;
    };
}
- (void)setViewInsertSubviewAbouve:(UIView *(^)(UIView *, UIView *))viewInsertSubviewAbouve{};

- (UIView* (^)(BOOL))viewSubiewsExclusiveTouch
{
    return ^id(BOOL b){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSubiewsExclusiveTouch,b)
        [_self.subviews enumerateObjectsUsingBlock:^(UIView* subView, NSUInteger idx, BOOL *stop) {
            if([subView isKindOfClass:[UIView class]]){
                subView.exclusiveTouch = b;
            }
        }];
        return _self;
    };
}
- (void)setViewSubiewsExclusiveTouch:(UIView* (^)(BOOL))blockSubiewsExclusiveTouch{};

- (UIView *(^)(UIRectCorner, CGSize))viewCornerRadiusSide
{
    return ^id(UIRectCorner side , CGSize radius){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewCornerRadiusSide:(UIView *(^)(UIRectCorner, CGSize))blockCornerRadiusSide{};

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
- (void)setViewIsZeroSize:(BOOL (^)())viewIsZero{};

- (CGFloat (^)())viewX
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewX)
        return _self.frame.origin.x;
    };
}
- (void)setViewX:(CGFloat (^)())blockXGet{};

- (CGFloat (^)())viewY
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewY)
        return _self.frame.origin.y;
    };
}
- (void)setViewY:(CGFloat (^)())blockYGet{};

- (CGFloat (^)())viewCenterX
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewCenterX)
        return _self.center.x;
    };
}
- (void)setViewCenterX:(CGFloat (^)())blockCenterXGet{};

- (CGFloat (^)())viewCenterY
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewCenterY)
        return _self.center.y;
    };
}
- (void)setViewCenterY:(CGFloat (^)())blockCenterYGet{};

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
- (void)setViewSize:(CGSize (^)())blockSizeGet{};

- (CGFloat (^)())viewWidth
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewWidth)
        return _self.frame.size.width;
    };
}
- (void)setViewWidth:(CGFloat (^)())blockWidthGet{};

- (CGFloat (^)())viewHeight
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewHeight)
        return _self.frame.size.height;
    };
}
- (void)setViewHeight:(CGFloat (^)())blockHeightGet{};

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
- (void)setViewOrigin:(CGPoint (^)())blockOriginGet{};

- (UIView *(^)(double))viewAnimateShakeHorizental
{
    return ^id(double duration){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateShakeHorizental,duration)
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = duration;
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        [_self.layer addAnimation:animation forKey:@"shake"];
        return _self;
    };
}
- (void)setViewAnimateShakeHorizental:(UIView *(^)(double))viewAnimateShakeHorizental{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveUp
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateMoveUp,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , distance);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveUp:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveUp{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveDown
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateMoveDown,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , -distance);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveDown:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveDown{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveRight
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateMoveRight,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,distance, 0);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveRight:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveRight{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveLeft
{
    return ^id(CGFloat distance, NSTimeInterval time){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateMoveLeft,distance,time)
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform, -distance, 0);
        }];
        
        return _self;
    };
}
- (void)setViewAnimateMoveLeft:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveLeft{};

- (UIView *(^)(double))viewAnimateShakeVertical
{
    return ^id(double duration){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateShakeVertical,duration)
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = duration;
        animation.values = @[@(-12), @(12), @(-8), @(8), @(-4), @(4), @(0) ];
        
        [_self.layer addAnimation:animation forKey:@"shake"];
        return _self;
    };
}
- (void)setViewAnimateShakeVertical:(UIView *(^)(double))viewAnimateShakeVertical{};

- (UIView *(^)())viewAnimateAppleMotionEffects
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewAnimateAppleMotionEffects:(UIView *(^)())viewAnimateAppleMotionEffects{};

- (UIView *(^)(CGFloat, NSTimeInterval, BOOL))viewAnimatePulse
{
    return ^id(CGFloat scale,NSTimeInterval duration,BOOL repeat){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimatePulse,scale,duration,repeat)
        CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulseAnimation.duration = duration;
        pulseAnimation.toValue = [NSNumber numberWithFloat:scale];
        pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pulseAnimation.autoreverses = YES;
        pulseAnimation.repeatCount = repeat ? HUGE_VALF : 0;
        
        [_self.layer addAnimation:pulseAnimation
                          forKey:@"pulse"];
        return _self;
    };
}
- (void)setViewAnimatePulse:(UIView *(^)(CGFloat, NSTimeInterval, BOOL))viewAnimatePulse{};

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromTop
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromTop,duration,repeatCount,shouldAutoreverse)
        NSString *subtype = @"fromTop";
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = @"flip";
        transition.subtype = subtype;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        
        [_self.layer addAnimation:transition
                          forKey:@"spin"];
        return _self;
    };
}
- (void)setViewAnimateFlipFromTop:(UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromTop{};

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromBotton
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromBotton,duration,repeatCount,shouldAutoreverse)
        NSString *subtype = @"fromBottom";
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = @"flip";
        transition.subtype = subtype;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        
        [_self.layer addAnimation:transition
                           forKey:@"spin"];
        return _self;
    };
}
- (void)setViewAnimateFlipFromBotton:(UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromBotton{};

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromLeft
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromLeft,duration,repeatCount,shouldAutoreverse)
        NSString *subtype = @"fromLeft";
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = @"flip";
        transition.subtype = subtype;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        
        [_self.layer addAnimation:transition
                           forKey:@"spin"];
        return _self;
    };
}
- (void)setViewAnimateFlipFromLeft:(UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromLeft{};

- (UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromRight
{
    return ^id(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateFlipFromRight,duration,repeatCount,shouldAutoreverse)
        NSString *subtype = @"fromRight";
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0;
        transition.endProgress = 1.0;
        transition.type = @"flip";
        transition.subtype = subtype;
        transition.duration = duration;
        transition.repeatCount = repeatCount;
        transition.autoreverses = shouldAutoreverse;
        
        [_self.layer addAnimation:transition
                           forKey:@"spin"];
        return _self;
    };
}
- (void)setViewAnimateFlipFromRight:(UIView *(^)(NSTimeInterval, NSUInteger, BOOL))viewAnimateFlipFromRight{};

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToLeft
{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewAnimateRotateToLeft:(UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToLeft{};

- (UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToRight
{
    return ^id(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewAnimateRotateToRight:(UIView *(^)(CGFloat, NSTimeInterval, NSUInteger, BOOL))viewAnimateRotateToRight{};

- (UIView *(^)())viewAnimateRemove
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimateRemove)
        [CATransaction begin];
        [_self.layer removeAllAnimations];
        [CATransaction commit];
        [CATransaction flush];
        return _self;
    };
}
- (void)setViewAnimateRemove:(UIView *(^)())viewAnimateRemove{}

- (BOOL (^)())viewAnimateIsDoing
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewAnimateIsDoing)
        return (BOOL)[_self.layer.animationKeys count];
    };
}
- (void)setViewAnimateIsDoing:(BOOL (^)())viewAnimateIsDoing{};

- (UIView *(^)())viewAnimatePause
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewAnimatePause)
        CFTimeInterval pausedTime= [_self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        _self.layer.speed= 0.0;
        _self.layer.timeOffset= pausedTime;
        return _self;
    };
}
- (void)setViewAnimatePause:(UIView *(^)())viewAnimatePause{};

- (UIView *(^)())viewAnimateResume
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewAnimateResume:(UIView *(^)())viewAnimateResum{};

- (UIImage *(^)())viewSnapshot
{
    return ^id(){
        LinkHandle_REF(UIImage, UIView)
        LinkGroupHandle_REF(viewSnapshot)
        UIGraphicsBeginImageContextWithOptions(_self.bounds.size, YES, 0);
        [_self drawViewHierarchyInRect:_self.bounds afterScreenUpdates:YES];
        UIImage *re = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return re;
    };
}
- (void)setViewSnapshot:(UIImage *(^)())viewSnapshot{};

- (UIView *(^)(UIView *))viewCopyX
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyX,fromView)
        CGRect frame = _self.frame;
        frame.origin.x = fromView.frame.origin.x;
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyX:(UIView *(^)(UIView *))viewUICopyX{};

- (UIView *(^)(UIView *))viewCopyY
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyY,fromView)
        CGRect frame = _self.frame;
        frame.origin.y = fromView.frame.origin.y;
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyY:(UIView *(^)(UIView *))viewUICopyY{};

- (UIView *(^)(UIView *))viewCopyFrame
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyFrame,fromView)
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyFrame:(UIView *(^)(UIView *))viewUICopyFrame{};

- (UIView *(^)(UIView *))viewCopySize
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopySize,fromView)
        CGRect frame = _self.frame;
        frame.size= fromView.frame.size;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewCopySize:(UIView *(^)(UIView *))viewUICopySize{};

- (UIView *(^)(UIView *))viewCopyOrigin
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyOrigin,fromView)
        CGRect frame = _self.frame;
        frame.origin= fromView.frame.origin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewCopyOrigin:(UIView *(^)(UIView *))viewUICopyOrigin{};

- (UIView *(^)(UIView *))viewCopyCenter
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyCenter,fromView)
        _self.center = fromView.center;
        return _self;
    };
}

- (void)setViewCopyCenter:(UIView *(^)(UIView *))viewUICopyCenter{};

- (UIView *(^)(UIView *))viewCopyCenterX
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyCenterX,fromView)
        CGPoint center = _self.center;
        center.x= fromView.center.x;
        _self.center = center;
        return _self;
    };
}
- (void)setViewCopyCenterX:(UIView *(^)(UIView *))viewUICopyCenterX{};

- (UIView *(^)(UIView *))viewCopyCenterY
{
    return ^id(UIView* fromView){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewCopyCenterY,fromView)
        CGPoint center = _self.center;
        center.y= fromView.center.y;
        _self.center = center;
        return _self;
    };
}
- (void)setViewCopyCenterY:(UIView *(^)(UIView *))viewUICopyCenterY{};

- (UIView *(^)(UIView *, CGFloat))viewTopTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewTopTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.y = toView.viewMaxY()+ margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewTopTo:(UIView *(^)(UIView *, CGFloat))viewUITopTo{};

- (UIView *(^)(UIView *, CGFloat))viewBottomTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBottomTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.y = toView.frame.origin.y - margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewBottomTo:(UIView *(^)(UIView *, CGFloat))viewUIBottonTo{};

- (UIView *(^)(UIView *, CGFloat))viewLeftTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewLeftTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.x = toView.frame.origin.x - frame.size.width- margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewLeftTo:(UIView *(^)(UIView *, CGFloat))viewUILeftTo{};

- (UIView *(^)(UIView *, CGFloat))viewRightTo
{
    return ^id(UIView* toView, CGFloat margin){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRightTo,toView,margin)
        CGRect frame = _self.frame;
        frame.origin.x = toView.viewMaxX() + margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewRightTo:(UIView *(^)(UIView *, CGFloat))viewUIRightTo{};

- (CGFloat (^)())viewMaxX
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewMaxX)
        return CGRectGetMaxX(_self.frame);
    };
}
- (void)setViewMaxX:(CGFloat (^)())viewMaxX{};

- (CGFloat (^)())viewMaxY
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return (CGFloat)0.0;
        }
        LinkGroupHandle_VAL(viewMaxY)
        return CGRectGetMaxY(_self.frame);
    };
}
- (void)setViewMaxY:(CGFloat (^)())viewMaxY{};

- (UIView *(^)())viewBringFrontInView
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBringFrontInView)
        if(_self.superview)
            [_self.superview bringSubviewToFront:_self];
        return _self;
    };
}
- (void)setViewBringFrontInView:(UIView *(^)())viewBringFrontInView{};

- (UIView *(^)())viewSendBackInView
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewSendBackInView)
        if(_self.superview)
            [_self.superview sendSubviewToBack:_self];
        return _self;
    };
}
- (void)setViewSendBackInView:(UIView *(^)())viewSendBackInView{};

- (UIView *(^)())viewRemoveConstraints
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewRemoveConstraints:(UIView *(^)())viewRemoveConstraints{};

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
- (void)setViewIsUsingAutolayout:(BOOL (^)())viewIsUsingAutolayout{};

- (BOOL (^)())viewIsUsingAutoresizing
{
    return ^(){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsUsingAutoresizing)
        return (BOOL)_self.autoresizingMask;
    };
}
- (void)setViewIsUsingAutoresizing:(BOOL (^)())viewIsUsingAutoresizing{};

- (UIView *(^)())viewRemoveAutoresizing
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewRemoveAutoresizing)
        _self.autoresizingMask=UIViewAutoresizingNone;
        _self.translatesAutoresizingMaskIntoConstraints=NO;
        return _self;
    };
}
- (void)setViewRemoveAutoresizing:(UIView *(^)())viewRemoveAutoresizing{};

- (UIView *(^)())viewBeforeIndexView
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewBeforeIndexView)
        return (UIView*)_self.objBeforeInArr(_self.subviews);
    };
}
- (void)setViewBeforeIndexView:(UIView *(^)())viewBeforeIndexView{};

- (UIView *(^)())viewNextIndexView
{
    return ^id(){
        LinkHandle_REF(UIView, UIView)
        LinkGroupHandle_REF(viewNextIndexView)
        return (UIView*)_self.objNextInArr(_self.subviews);
    };
}
- (void)setViewNextIndexView:(UIView *(^)())viewNextIndexView{};

- (BOOL (^)(UIView *))viewIsSuperviewTo
{
    return ^(UIView* aView){
        LinkHandle_VAL_IFNOT(UIView){
            return NO;
        }
        LinkGroupHandle_VAL(viewIsSuperviewTo,aView)
        __block BOOL re = NO;
        [aView viewEnumerateSuperviewUsingBlock:^(UIView *superview, BOOL *stop) {
            if(superview==_self) re = YES;*stop = re;
        }];
        return re;
    };
}
- (void)setViewIsSuperviewTo:(BOOL (^)(UIView *))viewIsSuperviewTo{};

- (UIView *(^)(CGFloat))viewSetWidthAspect
{
    return ^id(CGFloat newWidth){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewSetWidthAspect:(UIView *(^)(CGFloat))viewSetWidthAspect{};

- (UIView *(^)(CGFloat))viewSetHeightAspect
{
    return ^id(CGFloat newHeight){
        LinkHandle_REF(UIView, UIView)
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
- (void)setViewSetHeightAspect:(UIView *(^)(CGFloat))viewSetHeightAspect{};
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
static char _lb_ClickTestBtnBlock_Key;
- (void)lb_SetBlock_ClickTestBtnBlock:(id)block
{
    objc_setAssociatedObject(self, &_lb_ClickTestBtnBlock_Key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (id)lb_GetBlock_ClickTestBtnBlock
{
    return objc_getAssociatedObject(self, &_lb_ClickTestBtnBlock_Key);
}
/** 点击次数 */
static char _lb_ClickTestBtnNumFlag_Key;
- (void)lb_SetBlock_ClickTestBtnNumFlag:(NSInteger)num
{
    objc_setAssociatedObject(self, &_lb_ClickTestBtnNumFlag_Key, @(num), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSInteger)lb_GetBlock_ClickTestBtnNumFlag
{
    return [objc_getAssociatedObject(self, &_lb_ClickTestBtnNumFlag_Key) integerValue];
}
@end