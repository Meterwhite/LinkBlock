//
//  CABasicAnimation+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 17/4/26.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

#ifndef CAAnimationNew
#define CAAnimationNew ([CAAnimation animation])
#endif

#ifndef CAPropertyAnimationNew
#define CAPropertyAnimationNew ([CAPropertyAnimation animation])
#endif

#ifndef CABasicAnimationNew
#define CABasicAnimationNew ([CABasicAnimation animation])
#endif

#ifndef CAKeyframeAnimationNew
#define CAKeyframeAnimationNew ([CAKeyframeAnimation animation])
#endif

#ifndef CASpringAnimationNew
#define CASpringAnimationNew ([CASpringAnimation animation])
#endif

#ifndef CAAnimationGroupNew
#define CAAnimationGroupNew ([CAAnimationGroup animation])
#endif


/**
 include CAAnimation，CAPropertyAnimation，CABasicAnimation，CAKeyframeAnimation，CASpringAnimation的扩展
 */
@interface NSObject(CAAnimationsLinkBlock)
#pragma mark - Foundation Mirror/镜像
#pragma mark -- CAAnimation

@property(nonatomic,copy,readonly)
    CAAnimation*(^animationRemovedOnCompletion)(BOOL removedOnCompletion);

LBDeclare CAAnimation*              (^animationTimingFunction)(CAMediaTimingFunction* timingFunction);

#pragma mark -- CAPropertyAnimation
LBDeclare CAPropertyAnimation*      (^animationKeyPath)(NSString *keyPath);
LBDeclare CAPropertyAnimation*      (^animationValueFunction)(CAValueFunction *valueFunction);

#pragma mark -- CAKeyframeAnimation
LBDeclare CAKeyframeAnimation*      (^animationValues)(NSArray *values);
LBDeclare CAKeyframeAnimation*      (^animationPath)(CGPathRef path);
LBDeclare CAKeyframeAnimation*      (^animationKeyTimes)(NSArray<NSNumber *> *keyTimes);
LBDeclare CAKeyframeAnimation*      (^animationTimingFunctions)(NSArray<CAMediaTimingFunction *> *timingFunctions);
LBDeclare CAKeyframeAnimation*      (^animationCalculationMode)(NSString *calculationMode);
LBDeclare CAKeyframeAnimation*      (^animationTensionValues)(NSArray<NSNumber *> *tensionValues);
LBDeclare CAKeyframeAnimation*      (^animationContinuityValues)(NSArray<NSNumber *> *continuityValues);
LBDeclare CAKeyframeAnimation*      (^animationBiasValues)(NSArray<NSNumber *> *biasValues);
LBDeclare CAKeyframeAnimation*      (^animationRotationMode)(NSString *rotationMode);

#pragma mark -- CASpringAnimation
LBDeclare CASpringAnimation*        (^animationMass)(CGFloat mass);
LBDeclare CASpringAnimation*        (^animationStiffness)(CGFloat stiffness);
LBDeclare CASpringAnimation*        (^animationDamping)(CGFloat damping);
LBDeclare CASpringAnimation*        (^animationInitialVelocity)(CGFloat initialVelocity);

#pragma mark -- CABasicAnimation
LBDeclare CABasicAnimation*         (^animationFromValue)(id value);
LBDeclare CABasicAnimation*         (^animationToValue)(id value);
LBDeclare CABasicAnimation*         (^animationByValue)(id value);

#pragma mark -- CAAnimationGroup
LBDeclare CAAnimationGroup*         (^animationGroupAnimations)(NSArray<CAAnimation *> *animations);
@end
