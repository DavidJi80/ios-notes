//
//  SingletonARC.m
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import "SingletonARC.h"

// 创建静态对象 防止外部访问
static SingletonARC *_instance;

@implementation SingletonARC

// 首先需要使用GCD来实现的单例创建
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            //不能再使用alloc方法
            //因为已经重写了allocWithZone方法，所以这里要调用父类的分配空间的方法
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance{
    //return _instance;
    // 最好用self 用Tools他的子类调用时会出现错误
    return [[self alloc]init];
}

// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

@end
