//
//  NSObject+HPMemory.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/11/29.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "NSObject+HPMemory.h"
#import <mach/mach.h>

#pragma mark - memory measure

vm_size_t hp_getUsedMemory() {
    task_basic_info_data_t info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    
    if (kerr == KERN_SUCCESS) {
        return info.resident_size;
    } else {
        return 0;
    }
}

vm_size_t _getApp() {
    struct mach_task_basic_info info;
    mach_msg_type_number_t count = MACH_TASK_BASIC_INFO_COUNT;
    
    int r = task_info(mach_task_self(), MACH_TASK_BASIC_INFO, (task_info_t)& info, & count);
    if (r == KERN_SUCCESS)
    {
        return info.resident_size;
    }
    else
    {
        return -1;
    }
}

vm_size_t hp_getFreeMemory() {
    
    vm_statistics64_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return vm_page_size * (vmStats.free_count + vmStats.inactive_count);
}

@implementation NSObject (HPMemory)

@end
