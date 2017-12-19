//
//  HPObserver.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/12/19.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OBJChanges)(NSDictionary *changes);

@interface HPObserver : NSObject

@property (nonatomic, copy) OBJChanges changeBlock;

@end
