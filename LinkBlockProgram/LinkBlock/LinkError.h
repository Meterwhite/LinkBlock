//
//  LinkError.h
//  LinkBlockProgram
//
//  Created by NOVO on 15/8/20.
//  Copyright (c) 2015年 QuXingYi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  this object is a message for next code.
 */
@interface LinkError : NSObject<NSCopying>
+ (LinkError*)share;
@end
