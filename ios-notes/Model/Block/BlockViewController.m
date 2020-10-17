//
//  BlockViewController.m
//  ios-notes
//
//  Created by mac on 2020/10/16.
//

#import "BlockViewController.h"
#import "Person.h"

//Block 声明
typedef void(^MyBlock)(void);

int global_variate=40;                  //全局变量
static int static_global_variate=50;    //全局静态变量

@interface BlockViewController ()

@property (strong, nonatomic) UIButton *defineBlockBtn;
@property (strong, nonatomic) UIButton *variateBlockBtn;
@property (strong, nonatomic) UIButton *storeBlockBtn;
@property (strong, nonatomic) UIButton *weakBlockBtn;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBaseUI];
}

#pragma mark - BaseSet
- (void)configBaseUI{
    [self.view addSubview:self.defineBlockBtn];
    [self.defineBlockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.variateBlockBtn];
    [self.variateBlockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defineBlockBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.storeBlockBtn];
    [self.storeBlockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.variateBlockBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.weakBlockBtn];
    [self.weakBlockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storeBlockBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
}

#pragma mark - Lazy Init

- (UIButton *)defineBlockBtn{
    if (!_defineBlockBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"声明、定义和调用Block" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(defineBlock) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _defineBlockBtn = button;
    }
    return _defineBlockBtn;
}

- (UIButton *)variateBlockBtn{
    if (!_variateBlockBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"Block与外界变量" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(variateBlock) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _variateBlockBtn = button;
    }
    return _variateBlockBtn;
}

- (UIButton *)storeBlockBtn{
    if (!_storeBlockBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"Block类型及存储" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(storeBlock) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _storeBlockBtn = button;
    }
    return _storeBlockBtn;
}

- (UIButton *)weakBlockBtn{
    if (!_weakBlockBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"Block循环引用" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(weakBlock) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _weakBlockBtn = button;
    }
    return _weakBlockBtn;
}

#pragma mark - Action
//Block 可以定义在方法外部
void(^MyblockTwo)(int a) = ^(int a){
    NSLog(@"block2 有参数，无返回值。参数：%d",a);
};

int(^MyBlockThree)(int,int) = ^(int a,int b){
    NSLog(@"block3 有参数，有返回值。参数：%d,%d",a , b);
    return a + b;
};

int(^MyblockFour)(void) = ^{
    NSLog(@"block4 无参数，有返回值");
    return 45;
};

//Block 声明
typedef int(^MyBlockFive)(int,int);
//Block 定义
MyBlockFive myBlockFive=^(int a,int b){
    NSLog(@"block5 有参数，有返回值。参数：%d,%d",a , b);
    return a - b;
};

-(void)defineBlock{
    //Block 可以定义在方法内部
    void (^ MyBlockOne)(void) = ^(void){
        NSLog(@"block1 无参数，无返回值");
    };
    
    //block的调用
    MyBlockOne();
    
    MyblockTwo(100);
    
    int result3=MyBlockThree(12,56);
    NSLog(@"block3 返回值=%d",result3);
    
    int result4=MyblockFour();
    NSLog(@"block4 返回值=%d",result4);
    
    
    int result5=myBlockFive(9,4);
    NSLog(@"block4 返回值=%d",result5);

}

-(void)variateBlock{
    int age = 10;
    //block 将age复制到其数据结构中来实现访问的。
    MyBlock block01 = ^{
        NSLog(@"age = %d", age);
    };
    age = 18;
    //输出结果：age = 10。创建block的时候，已经把age的值存储在里面了。
    block01();
    
    blockAndVariate(10);
    
    __block int age2 = 10;
    //对于用 __block 修饰的外部变量引用，block 是复制其引用地址来实现访问的。
    MyBlock block02 = ^{
        age2++;
        NSLog(@"age = %d", age2);
    };
    age2 = 18;
    //输出为：age = 19
    block02();
    
    
}

void blockAndVariate(int local_variate)//函数参数
{
    auto int auto_variate = 20;     //自动变量
    static int static_variate = 30; //静态变量
    MyBlock block = ^{
        // local_variate++; //局部变量不能修改
        // auto_variate++;  //自动变量不能修改
        static_variate++;           //静态变量可修改
        global_variate++;           //全局变量可修改
        static_global_variate++;    //全局静态变量可修改
        NSLog(@"%d,%d,%d,%d,%d", local_variate,auto_variate,static_variate,global_variate,static_global_variate);
    };
    static_variate++;
    global_variate++;
    static_global_variate++;
    //输出结果：10,20,32,42,52。
    //愿意：auto变量和函数参数 block访问方式是值传递，static变量block访问方式是指针传递
    block();
}

-(void)storeBlock{
    //__NSGlobalBlock__
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };
    NSLog(@"%@",[block1 class]);
    NSLog(@"%@",[[block1 class] superclass]);
    NSLog(@"%@",[[[block1 class] superclass] superclass]);
    NSLog(@"%@",[[[[block1 class] superclass] superclass] superclass]);
    NSLog(@"%@",[[[[[block1 class] superclass] superclass] superclass] superclass]);
    
    //__NSMallocBlock__
    int age = 1;
    void (^block2)(void) = ^{
        NSLog(@"block2:%d",age);
    };
    
    //__NSStackBlock__
    NSLog(@"%@/%@/%@",[block1 class],[block2 class],[^{
        NSLog(@"block3:%d",age);
    } class]);
    
}

-(void)weakBlock{
    /*
     方法: __weak
     不会产生强引用，指向的对象销毁时，会自动让指针置为nil
     */
    Person *person = [[Person alloc] init];
    //__weak Person *weakPerson = person;
    __weak typeof(person) weakPerson = person;
    person.block = ^{
        NSLog(@"age is %d", weakPerson.age);
    };
    person.age=18;
    person.block();
}



@end
