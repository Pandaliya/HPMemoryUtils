//
//  NSObject+HPMemory.h
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/11/29.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 获取应用占用的内存

 @return 占用内存，单位bit
 */
extern vm_size_t hp_getUsedMemory(void);


/**
 获取本机剩余内存

 @return 空余内存，单位bit
 */
extern vm_size_t hp_getFreeMemory(void);

@interface NSObject (HPMemory)

@end
