//
//  TimerTool.m
//  NSPredicate-Demo
//
//  Created by apple on 2018/2/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TimerTool.h"
@interface TimerTool()
{
    NSTimer *timer;
}
@end
static TimerTool *timerTool;

@implementation TimerTool
+ (TimerTool *)sharInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timerTool = [[TimerTool alloc] init];
    });
    return timerTool;
}
- (void)initTimer{
    timer = [NSTimer timerWithTimeInterval:10 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"TIMER");
       
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [self startTimer];
    
}
- (void)startTimer{
    // 启动定时器
    timer.fireDate = [NSDate date];
}
- (void)spauseTimer{
    //停止定时器
    timer.fireDate = [NSDate distantFuture];
}
@end
