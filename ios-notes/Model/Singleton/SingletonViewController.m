//
//  SingletonViewController.m
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import "SingletonViewController.h"
#import "SingletonARC.h"
#import "SingletonAll.h"

@interface SingletonViewController ()

@property (strong, nonatomic) UIButton *singlArcBtn;
@property (strong, nonatomic) UIButton *singlAllBtn;

@end

@implementation SingletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseUI];
}

#pragma mark - BaseSet
- (void)configBaseUI{
    [self.view addSubview:self.singlArcBtn];
    [self.singlArcBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];

    [self.view addSubview:self.singlAllBtn];
    [self.singlAllBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singlArcBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
}

#pragma mark - Lazy Init

- (UIButton *)singlArcBtn{
    if (!_singlArcBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"Singleton ARC" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(singlArcDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _singlArcBtn = button;
    }
    return _singlArcBtn;
}

- (UIButton *)singlAllBtn{
    if (!_singlAllBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"Singleton ARC MRC By PCH" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(singlAllDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _singlAllBtn = button;
    }
    return _singlAllBtn;
}

-(void)singlArcDemo{
    SingletonARC *single1 = [SingletonARC shareInstance];
    SingletonARC *single2 = [SingletonARC shareInstance];
    SingletonARC *single3 = [[SingletonARC alloc]init];
    SingletonARC *single4 = [SingletonARC new];
        
    NSLog(@"第一个对象的地址%p",single1);
    NSLog(@"第二个对象的地址%p",single2);
    NSLog(@"第三个对象的地址%p",single3);
    NSLog(@"第四个对象的地址%p",single4);
}

-(void)singlAllDemo{
    SingletonAll *single1 = [SingletonAll shareSingletonAll];
    SingletonAll *single2 = [SingletonAll shareSingletonAll];
    SingletonAll *single3 = [[SingletonAll alloc]init];
    SingletonAll *single4 = [SingletonAll new];
        
    NSLog(@"第一个对象的地址%p",single1);
    NSLog(@"第二个对象的地址%p",single2);
    NSLog(@"第三个对象的地址%p",single3);
    NSLog(@"第四个对象的地址%p",single4);
}



@end
