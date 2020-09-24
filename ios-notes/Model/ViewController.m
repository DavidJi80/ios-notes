//
//  ViewController.m
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import "ViewController.h"
#import "MRCViewController.h"
#import "ARCViewController.h"
#import "SingletonViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *mrcBtn;
@property (strong, nonatomic) UIButton *arcBtn;
@property (strong, nonatomic) UIButton *propBtn;
@property (strong, nonatomic) UIButton *singletonBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseUI];
}

#pragma mark - BaseSet
- (void)configBaseUI{
    [self.view addSubview:self.mrcBtn];
    [self.mrcBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.arcBtn];
    [self.arcBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.mrcBtn.right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.propBtn];
    [self.propBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.arcBtn.right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.singletonBtn];
    [self.singletonBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mrcBtn.bottom).offset(10);
        make.left.equalTo(self.mrcBtn);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];


}

#pragma mark - Lazy Init

- (UIButton *)mrcBtn{
    if (!_mrcBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"MRC" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(mrcDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _mrcBtn = button;
    }
    return _mrcBtn;
}

- (UIButton *)arcBtn{
    if (!_arcBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"ARC" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(arcDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _arcBtn = button;
    }
    return _arcBtn;
}

- (UIButton *)propBtn{
    if (!_propBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"property" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(arcDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _propBtn = button;
    }
    return _propBtn;
}

- (UIButton *)singletonBtn{
    if (!_singletonBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"singleton" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(singletonDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _singletonBtn = button;
    }
    return _singletonBtn;
}

#pragma mark - Action

-(void)mrcDemo{
    MRCViewController *vc=[MRCViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)arcDemo{
    ARCViewController *vc=[ARCViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)singletonDemo{
    SingletonViewController *vc=[SingletonViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
