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
    return ^(CGFloat x,CGFloat y, CGFloat width, CGFloat height){
        LinkError_REF_AUTO(UIView, UIView);
        _self.frame= CGRectMake(x, y, width, height);
        return _self;
    };
}
- (void)setViewSetFrame:(UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))viewSetFrame{};

- (UIView *(^)(CGFloat))viewSetX
{
    return ^(CGFloat x){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = x;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewSetX:(UIView *(^)(CGFloat))viewSetX{};

- (UIView *(^)(CGFloat))viewSetY
{
    return ^(CGFloat y){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = y;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewSetY:(UIView *(^)(CGFloat))viewSetY{};

- (UIView *(^)(CGFloat))viewSetCenterX
{
    return ^(CGFloat centerX){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.x = centerX;
        _self.center = center;
        return _self;
    };
}
- (void)setViewSetCenterX:(UIView *(^)(CGFloat))viewSetCenterX{};

- (UIView *(^)(CGFloat))viewSetCenterY
{
    return ^(CGFloat centerY){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.y = centerY;
        _self.center = center;
        return _self;
    };
}
- (void)setViewSetCenterY:(UIView *(^)(CGFloat))viewSetCenterY{};

- (UIView *(^)(CGFloat))viewSetWidth
{
    return ^(CGFloat width){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame= _self.frame;
        frame.size.width= width;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetWidth:(UIView *(^)(CGFloat))viewSetWidth{};

- (UIView *(^)(CGFloat))viewSetHeight
{
    return ^(CGFloat height){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame= _self.frame;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}
- (void)setViewSetHeight:(UIView *(^)(CGFloat))viewSetHeight{};

- (UIView *(^)(CGFloat,CGFloat))viewSetSize
{
    return ^(CGFloat width, CGFloat height){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(CGFloat x,CGFloat y){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(UIColor *colore){
        LinkError_REF_AUTO(UIView, UIView);
        _self.backgroundColor= colore;
        return _self;
    };
}
- (void)setViewBGColor:(UIView *(^)(UIColor *))viewBGColor{};

- (UIView *(^)())viewBGColorRandom
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        _self.backgroundColor= [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
        return _self;
    };
}
- (void)setViewBGColorRandom:(UIView *(^)())viewBGColorRandom{};

- (UIView *(^)(CGFloat x,CGFloat y))viewSetCenter
{
    return ^(CGFloat x,CGFloat y){
        LinkError_REF_AUTO(UIView, UIView);
        _self.center = CGPointMake(x, y);
        return _self;
    };
}
- (void)setViewSetCenter:(UIView *(^)(CGFloat, CGFloat))viewSetCenter{};

- (UIView *(^)(UIColor *))viewBorderColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(UIView, UIView);
        if([color isKindOfClass:[UIColor class]]){
            _self.layer.borderColor= color.CGColor;
        }
        return _self;
    };
}
- (void)setViewBorderColor:(UIView *(^)(UIColor *))viewBorderColor{};

- (UIView *(^)(CGFloat))viewBorderWidth
{
    return ^(CGFloat width){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.borderWidth= width;
        return _self;
    };
}
- (void)setViewBorderWidth:(UIView *(^)(CGFloat))viewBorderWidth{};

- (UIView *(^)(CGFloat))viewCornerRadius
{
    return ^(CGFloat cornerRadius){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.cornerRadius= cornerRadius;
        return _self;
    };
}
- (void)setViewCornerRadius:(UIView *(^)(CGFloat))viewCornerRadius{};

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return ^(BOOL flag){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.masksToBounds= flag;        return _self;
    };
}
- (void)setViewMasksToBounds:(UIView *(^)(BOOL))viewMasksToBounds{};

- (UIView *(^)())viewFirstResponderSubViewForInput
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
        LinkError_VAL_IF(UIView){
            return CGRectZero;
        }
        return [_self.superview convertRect:_self.frame toView:nil];
    };
}
- (void)setViewConvertRectToWindow:(CGRect (^)())viewConvertRectToWindow{};

- (UIView *(^)(UIView *, BOOL))viewConvertSuperverTo
{
    return ^(UIView* aView, BOOL isKeep){
        
        LinkError_REF_AUTO(UIView, UIView);
        
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
        LinkError_VAL_IF(UIView){
            return NO;
        }
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
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.userInteractionEnabled = b;
        return _self;
    };
}
- (void)setViewUserInteractionEnabled:(UIView *(^)(BOOL))viewUserInteractionEnabled{};

- (UIView *(^)(BOOL))viewMultipleTouchEnabled
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.multipleTouchEnabled =b;
        return _self;
    };
}
- (void)setViewMultipleTouchEnabled:(UIView *(^)(BOOL))viewMultipleTouchEnabled{};

- (UIView *(^)(BOOL))viewExclusiveTouch
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.exclusiveTouch = b;
        return _self;
    };
}
- (void)setViewExclusiveTouch:(UIView *(^)(BOOL))viewExclusiveTouch{};

- (UIView *(^)(UIViewAutoresizing))viewAutoresizingMask
{
    return ^(UIViewAutoresizing mask){
        LinkError_REF_AUTO(UIView, UIView);
        _self.autoresizingMask = mask;
        return _self;
    };
}
- (void)setViewAutoresizingMask:(UIView *(^)(UIViewAutoresizing))viewAutoresizingMask{};

- (UIView *(^)(BOOL))viewClipsToBounds
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.clipsToBounds = YES;
        return _self;
    };
}
- (void)setViewClipsToBounds:(UIView *(^)(BOOL))viewClipsToBounds{};

- (UIView *(^)(CGFloat))viewAlpha
{
    return ^(CGFloat alpha){
        LinkError_REF_AUTO(UIView, UIView);
        _self.alpha= alpha;
        return _self;
    };
}
- (void)setViewAlpha:(UIView *(^)(CGFloat))viewAlpha{};

- (UIView *(^)(CGFloat))viewOpaque
{
    return ^(CGFloat opaque){
        LinkError_REF_AUTO(UIView, UIView);
        _self.opaque = opaque;
        return _self;
    };
}
- (void)setViewOpaque:(UIView *(^)(CGFloat))viewOpaque{};

- (UIView *(^)(BOOL))viewHidden
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.hidden= b;
        return _self;
    };
}
- (void)setViewHidden:(UIView *(^)(BOOL))viewHidden{};

- (UIView *(^)(UIViewContentMode))viewContentMode
{
    return ^(UIViewContentMode contentMode){
        LinkError_REF_AUTO(UIView, UIView);
        _self.contentMode = contentMode;
        return _self;
    };
}
- (void)setViewContentMode:(UIView *(^)(UIViewContentMode))viewContentMode{};

- (UIView *(^)(NSUInteger))viewSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        if(index< _self.subviews.count)
            return (UIView*)(_self.subviews[index]);
        return (UIView*)[LinkError new];
    };
}
- (void)setViewSubviewAt:(UIView *(^)(NSUInteger))viewSubviewAt{};

- (UIView *(^)())viewRemoveFromSuperview
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        [_self removeFromSuperview];
        return _self;
    };
}
- (void)setViewRemoveFromSuperview:(UIView *(^)())viewRemoveFromSuperview{};

- (UIView *(^)(NSUInteger))viewRemoveSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        return _self.viewSubviewAt(index).viewRemoveFromSuperview();
    };
}
- (void)setViewRemoveSubviewAt:(UIView *(^)(NSUInteger))viewRemoveSubviewAt{};

- (UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex
{
    return ^(NSUInteger index1, NSUInteger index2){
        LinkError_REF_AUTO(UIView, UIView);
        [_self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return _self;
    };
}
- (void)setViewExchangeSubviewByIndex:(UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex{};

- (UIView *(^)(UIView *))viewRemoveSubviewTry
{
    return ^(UIView* view){
        LinkError_REF_AUTO(UIView, UIView);
        if([view isKindOfClass:[UIView class]] && view.viewIsSubviewTo(_self)){
            view.viewRemoveFromSuperview();
        }
        return _self;
    };
}
- (void)setViewRemoveSubviewTry:(UIView *(^)(UIView *))viewRemoveSubviewTry{};

- (UIView *(^)())viewRemoveAll
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(UIView* subview){
        LinkError_REF_AUTO(UIView, UIView);
        if([subview isKindOfClass:[UIView class]]){
            [_self addSubview:subview];
        }
        return _self;
    };
}
- (void)setViewAddSubview:(UIView *(^)(UIView *))viewAddSubview{};

- (UIView *(^)(__weak UIView *))viewAddToView
{
    return ^(__weak UIView* view){
//        LinkError_REF_AUTO(UIView, UIView);
        UIView* _self = (UIView*)self;
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
    return ^(UIView* view, NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        [_self insertSubview:view atIndex:index];
        return _self;
    };
}
- (void)setViewInsertSubviewAtIndex:(UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex{};

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewBelow
{
    return ^(UIView* view, UIView* belowView){
        LinkError_REF_AUTO(UIView, UIView);
        [_self insertSubview:view belowSubview:belowView];
        return _self;
    };
}
- (void)setViewInsertSubviewBelow:(UIView *(^)(UIView *, UIView *))viewInsertSubviewBelow{};

- (UIView *(^)(UIView *, UIView *))viewInsertSubviewAbouve
{
    return ^(UIView* view, UIView* belowView){
        LinkError_REF_AUTO(UIView, UIView);
        [_self insertSubview:view aboveSubview:belowView];
        return _self;
    };
}
- (void)setViewInsertSubviewAbouve:(UIView *(^)(UIView *, UIView *))viewInsertSubviewAbouve{};

- (UIView* (^)(BOOL))viewSubiewsExclusiveTouch
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(UIRectCorner side , CGSize radius){
        LinkError_REF_AUTO(UIView, UIView);
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
        LinkError_VAL_IF(UIView){
            return YES;
        }
        if(CGRectEqualToRect(_self.frame, CGRectZero))
            return NO;
        return YES;
    };
}
- (void)setViewIsZeroSize:(BOOL (^)())viewIsZero{};

- (CGFloat (^)())viewX
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.frame.origin.x;
    };
}
- (void)setViewX:(CGFloat (^)())blockXGet{};

- (CGFloat (^)())viewY
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.frame.origin.y;
    };
}
- (void)setViewY:(CGFloat (^)())blockYGet{};

- (CGFloat (^)())viewCenterX
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.center.x;
    };
}
- (void)setViewCenterX:(CGFloat (^)())blockCenterXGet{};

- (CGFloat (^)())viewCenterY
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.center.y;
    };
}
- (void)setViewCenterY:(CGFloat (^)())blockCenterYGet{};

- (CGSize (^)())viewSize
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return CGSizeZero;
        }
        return _self.frame.size;
    };
}
- (void)setViewSize:(CGSize (^)())blockSizeGet{};

- (CGFloat (^)())viewWidth
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.frame.size.width;
    };
}
- (void)setViewWidth:(CGFloat (^)())blockWidthGet{};

- (CGFloat (^)())viewHeight
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return _self.frame.size.height;
    };
}
- (void)setViewHeight:(CGFloat (^)())blockHeightGet{};

- (CGPoint (^)())viewOrigin
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return CGPointZero;
        }
        return _self.frame.origin;
    };
}
- (void)setViewOrigin:(CGPoint (^)())blockOriginGet{};

- (UIView *(^)(double))viewAnimateShakeHorizental
{
    return ^(double duration){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(CGFloat distance, NSTimeInterval time){
        LinkError_REF_AUTO(UIView, UIView);
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , distance);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveUp:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveUp{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveDown
{
    return ^(CGFloat distance, NSTimeInterval time){
        LinkError_REF_AUTO(UIView, UIView);
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,0 , -distance);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveDown:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveDown{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveRight
{
    return ^(CGFloat distance, NSTimeInterval time){
        LinkError_REF_AUTO(UIView, UIView);
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform,distance, 0);
        }];
        return _self;
    };
}
- (void)setViewAnimateMoveRight:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveRight{};

- (UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveLeft
{
    return ^(CGFloat distance, NSTimeInterval time){
        LinkError_REF_AUTO(UIView, UIView);
        [UIView animateWithDuration:time animations:^{
            _self.transform = CGAffineTransformTranslate(_self.transform, -distance, 0);
        }];
        
        return _self;
    };
}
- (void)setViewAnimateMoveLeft:(UIView *(^)(CGFloat, NSTimeInterval))viewAnimateMoveLeft{};

- (UIView *(^)(double))viewAnimateShakeVertical
{
    return ^(double duration){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(CGFloat scale,NSTimeInterval duration,BOOL repeat){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
        
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
    return ^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
        
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
    return ^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
        
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
    return ^(NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
        
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
    return ^(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(CGFloat angle,NSTimeInterval duration,NSUInteger repeatCount,BOOL shouldAutoreverse){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
        LinkError_VAL_IF(UIView){
            return NO;
        }
        return (BOOL)[_self.layer.animationKeys count];
    };
}
- (void)setViewAnimateIsDoing:(BOOL (^)())viewAnimateIsDoing{};

- (UIView *(^)())viewAnimatePause
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        CFTimeInterval pausedTime= [_self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        _self.layer.speed= 0.0;
        _self.layer.timeOffset= pausedTime;
        return _self;
    };
}
- (void)setViewAnimatePause:(UIView *(^)())viewAnimatePause{};

- (UIView *(^)())viewAnimateResume
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
    return ^(){
        LinkError_REF_AUTO(UIImage, UIView);
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
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = fromView.frame.origin.x;
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyX:(UIView *(^)(UIView *))viewUICopyX{};

- (UIView *(^)(UIView *))viewCopyY
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = fromView.frame.origin.y;
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyY:(UIView *(^)(UIView *))viewUICopyY{};

- (UIView *(^)(UIView *))viewCopyFrame
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewCopyFrame:(UIView *(^)(UIView *))viewUICopyFrame{};

- (UIView *(^)(UIView *))viewCopySize
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.size= fromView.frame.size;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewCopySize:(UIView *(^)(UIView *))viewUICopySize{};

- (UIView *(^)(UIView *))viewCopyOrigin
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin= fromView.frame.origin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewCopyOrigin:(UIView *(^)(UIView *))viewUICopyOrigin{};

- (UIView *(^)(UIView *))viewCopyCenter
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        _self.center = fromView.center;
        return _self;
    };
}

- (void)setViewCopyCenter:(UIView *(^)(UIView *))viewUICopyCenter{};

- (UIView *(^)(UIView *))viewCopyCenterX
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.x= fromView.center.x;
        _self.center = center;
        return _self;
    };
}
- (void)setViewCopyCenterX:(UIView *(^)(UIView *))viewUICopyCenterX{};

- (UIView *(^)(UIView *))viewCopyCenterY
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.y= fromView.center.y;
        _self.center = center;
        return _self;
    };
}
- (void)setViewCopyCenterY:(UIView *(^)(UIView *))viewUICopyCenterY{};

- (UIView *(^)(UIView *, CGFloat))viewTopTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = toView.viewMaxY()+ margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewTopTo:(UIView *(^)(UIView *, CGFloat))viewUITopTo{};

- (UIView *(^)(UIView *, CGFloat))viewBottomTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = toView.frame.origin.y - margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewBottomTo:(UIView *(^)(UIView *, CGFloat))viewUIBottonTo{};

- (UIView *(^)(UIView *, CGFloat))viewLeftTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = toView.frame.origin.x - frame.size.width- margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewLeftTo:(UIView *(^)(UIView *, CGFloat))viewUILeftTo{};

- (UIView *(^)(UIView *, CGFloat))viewRightTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
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
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return CGRectGetMaxX(_self.frame);
    };
}
- (void)setViewMaxX:(CGFloat (^)())viewMaxX{};

- (CGFloat (^)())viewMaxY
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return (CGFloat)0.0;
        }
        return CGRectGetMaxY(_self.frame);
    };
}
- (void)setViewMaxY:(CGFloat (^)())viewMaxY{};

- (UIView *(^)())viewBringFrontInView
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        if(_self.superview)
            [_self.superview bringSubviewToFront:_self];
        return _self;
    };
}
- (void)setViewBringFrontInView:(UIView *(^)())viewBringFrontInView{};

- (UIView *(^)())viewSendBackInView
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        if(_self.superview)
            [_self.superview sendSubviewToBack:_self];
        return _self;
    };
}
- (void)setViewSendBackInView:(UIView *(^)())viewSendBackInView{};

- (UIView *(^)())viewRemoveConstraints
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
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
        LinkError_VAL_IF(UIView){
            return NO;
        }
        if([_self.constraints count]>1)
            return YES;
        return NO;
    };
}
- (void)setViewIsUsingAutolayout:(BOOL (^)())viewIsUsingAutolayout{};

- (BOOL (^)())viewIsUsingAutoresizing
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return NO;
        }
        return (BOOL)_self.autoresizingMask;
    };
}
- (void)setViewIsUsingAutoresizing:(BOOL (^)())viewIsUsingAutoresizing{};

- (UIView *(^)())viewRemoveAutoresizing
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        _self.autoresizingMask=UIViewAutoresizingNone;
        _self.translatesAutoresizingMaskIntoConstraints=NO;
        return _self;
    };
}
- (void)setViewRemoveAutoresizing:(UIView *(^)())viewRemoveAutoresizing{};

- (UIView *(^)())viewBeforeIndexView
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        return (UIView*)_self.objBeforeInArr(_self.subviews);
    };
}
- (void)setViewBeforeIndexView:(UIView *(^)())viewBeforeIndexView{};

- (UIView *(^)())viewNextIndexView
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        return (UIView*)_self.objNextInArr(_self.subviews);
    };
}
- (void)setViewNextIndexView:(UIView *(^)())viewNextIndexView{};

- (BOOL (^)(UIView *))viewIsSuperviewTo
{
    return ^(UIView* aView){
        LinkError_VAL_IF(UIView){
            return NO;
        }
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
    return ^(CGFloat newWidth){
        LinkError_REF_AUTO(UIView, UIView);
        
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
    return ^(CGFloat newHeight){
        LinkError_REF_AUTO(UIView, UIView);
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