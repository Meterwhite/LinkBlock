//
//  NSPredicate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 2018/10/9.
//  Copyright © 2018 QuXingYi. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSPredicateLinkBlock)
- (NSCompoundPredicate *(^)(NSPredicate*))andPredicate
{
    return ^id(NSPredicate* predicate){
        
        LinkHandle_REF(NSPredicate)
        LinkGroupHandle_REF(andPredicate,predicate)
        
        return [NSCompoundPredicate andPredicateWithSubpredicates:@[_self,predicate]];
    };
}

- (NSCompoundPredicate *(^)(NSPredicate *))notPredicate
{
    return ^id(NSPredicate* predicate){
        
        LinkHandle_REF(NSPredicate)
        LinkGroupHandle_REF(notPredicate,predicate)
        
        NSCompoundPredicate* theNot = [NSCompoundPredicate notPredicateWithSubpredicate:predicate];
        return [NSCompoundPredicate andPredicateWithSubpredicates:@[_self,theNot]];
    };
}

- (NSCompoundPredicate *(^)(NSPredicate *))orPredicate
{
    return ^id(NSPredicate* predicate){
        
        LinkHandle_REF(NSPredicate)
        LinkGroupHandle_REF(orPredicate,predicate)
        
        return [NSCompoundPredicate orPredicateWithSubpredicates:@[_self,predicate]];
    };
}

@end
