//
//  HPTimerTask.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/11/29.
//  Copyright © 2017年 Panda. All rights reserved.
//

/*
 说明:
 - 把timer 任务重构为一个单独的类，既能保持代码整洁，还可以解决timer的循环引用问题
 - 这里只提供一种重构的简单例子
 - 对象创建成功即开启timer
 */

#import <Foundation/Foundation.h>

@interface HPTimerTask : NSObject

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, assign, readonly) SEL selector;

- (instancetype)initWithIntervel:(NSTimeInterval)intervel
                          target:(id)target
                        selector:(SEL)selector;

/**
 停止timer任务，在使用任务类的dealloc方法中调用
 */
- (void)shutdown;

@end
