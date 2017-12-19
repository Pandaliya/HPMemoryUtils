//
//  HPObserverManager.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "HPObserverManager.h"

@implementation HPObserverManager

+ (HPObserverHandle *)addOberserToObject:(nonnull NSObject *)obj
                                  forKey:(nonnull NSString *)keyPath
                                   block:(OBJChanges)change {
    
    HPObserver *obs = [[HPObserver alloc] init];
    obs.changeBlock = change;
    return [[HPObserverHandle alloc] initWithObserver:obs target:obj keyPath:keyPath];
}

@end
