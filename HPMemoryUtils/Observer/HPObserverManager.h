//
//  HPObserverManager.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPObserverHandle.h"
#import "HPObserver.h"

@interface HPObserverManager : NSObject

/**
 创建观察者

 @param obj 被观察对象
 @param keyPath 被观察对象属性
 @param change 修改内容字典
 @return 观察者
 */
+ (HPObserverHandle *_Nullable)addOberserToObject:(nonnull NSObject *)obj
                                           forKey:(nonnull NSString *)keyPath
                                            block:(nullable OBJChanges)change;


@end
