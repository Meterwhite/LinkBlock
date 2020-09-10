//
//  TViewling.h
//  Objcling
//
//  Created by meterwhite on 2020/8/25.
//  Copyright © 2020 Meterwhite. All rights reserved.
//

#import "TObjectling.h"

@class TViewling, TValueling, TImageViewling;

NS_ASSUME_NONNULL_BEGIN
@protocol TViewLetling <NSObject>

@property (readonly) TViewling<TViewLetling> *userInteractionEnabled;

@property (readonly) TViewling<TViewLetling> *userInteractionDisabled;

@property (readonly) TViewling<TViewLetling> *hide;

@property (readonly) TViewling<TViewLetling> *noHide;

@property (readonly) TViewling<TViewLetling> *clip;

@property (readonly) TViewling<TViewLetling> *noClip;


@property (readonly) TViewling<TViewLetling> *contentScaleToFill;
@property (readonly) TViewling<TViewLetling> *contentScaleAspectFit;
@property (readonly) TViewling<TViewLetling> *contentScaleAspectFill;
@property (readonly) TViewling<TViewLetling> *contentRedraw;
@property (readonly) TViewling<TViewLetling> *contentCenter;
@property (readonly) TViewling<TViewLetling> *contentTop;
@property (readonly) TViewling<TViewLetling> *contentBottom;
@property (readonly) TViewling<TViewLetling> *contentLeft;
@property (readonly) TViewling<TViewLetling> *contentRight;
@property (readonly) TViewling<TViewLetling> *contentTopLeft;
@property (readonly) TViewling<TViewLetling> *contentTopRight;
@property (readonly) TViewling<TViewLetling> *contentBottomLeft;
@property (readonly) TViewling<TViewLetling> *contentBottomRight;

@property (readonly) TViewling<TViewLetling> *forceEndEditing;
@property (readonly) TViewling<TViewLetling> *sendBack;
@property (readonly) TViewling<TViewLetling> *bringFront;
@property (readonly) TViewling<TViewLetling> *snapshot;

@property (readonly) TViewling<TViewLetling> *removeConstraints;

@end

@interface TViewling : TObjectling

@property (readonly) TViewling<TViewLetling> *let;

#pragma mark - 增
@property (readonly) TViewling *(^insertto)(UIView *v);
@property (readonly) TViewling *(^addSubview)(UIView *v);
#pragma mark - 删
@property (readonly) TViewling *(^remove)(UIView *v);
@property (readonly) TViewling *removed;
@property (readonly) TViewling *removeSubviews;
#pragma mark - 改
@property (readonly) TViewling *(^text)(NSString *txt);
@property (readonly) TViewling *(^color)(UIColor *color);
@property (readonly) TViewling *(^font)(UIFont *font);
@property (readonly) TImageViewling*(^imagedWith)(NSString *name);
@property (readonly) TViewling *(^bgcolor)(UIColor *color);
@property (readonly) TViewling *(^frame)(CGFloat x,CGFloat y,CGFloat w,CGFloat h);
@property (readonly) TViewling *(^origin)(CGFloat x,CGFloat y);
@property (readonly) TViewling *(^center)(CGFloat x,CGFloat y);
@property (readonly) TViewling *(^size)(CGFloat w,CGFloat h);
@property (readonly) TViewling *(^x)(CGFloat x);
@property (readonly) TViewling *(^y)(CGFloat y);
@property (readonly) TViewling *(^width)(CGFloat w);
@property (readonly) TViewling *(^height)(CGFloat h);
@property (readonly) TViewling *(^alpha)(CGFloat a);
@property (readonly) TViewling *(^opaque)(CGFloat oq);
@property (readonly) TViewling *(^userInteraction)(bool enabled);
@property (readonly) TViewling *(^clips)(bool b);
@property (readonly) TViewling *(^corner)(CGFloat radius);
@property (readonly) TViewling *(^contentMode)(UIViewContentMode mode);

@property (readonly) TValueling *theFrame;
@property (readonly) TValueling *theBound;
@property (readonly) TValueling *theCenter;

@property (readonly) TViewling *theConstraintWidth;
@property (readonly) TViewling *theConstraintHeight;
@property (readonly) TViewling *theConstraintTop;
@property (readonly) TViewling *theConstraintBottom;
@property (readonly) TViewling *theConstraintLeading;
@property (readonly) TViewling *theConstraintTrailing;
@property (readonly) TViewling *theConstraintLeft;
@property (readonly) TViewling *theConstraintRight;
@property (readonly) TViewling *theConstraintLeftOrLeading;
@property (readonly) TViewling *theConstraintRightOrTrailing;
@property (readonly) TViewling *theConstraintCenterX;
@property (readonly) TViewling *theConstraintCenterY;
@property (readonly) TViewling *theConstraintBaseline;
@property (readonly) TViewling *theConstraintLastBaseline;
@property (readonly) TViewling *theConstraintFirstBaseline;

@property (readonly) TViewling *(^constraintWidth)(CGFloat f);
@property (readonly) TViewling *(^constraintHeight)(CGFloat f);
@property (readonly) TViewling *(^constraintTop)(CGFloat f);
@property (readonly) TViewling *(^constraintBottom)(CGFloat f);
@property (readonly) TViewling *(^constraintLeading)(CGFloat f);
@property (readonly) TViewling *(^constraintTrailing)(CGFloat f);
@property (readonly) TViewling *(^constraintLeft)(CGFloat f);
@property (readonly) TViewling *(^constraintRight)(CGFloat f);
@property (readonly) TViewling *(^constraintLeftOrLeading)(CGFloat f);
@property (readonly) TViewling *(^constraintRightOrTrailing)(CGFloat f);
@property (readonly) TViewling *(^constraintCenterX)(CGFloat f);
@property (readonly) TViewling *(^constraintCenterY)(CGFloat f);
@property (readonly) TViewling *(^constraintBaseline)(CGFloat f);
@property (readonly) TViewling *(^constraintLastBaseline)(CGFloat f);
@property (readonly) TViewling *(^constraintFirstBaseline)(CGFloat f);



#pragma mark - 查
@property (readonly) TViewling *isHidden;

@end


@interface TViewling (ObjclingGoing)

@end

NS_ASSUME_NONNULL_END
