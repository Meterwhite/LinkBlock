//
//  Man.h
//  LinkBlockProgram
//
//  Created by MDLK on 16/8/24.
//  Copyright © 2016年 QuXingYi. All rights reserved.
//

#import "Person.h"

@interface Man : Person
@property (nonatomic,strong) Man* sun;
@property (nonatomic,strong) NSArray<Person*>* family;
@end
