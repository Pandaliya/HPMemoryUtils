# HPMemoryUtils
iOS high performance memory manager utils

#### 由下面几个部分组成

* NSTimer的block方法
* 内存测量方法
* 集中式的观察者管理

##### NSTimer+block

在iOS10之前NSTimer的应用方式主要是Target，timer会保持对Target的强引用，而Target也常常需要保持对timer的强引用。这样就需要开发者在合适的时间解开这个循环引用，释放timer和Target。这给开发带来了逻辑负担。NSTimer的block扩展解决了这一问题。使用方式类似于iOS10框架中提供的block方式。

##### 内存测量方法

提供两个常用方法：

* 测量应用占用的内存
* 和空余内存

使用这些方法获取的内存可能和Xcode中显示的内存有差别，主要是由于计算方法的不同

##### 集中式的观察者管理

根据官方文档中关键添加观察者的说明

> 方法 `addObserver:forKeyPath:options:context:` 不会维持观察者对象，被观察对象和上下文的强引用。如果必要，需要开发者维护对他们的强引用。

这需要我们关注观察者的生命周期，需要在生命结束时解除引用，或者保持和被观察者相同的生命周期。

在集中式观察者管理中，为每一个观察行为都创建一个新的行为对象，而这个行为对象作为一个实际观察者的属性

示例：

```objective-c
@interface ViewController (){
// 创建一个观察行为对象作为属性
@property (nonatomic, strong) HPObserverHandle *objNameHandle;
@end
  
- (void)observerTest {
    HPObservered *obed = [HPObservered new];
    // 创建观察行为，注意避免循环引用
    self.objNameHandle = [HPObserverManager addOberserToObject:obed forKey:@"names"   block:^(NSDictionary *changes) {
        NSLog(@"%@", changes);
    }];
    obed.names = @"o.zhang";
}
```

