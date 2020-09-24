//
//  MRCViewController.m
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import "MRCViewController.h"

@interface MRCViewController ()

@end

@implementation MRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *array = [NSMutableArray array];//[NSMutableArray array]创建后引用计数器为1
    NSLog(@"array的对象地址:%p,array的retainCount:%zd",array,[array retainCount]);
    NSLog(@"%@",array);
    [array release];//调用release后[NSMutableArray array]创建的对象引用计数-1.
    
    //当程序执行到[array addObject:@"1234"];这里是就会崩溃。因为此时array指针指向的内存地址中没有任何对象，该指针是一个野指针。
    //因为release后[NSMutableArray array]创建的对象引用计数变为了0.系统就会销毁这个内存地址的对象。
    [array addObject:@"1234"];
    NSLog(@"array的对象地址:%p,array的retainCount:%zd",array,[array retainCount]);
    NSLog(@"%@",array);
}

@end
