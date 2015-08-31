//
//  UIView+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "UIView+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "LinkBlock.h"

@implementation NSObject(UIViewLinkBlock)


- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))viewSetFrame
{
    return ^(CGFloat x,CGFloat y, CGFloat width, CGFloat height){
        LinkError_REF_AUTO(UIView, UIView);
        _self.frame= CGRectMake(x, y, width, height);
        return _self;
    };
}

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

- (UIView *(^)(UIColor *))viewBGColor
{
    return ^(UIColor *colore){
        LinkError_REF_AUTO(UIView, UIView);
        _self.backgroundColor= colore;
        return _self;
    };
}
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

- (UIView *(^)(UIColor *))viewBorderColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO(UIView, UIView);
        if(color.objIsKind([UIColor class])){
            _self.layer.borderColor= color.CGColor;
        }
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewBorderWidth
{
    return ^(CGFloat width){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.borderWidth= width;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewCornerRadius
{
    return ^(CGFloat cornerRadius){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.cornerRadius= cornerRadius;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return ^(BOOL flag){
        LinkError_REF_AUTO(UIView, UIView);
        _self.layer.masksToBounds= flag;
        return _self;
    };
}

- (UIView *(^)())viewFirstResponderSubViewForInput
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        __block UIView *re= nil;
        [_self.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
            
            if(v.objIsKind([UITextView class])|| v.objIsKind([UITextField class])){
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
        LinkError_VAL_IF(UIView){
            return CGRectZero;
        }
        return [_self.superview convertRect:_self.frame toView:nil];
    };
}

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

- (UIView *(^)(BOOL))viewUserInteractionEnabled
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.userInteractionEnabled = b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMultipleTouchEnabled
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.multipleTouchEnabled =b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewExclusiveTouch
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.exclusiveTouch = b;
        return _self;
    };
}

- (UIView *(^)(UIViewAutoresizing))viewAutoresizingMask
{
    return ^(UIViewAutoresizing mask){
        LinkError_REF_AUTO(UIView, UIView);
        _self.autoresizingMask = mask;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewClipsToBounds
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.clipsToBounds = YES;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewAlpha
{
    return ^(CGFloat alpha){
        LinkError_REF_AUTO(UIView, UIView);
        _self.alpha= alpha;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewOpaque
{
    return ^(CGFloat opaque){
        LinkError_REF_AUTO(UIView, UIView);
        _self.opaque = opaque;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewHidden
{
    return ^(BOOL b){
        LinkError_REF_AUTO(UIView, UIView);
        _self.hidden= b;
        return _self;
    };
}

- (UIView *(^)(UIViewContentMode))viewContentMode
{
    return ^(UIViewContentMode contentMode){
        LinkError_REF_AUTO(UIView, UIView);
        _self.contentMode = contentMode;
        return _self;
    };
}


- (UIView *(^)(NSUInteger))viewSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        if(index< _self.subviews.count)
            return (UIView*)(_self.subviews[index]);
        return (UIView*)[LinkError share];
    };
}
- (UIView *(^)())viewRemoveFromSuperview
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        [_self removeFromSuperview];
        return _self;
    };
}
- (UIView *(^)(NSUInteger))viewRemoveSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        return _self.viewSubviewAt(index).viewRemoveFromSuperview();
    };
}

- (UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex
{
    return ^(NSUInteger index1, NSUInteger index2){
        LinkError_REF_AUTO(UIView, UIView);
        [_self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return _self;
    };
}

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

- (UIView *(^)())viewRemoveAll
{
    return ^(){
        LinkError_REF_AUTO(UIView, UIView);
        [_self.subviews enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if(v.objIsKind([UIView class])){
                [v removeFromSuperview];
            }
        }];
        return _self;
    };
}

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

- (UIView *(^)(UIView *))viewAddToView
{
    return ^(UIView* view){
        LinkError_REF_AUTO(UIView, UIView);
        if([view isKindOfClass:[UIView class]]){
            [view addSubview:_self];
        }
        return _self;
    };
}

- (UIView *(^)(UIView *, NSUInteger))viewInsertSubviewAtIndex
{
    return ^(UIView* view, NSUInteger index){
        LinkError_REF_AUTO(UIView, UIView);
        [_self insertSubview:view atIndex:index];
        return _self;
    };
}
- (void)setViewInsertSubviewAtIndex:(UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex{};

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
        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:_self.bounds
                                                   byRoundingCorners:side
                                                         cornerRadii:radius];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        shape.frame= _self.frame;
        shape.path= path.CGPath;
        _self.layer.mask = shape;
        return _self;
    };
}
- (void)setViewCornerRadiusSide:(UIView *(^)(UIRectCorner, CGSize))blockCornerRadiusSide{};


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
        LinkError_VAL_IF(UIView);
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

- (void)setViewSetFrame:(UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockFrame{};
- (void)setViewSetX:(UIView *(^)(CGFloat))blockX{};
- (void)setViewSetY:(UIView *(^)(CGFloat))blockY{};
- (void)setViewSetCenterX:(UIView *(^)(CGFloat))blockCenterX{};
- (void)setViewSetCenterY:(UIView *(^)(CGFloat))blockCenterY{};
- (void)setViewSetWidth:(UIView *(^)(CGFloat))blockWidth{};
- (void)setViewSetHeight:(UIView *(^)(CGFloat))blockHeight{};
- (void)setViewSetSize:(UIView *(^)(CGFloat, CGFloat))blockSize{};
- (void)setViewSetOrigin:(UIView *(^)(CGFloat,CGFloat))blockOrigin{};
- (void)setViewBGColor:(UIView *(^)(UIColor *))blockColor{};
- (void)setViewSetCenter:(UIView *(^)(CGFloat x,CGFloat y))blockCenter{};
- (void)setViewMasksToBounds:(UIView *(^)(BOOL))blockMasksToBounds{};
- (void)setViewFirstResponderSubViewForInput:(UIView *(^)())blockFirstResponderSubView{};
- (void)setViewBorderWidth:(UIView *(^)(CGFloat))blockBorderWidth{};
- (void)setViewBorderColor:(UIView *(^)(UIColor *))blockBorderColor{};
- (void)setViewCornerRadius:(UIView *(^)(CGFloat))blockCornerRadius{};
- (void)setBlockConvertRectToView:(CGRect (^)())blockConvertRectToWindow{};
- (void)setViewIsSubviewTo:(BOOL (^)(UIView *))blockIsSubviewTo{};
- (void)setViewConvertRectToWindow:(CGRect (^)())blockConvertRectToWindow{};
- (void)setViewContentMode:(UIView *(^)(UIViewContentMode))blockContentMode{};
- (void)setViewRemoveSubviewTry:(UIView *(^)(UIView *))blockRemoveSubviewTry{};
- (void)setViewMultipleTouchEnabled:(UIView *(^)(BOOL))blockMultipleTouchEnabled{};
- (void)setViewUserInteractionEnabled:(UIView *(^)(BOOL))blockUserInteractionEnabled{};
- (void)setViewRemoveSubviewAt:(UIView *(^)(NSUInteger))blockRemoveSubviewAtIndex{};
- (void)setViewHidden:(UIView *(^)(BOOL))blockHidden{};
- (void)setViewAutoresizingMask:(UIView *(^)(UIViewAutoresizing))blockAutoresizingMask{};
- (void)setViewExclusiveTouch:(UIView *(^)(BOOL))blockExclusiveTouch{};
- (void)setViewRemoveAll:(UIView *(^)())blockRemoveAllSubview{};
- (void)setViewRemoveFromSuperview:(UIView *(^)())blockRemoveFromSuperview{};
- (void)setViewExchangeSubviewByIndex:(UIView *(^)(NSUInteger, NSUInteger))blockExchangeSubviewByIndex{};
- (void)setViewSubviewAt:(UIView *(^)(NSUInteger))blockSubviewAtIndex{};
- (void)setViewClipsToBounds:(UIView *(^)(BOOL))blockClipsToBounds{};
- (void)setViewOpaque:(UIView *(^)(CGFloat))blockOpaque{};
- (void)setViewAlpha:(UIView *(^)(CGFloat))blockAlpha{};
- (void)setViewAddToView:(UIView *(^)(UIView *))blockAddToView{};
- (void)setViewAddSubview:(UIView *(^)(UIView *))blockAddSubview{};

- (UIView *(^)(UIView *))viewUICopyFrame
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        _self.frame= fromView.frame;
        return _self;
    };
}
- (void)setViewUICopyFrame:(UIView *(^)(UIView *))viewUICopyFrame{};

- (UIView *(^)(UIView *))viewUICopySize
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.size= frame.size;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUICopySize:(UIView *(^)(UIView *))viewUICopySize{};

- (UIView *(^)(UIView *))viewUICopyOrigin
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin= frame.origin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUICopyOrigin:(UIView *(^)(UIView *))viewUICopyOrigin{};

- (UIView *(^)(UIView *))viewUICopyCenter
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        _self.center = fromView.center;
        return _self;
    };
}

- (void)setViewUICopyCenter:(UIView *(^)(UIView *))viewUICopyCenter{};

- (UIView *(^)(UIView *))viewUICopyCenterX
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.x= fromView.center.x;
        _self.center = center;
        return _self;
    };
}
- (void)setViewUICopyCenterX:(UIView *(^)(UIView *))viewUICopyCenterX{};

- (UIView *(^)(UIView *))viewUICopyCenterY
{
    return ^(UIView* fromView){
        LinkError_REF_AUTO(UIView, UIView);
        CGPoint center = _self.center;
        center.y= fromView.center.y;
        _self.center = center;
        return _self;
    };
}
- (void)setViewUICopyCenterY:(UIView *(^)(UIView *))viewUICopyCenterY{};

- (UIView *(^)(UIView *, CGFloat))viewUITopTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = toView.viewMaxY()+ margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUITopTo:(UIView *(^)(UIView *, CGFloat))viewUITopTo{};

- (UIView *(^)(UIView *, CGFloat))viewUIBottonTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = toView.frame.origin.y - margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUIBottonTo:(UIView *(^)(UIView *, CGFloat))viewUIBottonTo{};

- (UIView *(^)(UIView *, CGFloat))viewUILeftTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = toView.frame.origin.x - frame.size.width- margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUILeftTo:(UIView *(^)(UIView *, CGFloat))viewUILeftTo{};

- (UIView *(^)(UIView *, CGFloat))viewUIRightTo
{
    return ^(UIView* toView, CGFloat margin){
        LinkError_REF_AUTO(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = toView.viewMaxX() + margin;
        _self.frame = frame;
        return _self;
    };
}
- (void)setViewUIRightTo:(UIView *(^)(UIView *, CGFloat))viewUIRightTo{};

- (CGFloat (^)())viewMaxX
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return 0.0;
        }
        return CGRectGetMaxX(_self.frame);
    };
}
- (void)setViewMaxX:(CGFloat (^)())viewMaxX{};

- (CGFloat (^)())viewMaxY
{
    return ^(){
        LinkError_VAL_IF(UIView){
            return 0.0;
        }
        return CGRectGetMaxY(_self.frame);
    };
}
- (void)setViewMaxY:(CGFloat (^)())viewMaxY{};
@end
