//
//  HPObservered.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPObserverManager.h"

@interface HPObservered : NSObject

@property (nonatomic,copy) NSString *names;
@property (nonatomic, strong) HPObserverHandle *objNamesHandle;

@end
