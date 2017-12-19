//
//  HPObserverHandle.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HPObserver;

@interface HPObserverHandle : NSObject

- (instancetype _Nullable )initWithObserver:(nonnull HPObserver *)observer
                          target:(nonnull NSObject *)target
                         keyPath:(nonnull NSString *)path;

@end
