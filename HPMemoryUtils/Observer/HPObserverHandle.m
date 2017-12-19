//
//  HPObserverHandle.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "HPObserverHandle.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored  "-Wincompatible-pointer-types"

@interface HPObserverHandle ()

@property (nonatomic, weak) NSObject *obj; //不要强引用被观察者
@property (nonatomic, strong) NSString *keypath;
@property (nonatomic, strong, nonnull) HPObserver *observer;

- (nonnull HPObserver *)observer;

@end

@implementation HPObserverHandle

- (instancetype)initWithObserver:(nonnull HPObserver *)observer target:(NSObject *)target keyPath:(NSString *)path
{
    self = [super init];
    
    if (self) {
        self.keypath = path;
        self.obj = target;
        self.observer = observer;
        
        [self.obj addObserver:self.observer
                   forKeyPath:self.keypath
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    }
    
    return self;
}

- (void)removeObserver {
    if (self.observer) {
        [self.obj removeObserver:self.observer forKeyPath:self.keypath context:NULL];
    }
    
    self.obj = nil;
}

- (void)dealloc
{
    NSLog(@"%@, deallocing", self);
    
    [self removeObserver];
}

#pragma clang diagnostic pop

@end
