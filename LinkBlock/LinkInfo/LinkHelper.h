//
//  LinkHelper.h
//  LinkBlockProgram
//
//  Created by NOVO on 2017/12/13.
//  Copyright © 2017年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"

@interface LinkHelper : NSProxy

+ (id)linkObj:(id)linkObj evalCode:(NSString*)code args:(va_list)args flag:(int)flag;



@end
