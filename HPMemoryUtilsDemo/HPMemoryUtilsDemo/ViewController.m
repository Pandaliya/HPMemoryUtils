//
//  ViewController.m
//  HPMemoryUtilsDemo
//
//  Created by zhangpan on 2017/11/29.
//  Copyright © 2017年 Panda. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HPMemory.h"
#import "HPObservered.h"
#import "HPObserverManager.h"

@interface ViewController (){
    HPObservered *_obed;
}
@property (nonatomic, copy) NSString* names;
@property (nonatomic, strong) HPObserverHandle *objNameHandle;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"used - %ld", hp_getUsedMemory()/1024/1024);
    NSLog(@"free - %ld", hp_getFreeMemory()/1024/1024);
    
    [self observerTest];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                           target:self
                                                                                           action:@selector(rightAction)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)rightAction {
    self.names = @"r.zhang";
}

#pragma mark - observer

- (void)observerTest {
    
    HPObservered *obed = [HPObservered new];
    _obed = obed;
    
//    [obed addObserver:self forKeyPath:@"names" options:NSKeyValueObservingOptionNew context:nil];
//
//    [self addObserver:obed forKeyPath:@"names" options:NSKeyValueObservingOptionNew context:nil];
//
//    obed.names = @"o.zhang";
//    self.names = @"c.zhang";
    
    self.objNameHandle = [HPObserverManager addOberserToObject:obed forKey:@"names" block:^(NSDictionary *changes) {
        NSLog(@"%@", changes);
    }];
    obed.names = @"o.zhang";

    
    obed.objNamesHandle = [HPObserverManager addOberserToObject:self forKey:@"names" block:^(NSDictionary *changes) {
        NSLog(@"%@", changes);
    }];
    self.names = @"c.zhang";
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    NSLog(@"object: %@ changes: %@", object ,change);
}

- (void)dealloc
{
    NSLog(@"%@ deallocing", self);
}


#pragma mark - 新方法

/**
 new method : 返回父Controller时调用
 - navigation Controller 返回上一级时也会调用,从上一级进入时也会调用一次，进入下一级页面是不会调用
 */
- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
}

- (void)backItemClicked:(id)sender
{
    [self.navigationController pushViewController:[UIViewController new]
                                         animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
