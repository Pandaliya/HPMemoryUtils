//
//  HPObservered.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "HPObservered.h"

@implementation HPObservered

- (void)dealloc
{
    NSLog(@"%@ deallocing", self);
}

//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
//                       context:(void *)context
//{
//    NSLog(@"object: %@ changes: %@", object ,change);
//}

@end
