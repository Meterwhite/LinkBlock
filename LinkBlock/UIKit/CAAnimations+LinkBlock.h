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
 整合CAAnimation，CAPropertyAnimation，CABasicAnimation，CAKeyframeAnimation，CASpringAnimation的扩展
 */
@interface NSObject(CAAnimationsLinkBlock)

#pragma mark - CAAnimation
/** <^(BOOL removedOnCompletion)> */
LBDeclare CAAnimation*              (^animationRemovedOnCompletion)(BOOL removedOnCompletion);
/** <^(CAMediaTimingFunction* timingFunction)> */
LBDeclare CAAnimation*              (^animationTimingFunction)(CAMediaTimingFunction* timingFunction);

#pragma mark - CAPropertyAnimation
/** <^(NSString *keyPath)> */
LBDeclare CAPropertyAnimation*      (^animationKeyPath)(NSString *keyPath);
/** <^(CAValueFunction *valueFunction)> */
LBDeclare CAPropertyAnimation*      (^animationValueFunction)(CAValueFunction *valueFunction);

#pragma mark - CAKeyframeAnimation
/** <^(NSArray *values)> */
LBDeclare CAKeyframeAnimation*      (^animationValues)(NSArray *values);
/** <^(CGPathRef path)> */
LBDeclare CAKeyframeAnimation*      (^animationPath)(CGPathRef path);
/** <^(NSArray<NSNumber *> *keyTimes)> */
LBDeclare CAKeyframeAnimation*      (^animationKeyTimes)(NSArray<NSNumber *> *keyTimes);
/** <^(NSArray<CAMediaTimingFunction *> *timingFunctions)> */
LBDeclare CAKeyframeAnimation*      (^animationTimingFunctions)(NSArray<CAMediaTimingFunction *> *timingFunctions);
/** <^(NSString *calculationMode)> */
LBDeclare CAKeyframeAnimation*      (^animationCalculationMode)(NSString *calculationMode);
/** <^(NSArray<NSNumber *> *tensionValues)> */
LBDeclare CAKeyframeAnimation*      (^animationTensionValues)(NSArray<NSNumber *> *tensionValues);
/** <^(NSArray<NSNumber *> *continuityValues)> */
LBDeclare CAKeyframeAnimation*      (^animationContinuityValues)(NSArray<NSNumber *> *continuityValues);
/** <^(NSArray<NSNumber *> *biasValues)> */
LBDeclare CAKeyframeAnimation*      (^animationBiasValues)(NSArray<NSNumber *> *biasValues);
/** <^(NSString *rotationMode)> */
LBDeclare CAKeyframeAnimation*      (^animationRotationMode)(NSString *rotationMode);

#pragma mark - CASpringAnimation
/** <^(CGFloat mass)> */
LBDeclare CASpringAnimation*        (^animationMass)(CGFloat mass);
/** <^(CGFloat stiffness)> */
LBDeclare CASpringAnimation*        (^animationStiffness)(CGFloat stiffness);
/** <^(CGFloat damping)> */
LBDeclare CASpringAnimation*        (^animationDamping)(CGFloat damping);
/** <^(CGFloat initialVelocity)> */
LBDeclare CASpringAnimation*        (^animationInitialVelocity)(CGFloat initialVelocity);

#pragma mark - CABasicAnimation
/** <^(id value)> */
LBDeclare CABasicAnimation*         (^animationFromValue)(id value);
/** <^(id value)> */
LBDeclare CABasicAnimation*         (^animationToValue)(id value);
/** <^(id value)> */
LBDeclare CABasicAnimation*         (^animationByValue)(id value);

#pragma mark - CAAnimationGroup
LBDeclare CAAnimationGroup*         (^animationGroupAnimations)(NSArray<CAAnimation *> *animations);
@end
