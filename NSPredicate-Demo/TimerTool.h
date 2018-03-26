//
//  TimerTool.h
//  NSPredicate-Demo
//
//  Created by apple on 2018/2/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerTool : NSObject
+ (TimerTool *)sharInstance;
- (void)initTimer;
- (void)startTimer;
- (void)spauseTimer;
@end
