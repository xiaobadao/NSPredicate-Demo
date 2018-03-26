//
//  Student.h
//  NSPredicate-Demo
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

+ (Student*)init:(NSString *)name age:(NSInteger)age;
@end
