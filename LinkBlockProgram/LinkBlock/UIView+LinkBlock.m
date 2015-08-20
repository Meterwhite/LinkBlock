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
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.frame= CGRectMake(x, y, width, height);
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetX
{
    return ^(CGFloat x){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.x = x;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetY
{
    return ^(CGFloat y){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGRect frame = _self.frame;
        frame.origin.y = y;
        _self.frame = frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetCenterX
{
    return ^(CGFloat centerX){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGPoint center = _self.center;
        center.x = centerX;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetCenterY
{
    return ^(CGFloat centerY){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGPoint center = _self.center;
        center.y = centerY;
        _self.center = center;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetWidth
{
    return ^(CGFloat width){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGRect frame= _self.frame;
        frame.size.width= width;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewSetHeight
{
    return ^(CGFloat height){
        LinkError_REF_AUTO_IF(UIView, UIView);
        CGRect frame= _self.frame;
        frame.size.height= height;
        _self.frame= frame;
        return _self;
    };
}

- (UIView *(^)(CGFloat,CGFloat))viewSetSize
{
    return ^(CGFloat width, CGFloat height){
        LinkError_REF_AUTO_IF(UIView, UIView);
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
        LinkError_REF_AUTO_IF(UIView, UIView);
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
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.backgroundColor= colore;
        return _self;
    };
}
- (UIView *(^)(CGFloat x,CGFloat y))viewSetCenter
{
    return ^(CGFloat x,CGFloat y){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.center = CGPointMake(x, y);
        return _self;
    };
}

- (UIView *(^)(UIColor *))viewBorderColor
{
    return ^(UIColor* color){
        LinkError_REF_AUTO_IF(UIView, UIView);
        if(color.objIsKind([UIColor class])){
            _self.layer.borderColor= color.CGColor;
        }
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewBorderWidth
{
    return ^(CGFloat width){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.layer.borderWidth= width;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewCornerRadius
{
    return ^(CGFloat cornerRadius){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.layer.cornerRadius= cornerRadius;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMasksToBounds
{
    return ^(BOOL flag){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.layer.masksToBounds= flag;
        return _self;
    };
}

- (UIView *(^)())viewFirstResponderSubViewForInput
{
    return ^(){
        LinkError_REF_AUTO_IF(UIView, UIView);
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
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.userInteractionEnabled = b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewMultipleTouchEnabled
{
    return ^(BOOL b){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.multipleTouchEnabled =b;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewExclusiveTouch
{
    return ^(BOOL b){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.exclusiveTouch = b;
        return _self;
    };
}

- (UIView *(^)(UIViewAutoresizing))viewAutoresizingMask
{
    return ^(UIViewAutoresizing mask){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.autoresizingMask = mask;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewClipsToBounds
{
    return ^(BOOL b){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.clipsToBounds = YES;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewAlpha
{
    return ^(CGFloat alpha){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.alpha= alpha;
        return _self;
    };
}

- (UIView *(^)(CGFloat))viewOpaque
{
    return ^(CGFloat opaque){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.opaque = opaque;
        return _self;
    };
}

- (UIView *(^)(BOOL))viewHidden
{
    return ^(BOOL b){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.hidden= b;
        return _self;
    };
}

- (UIView *(^)(UIViewContentMode))viewContentMode
{
    return ^(UIViewContentMode contentMode){
        LinkError_REF_AUTO_IF(UIView, UIView);
        _self.contentMode = contentMode;
        return _self;
    };
}


- (UIView *(^)(NSUInteger))viewSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO_IF(UIView, UIView);
        UIView* re= nil;
        if(index< _self.subviews.count)
            return (UIView*)(_self.subviews[index]);
        return re;
    };
}
- (UIView *(^)())viewRemoveFromSuperview
{
    return ^(){
        LinkError_REF_AUTO_IF(UIView, UIView);
        [_self removeFromSuperview];
        return _self;
    };
}
- (UIView *(^)(NSUInteger))viewRemoveSubviewAt
{
    return ^(NSUInteger index){
        LinkError_REF_AUTO_IF(UIView, UIView);
        return _self.viewSubviewAt(index).viewRemoveFromSuperview();
    };
}

- (UIView *(^)(NSUInteger, NSUInteger))viewExchangeSubviewByIndex
{
    return ^(NSUInteger index1, NSUInteger index2){
        LinkError_REF_AUTO_IF(UIView, UIView);
        [_self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return _self;
    };
}

- (UIView *(^)(UIView *))viewRemoveSubviewTry
{
    return ^(UIView* view){
        LinkError_REF_AUTO_IF(UIView, UIView);
        if([view isKindOfClass:[UIView class]] && view.viewIsSubviewTo(_self)){
            view.viewRemoveFromSuperview();
        }
        return _self;
    };
}

- (UIView *(^)())viewRemoveAll
{
    return ^(){
        LinkError_REF_AUTO_IF(UIView, UIView);
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
        LinkError_REF_AUTO_IF(UIView, UIView);
        if([subview isKindOfClass:[UIView class]]){
            [_self addSubview:subview];
        }
        return _self;
    };
}

- (UIView *(^)(UIView *))viewAddToView
{
    return ^(UIView* view){
        LinkError_REF_AUTO_IF(UIView, UIView);
        if([view isKindOfClass:[UIView class]]){
            [view addSubview:_self];
        }
        return _self;
    };
}

- (UIView *(^)(UIView *, NSUInteger))viewInsertSubviewAtIndex
{
    return ^(UIView* view, NSUInteger index){
        LinkError_REF_AUTO_IF(UIView, UIView);
        [_self insertSubview:view atIndex:index];
        return _self;
    };
}
- (void)setViewInsertSubviewAtIndex:(UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex{};

- (UIView* (^)(BOOL))viewSubiewsExclusiveTouch
{
    return ^(BOOL b){
        LinkError_REF_AUTO_IF(UIView, UIView);
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
        LinkError_REF_AUTO_IF(UIView, UIView);
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

@end
