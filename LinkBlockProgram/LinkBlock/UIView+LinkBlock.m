//
//  UIView+LinkBlock.m
//
//  Created by NOVO on 15/8/12.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "UIView+LinkBlock.h"
#import "NSObject+LinkBlock.h"

@implementation UIView(LinkBlock)


- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockFrame
{
    return ^(CGFloat x,CGFloat y, CGFloat width, CGFloat height){
        self.frame= CGRectMake(x, y, width, height);
        return self;
    };
}

- (UIView *(^)(CGFloat))blockX
{
    return ^(CGFloat x){
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockY
{
    return ^(CGFloat y){
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockCenterX
{
    return ^(CGFloat centerX){
        CGPoint center = self.center;
        center.x = centerX;
        self.center = center;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockCenterY
{
    return ^(CGFloat centerY){
        CGPoint center = self.center;
        center.y = centerY;
        self.center = center;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockWidth
{
    return ^(CGFloat width){
        CGRect frame= self.frame;
        frame.size.width= width;
        self.frame= frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockHeight
{
    return ^(CGFloat height){
        CGRect frame= self.frame;
        frame.size.height= height;
        self.frame= frame;
        return self;
    };
}

- (UIView *(^)(CGFloat,CGFloat))blockSize
{
    return ^(CGFloat width, CGFloat height){
        CGRect frame= self.frame;
        frame.size.width= width;
        frame.size.height= height;
        self.frame= frame;
        return self;
    };
}

- (UIView *(^)(CGFloat,CGFloat))blockOrigin
{
    return ^(CGFloat x,CGFloat y){
        CGRect frame= self.frame;
        frame.origin.x= x;
        frame.origin.y= y;
        self.frame= frame;
        return self;
    };
}

- (UIView *(^)(UIColor *))blockBgColor
{
    return ^(UIColor *colore){
        self.backgroundColor= colore;
        return self;
    };
}
- (UIView *(^)(CGFloat x,CGFloat y))blockCenter
{
    return ^(CGFloat x,CGFloat y){
        self.center = CGPointMake(x, y);
        return self;
    };
}

- (UIView *(^)(UIColor *))blockBorderColor
{
    return ^(UIColor* color){
        if(color.blockIsKindOf([UIColor class])){
            self.layer.borderColor= color.CGColor;
        }
        return self;
    };
}

- (UIView *(^)(CGFloat))blockBorderWidth
{
    return ^(CGFloat width){
        self.layer.borderWidth= width;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockCornerRadius
{
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius= cornerRadius;
        return self;
    };
}

- (UIView *(^)(BOOL))blockMasksToBounds
{
    return ^(BOOL flag){
        self.layer.masksToBounds= flag;
        return self;
    };
}

- (UIView *(^)())blockFirstResponderSubView
{
    return ^(){
        __block UIView *re= nil;
        [self.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
            
            if(v.blockIsKindOf([UITextView class])|| v.blockIsKindOf([UITextField class])){
                if(v.isFirstResponder){
                    re= v;
                    *stop= YES;
                }
            }else{
                re= v.blockFirstResponderSubView();
                if(re) {
                    *stop= YES;
                }
            }
        }];
        return re;
    };
}

- (CGRect (^)())blockConvertRectToWindow
{
    return ^(){
        return [self.superview convertRect:self.frame toView:nil];
    };
}

- (BOOL (^)(UIView *))blockIsSubviewTo
{
    return ^(UIView *theView){
        __block BOOL reIsBool= NO;
        if([self.superview isEqual:theView]){
            reIsBool = YES;
        }else{
            reIsBool = self.superview.blockIsSubviewTo(theView);
        }
        return reIsBool;
    };
}

- (UIView *(^)(BOOL))blockUserInteractionEnabled
{
    return ^(BOOL b){
        self.userInteractionEnabled = b;
        return self;
    };
}

- (UIView *(^)(BOOL))blockMultipleTouchEnabled
{
    return ^(BOOL b){
        self.multipleTouchEnabled =b;
        return self;
    };
}

- (UIView *(^)(BOOL))blockExclusiveTouch
{
    return ^(BOOL b){
        self.exclusiveTouch = b;
        return self;
    };
}

- (UIView *(^)(UIViewAutoresizing))blockAutoresizingMask
{
    return ^(UIViewAutoresizing mask){
        self.autoresizingMask = mask;
        return self;
    };
}

- (UIView *(^)(BOOL))blockClipsToBounds
{
    return ^(BOOL b){
        self.clipsToBounds = YES;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockAlpha
{
    return ^(CGFloat alpha){
        self.alpha= alpha;
        return self;
    };
}

- (UIView *(^)(CGFloat))blockOpaque
{
    return ^(CGFloat opaque){
        self.opaque = opaque;
        return self;
    };
}

- (UIView *(^)(BOOL))blockHidden
{
    return ^(BOOL b){
        self.hidden= b;
        return self;
    };
}

- (UIView *(^)(UIViewContentMode))blockContentMode
{
    return ^(UIViewContentMode contentMode){
        self.contentMode = contentMode;
        return self;
    };
}

- (UIView *(^)())blockSuperview
{
    return ^(){
        return self.superview;
    };
}

- (NSArray *(^)())blockSubviews
{
    return ^(){
        return self.subviews;
    };
}

- (UIView *(^)(NSUInteger))blockSubviewAtIndex
{
    return ^(NSUInteger index){
        UIView* re= nil;
        if(index< self.subviews.count)
            return (UIView*)(self.subviews[index]);
        return re;
    };
}
- (UIView *(^)())blockRemoveFromSuperview
{
    return ^(){
        [self removeFromSuperview];
        return self;
    };
}
- (UIView *(^)(NSUInteger))blockRemoveSubviewAtIndex
{
    return ^(NSUInteger index){
        return self.blockSubviewAtIndex(index).blockRemoveFromSuperview();
    };
}
- (UIWindow *(^)())blockWindow
{
    return ^(){
        return self.window;
    };
}
- (UIView *(^)(NSUInteger, NSUInteger))blockExchangeSubviewByIndex
{
    return ^(NSUInteger index1, NSUInteger index2){
        [self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
        return self;
    };
}

- (UIView *(^)(UIView *))blockRemoveSubviewTry
{
    return ^(UIView* view){
        if([view isKindOfClass:[UIView class]] && view.blockIsSubviewTo(self)){
            view.blockRemoveFromSuperview();
        }
        return self;
    };
}

- (UIView *(^)())blockRemoveAllSubview
{
    return ^(){
        [self.subviews enumerateObjectsUsingBlock:^(UIView* v, NSUInteger idx, BOOL *stop) {
            if(v.blockIsKindOf([UIView class])){
                [v removeFromSuperview];
            }
        }];
        return self;
    };
}

- (UIView *(^)(UIView *))blockAddSubview
{
    return ^(UIView* subview){
        if([subview isKindOfClass:[UIView class]]){
            [self addSubview:subview];
        }
        return self;
    };
}

- (UIView *(^)(UIView *))blockAddToView
{
    return ^(UIView* view){
        if([view isKindOfClass:[UIView class]]){
            [view addSubview:self];
        }
        return self;
    };
}

- (UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex
{
    return ^(UIView* view, NSUInteger index){
        [self insertSubview:view atIndex:index];
        return self;
    };
}
- (void)setBlockInsertSubviewAtIndex:(UIView *(^)(UIView *, NSUInteger))blockInsertSubviewAtIndex{};

- (void (^)(BOOL))blockSubiewsExclusiveTouch
{
    return ^(BOOL b){
        [self.subviews enumerateObjectsUsingBlock:^(UIView* subView, NSUInteger idx, BOOL *stop) {
            if([subView isKindOfClass:[UIView class]]){
                subView.exclusiveTouch = b;
            }
        }];
    };
}
- (void)setBlockSubiewsExclusiveTouch:(void (^)(BOOL))blockSubiewsExclusiveTouch{};

- (UIView *(^)(UIRectCorner, CGSize))blockCornerRadiusSide
{
    return ^(UIRectCorner side , CGSize radius){
        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:side
                                                         cornerRadii:radius];
        CAShapeLayer* shape = [[CAShapeLayer alloc] init];
        shape.frame= self.frame;
        shape.path= path.CGPath;
        self.layer.mask = shape;
        return self;
    };
}
- (void)setBlockCornerRadiusSide:(UIView *(^)(UIRectCorner, CGSize))blockCornerRadiusSide{};

- (void)setBlockFrame:(UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))blockFrame{};
- (void)setBlockX:(UIView *(^)(CGFloat))blockX{};
- (void)setBlockY:(UIView *(^)(CGFloat))blockY{};
- (void)setBlockCenterX:(UIView *(^)(CGFloat))blockCenterX{};
- (void)setBlockCenterY:(UIView *(^)(CGFloat))blockCenterY{};
- (void)setBlockWidth:(UIView *(^)(CGFloat))blockWidth{};
- (void)setBlockHeight:(UIView *(^)(CGFloat))blockHeight{};
- (void)setBlockSize:(UIView *(^)(CGFloat, CGFloat))blockSize{};
- (void)setBlockOrigin:(UIView *(^)(CGFloat,CGFloat))blockOrigin{};
- (void)setBlockBgColor:(UIView *(^)(UIColor *))blockColor{};
- (void)setBlockCenter:(UIView *(^)(CGFloat x,CGFloat y))blockCenter{};
- (void)setBlockMasksToBounds:(UIView *(^)(BOOL))blockMasksToBounds{};
- (void)setBlockFirstResponderSubView:(UIView *(^)())blockFirstResponderSubView{};
- (void)setBlockBorderWidth:(UIView *(^)(CGFloat))blockBorderWidth{};
- (void)setBlockBorderColor:(UIView *(^)(UIColor *))blockBorderColor{};
- (void)setBlockCornerRadius:(UIView *(^)(CGFloat))blockCornerRadius{};
- (void)setBlockConvertRectToView:(CGRect (^)())blockConvertRectToWindow{};
- (void)setBlockIsSubviewTo:(BOOL (^)(UIView *))blockIsSubviewTo{};
- (void)setBlockConvertRectToWindow:(CGRect (^)())blockConvertRectToWindow{};
- (void)setBlockContentMode:(UIView *(^)(UIViewContentMode))blockContentMode{};
- (void)setBlockRemoveSubviewTry:(UIView *(^)(UIView *))blockRemoveSubviewTry{};
- (void)setBlockMultipleTouchEnabled:(UIView *(^)(BOOL))blockMultipleTouchEnabled{};
- (void)setBlockUserInteractionEnabled:(UIView *(^)(BOOL))blockUserInteractionEnabled{};
- (void)setBlockRemoveSubviewAtIndex:(UIView *(^)(NSUInteger))blockRemoveSubviewAtIndex{};
- (void)setBlockHidden:(UIView *(^)(BOOL))blockHidden{};
- (void)setBlockAutoresizingMask:(UIView *(^)(UIViewAutoresizing))blockAutoresizingMask{};
- (void)setBlockExclusiveTouch:(UIView *(^)(BOOL))blockExclusiveTouch{};
- (void)setBlockRemoveAllSubview:(UIView *(^)())blockRemoveAllSubview{};
- (void)setBlockRemoveFromSuperview:(UIView *(^)())blockRemoveFromSuperview{};
- (void)setBlockExchangeSubviewByIndex:(UIView *(^)(NSUInteger, NSUInteger))blockExchangeSubviewByIndex{};
- (void)setBlockWindow:(UIWindow *(^)())blockWindow{};
- (void)setBlockSubviewAtIndex:(UIView *(^)(NSUInteger))blockSubviewAtIndex{};
- (void)setBlockClipsToBounds:(UIView *(^)(BOOL))blockClipsToBounds{};
- (void)setBlockOpaque:(UIView *(^)(CGFloat))blockOpaque{};
- (void)setBlockAlpha:(UIView *(^)(CGFloat))blockAlpha{};
- (void)setBlockAddToView:(UIView *(^)(UIView *))blockAddToView{};
- (void)setBlockAddSubview:(UIView *(^)(UIView *))blockAddSubview{};
- (void)setBlockSuperview:(UIView *(^)())blockSuperview{};
- (void)setBlockSubviews:(NSArray *(^)())blockSubviews{};
@end
