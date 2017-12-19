//
//  HPTimerTask.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/11/29.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "HPTimerTask.h"

@interface HPTimerTask ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HPTimerTask

@synthesize target = _target;
@synthesize selector = _selector;

- (instancetype)initWithIntervel:(NSTimeInterval)intervel
                          target:(id)target
                        selector:(SEL)selector
{
    self = [super init];
    
    if (self) {
        _target = target;
        _selector = selector;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:intervel
                                                      target:self
                                                    selector:@selector(timerTask:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
    
    return self;
}

- (void)shutdown
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark support

- (void)timerTask:(NSTimer *)timer {
    
    // 执行复杂的timer任务
    // ..
    
    // UI 回调
    if ([_target respondsToSelector:_selector]) {
        
        IMP imp = [_target methodForSelector:_selector];
        void (*func)(id, SEL) = (void *)imp;
        func(_target, _selector);
        
    }
}

@end
