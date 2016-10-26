//
//  Others+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LinkBlock.h"

@interface NSObject(OtherLinkBlock)
@property (nonatomic,copy,readonly) id (^end)()
    NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEnd替代end()");

@property (nonatomic,copy,readonly) id (^ends)()
    NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEnds替代ends()");

@property (nonatomic,copy,readonly) id (^endsAt)(NSUInteger idx)
    NS_DEPRECATED_IOS(2_0, 2_0, "使用linkEndsAt(idx)替代endsAt(idx)");

@property (nonatomic,copy,readonly) BOOL (^arrIsContainer)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrContain(obj)替代arrIsContainer(obj)");

@property (nonatomic,copy,readonly) BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContain(str)替代strIsContain(str)");

@property (nonatomic,copy,readonly) NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrObjsOfType(typeClass)替代arrValuesOfType(typeClass)");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "使用- linkInBlock替代- newLink");
@end
