//
//  NSNil.h
//  NSBlackHoleProgram
//
//  Created by Novo on 2017/12/28.
//  Copyright © 2017年 Novo. All rights reserved.
//

#import "NSBlackHole.h"

/**
 *黑洞对象
 *该对象不响应任何消息；是具有nil性质的对象；因此与同样是nil装箱形式的NSNull对象区分开；
 *由于objc不能重载"=="，所以有一点要注意"NSBlackHole.value == nil"返回的是NO；使用"isEqual:"方法才能返回YES
 */
#ifndef NSNil
#define NSNil (NSBlackHole.value)
#endif

