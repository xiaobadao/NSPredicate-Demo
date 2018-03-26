//
//  Student.m
//  NSPredicate-Demo
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Student.h"

@implementation Student
+ (Student*)init:(NSString *)name age:(NSInteger)age{
    Student *st = [[Student alloc] init];
    st.name = name;
    st.age = age;
    return st;
}
- (void)encodeWithCoder:(NSCoder*)aCoder {
    NSLog(@"%s",__func__);
    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.age forKey:@"age"];
//    [aCoder encodeInteger:self.age forKey:kStudentAgeKey];
}

//实现解码协议,当此类的对象被反归档时，首先通过解码协议方法来获取对应的属性值
- (id)initWithCoder:(NSCoder*)aDecoder {
    self = [super init];
    if (self) {
        self.name= [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
//        self.sex= [aDecoder decodeObjectForKey:@""];
        NSLog(@"%s",__func__);
    }
    return self;
}
@end
