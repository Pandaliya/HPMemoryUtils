//
//  HPObserver.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "HPObserver.h"

@implementation HPObserver

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    if (self.changeBlock) {
        self.changeBlock(change);
    }
}

- (void)dealloc
{
    NSLog(@"%@, deallocing", self);
}

@end
