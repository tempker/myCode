#什么是单例模式
***
单例模式是一种常用的软件设计模式。在它的核心结构中只包含一个被称为单例的特殊类。

#单例模式的作用是什么
***
通过单例模式可以保证系统中一个类只有一个实例而且该实例易于外界访问，从而方便对实例个数的控制并节约系统资源。
iOS中最常见的单例就是UIApplication,UIWindow.NSUserDefaults等

#单例模式有哪几种写法
***
>首先我们了解了什么是单例模式还有单例有什么作用.那么我们怎么能保证系统中只有一个实例被外界访问呢?
>
>其实也就是我们怎么能保证我们在程序中不论用什么方法创建的对象,也不管名字怎么变化,但实质都是一个对象呢?


1.通过创建类方法 (直接在类方法里面利用GCD做处理)创建单例

* 类方法的开头一般是Share,Default 
* 需要用到**GCD**的一个函数**dispatch_once**(保证代码被执行一次)
* 写法比较简单,但在在创建实例的时候只能用**自己定义的类方法** 不能**alloc**

.h 中

@interface WYYWorkTool : NSObject <NSCopying>

+(instancetype)shareWorkTool;

@end

.m 中

+(instancetype)shareWorkTool{
static id instance = nil;
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
instance = [[WYYWorkTool alloc]init];
});
return instance;
}
![Snip20160616_2.png](http://upload-images.jianshu.io/upload_images/2268530-659ee7604ee4f160.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![Snip20160616_5.png](http://upload-images.jianshu.io/upload_images/2268530-6eeed0c8d35a44e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
>明显可以看出只有用类方法创建对象的实现单例,alloc创建不相同地址的对象,就不是一个对象,也就符合单例模式


2.通过创建类方法 (不再类方法里面做处理,而是从根源上封堵创建对象给对象分配内存的所有方法)创建单例
.m 中

+(instancetype)shareWorkTool{
static id instance = nil;
return [[self alloc]init];
}

//通过alloc方法创建对象的方法
+(instancetype)allocWithZone:(struct _NSZone *)zone{

static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
instance = [super allocWithZone:zone];
});
return instance;
}

//通过copy方法创建对象的方法
-(instancetype)copyWithZone:(NSZone *)zone{
return instance;
}


![
![Uploading Snip20160616_6_071514.png . . .]
](http://upload-images.jianshu.io/upload_images/2268530-0503bbb59f4997f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160616_6.png](http://upload-images.jianshu.io/upload_images/2268530-8501af83f3ead66d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>可以看出这种方法实现,至于我们用什么方法,创建几个,名字叫什么,都是扯淡,地址都是一样的,实质上都是一个对象.

#总结
***
>之于我们平时用哪一个呢? 当然是简单的好,但对于每一个合格的开发者而言单例具体实现的思路以及方法都是必须要掌握的.