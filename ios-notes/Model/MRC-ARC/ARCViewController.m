//
//  ARCViewController.m
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import "ARCViewController.h"

@interface ARCViewController ()

@property (strong, nonatomic) UIButton *arpBtn;
@property (strong, nonatomic) UIButton *noArpBtn;

@end

@implementation ARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBaseUI];
}

#pragma mark - BaseSet
- (void)configBaseUI{
    [self.view addSubview:self.arpBtn];
    [self.arpBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];

    [self.view addSubview:self.noArpBtn];
    [self.noArpBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arpBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(40);
    }];
}


#pragma mark - Lazy Init

- (UIButton *)arpBtn{
    if (!_arpBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"autoreleasepool" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(arpDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _arpBtn = button;
    }
    return _arpBtn;
}

- (UIButton *)noArpBtn{
    if (!_noArpBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [button setTitle:@"no autoreleasepool" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(noArpDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _noArpBtn = button;
    }
    return _noArpBtn;
}


#pragma mark - Action

-(void)arpDemo{
    for (int i = 0; i < 10000000; i++){
        @autoreleasepool{
            NSMutableArray *array = [NSMutableArray new];
            NSMutableDictionary *dic = [NSMutableDictionary new];
            NSMutableArray *array1 = [NSMutableArray new];
            NSMutableDictionary *dic1 = [NSMutableDictionary new];
            NSMutableArray *array2 = [NSMutableArray new];
            NSMutableDictionary *dic2 = [NSMutableDictionary new];
            NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"testimage"], 1);
            NSError *error;
            NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
            NSString *fileContents = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        }
    }
}

-(void)noArpDemo{
    for (int i = 0; i < 10000000; i++){
        NSMutableArray *array = [NSMutableArray new];
        NSMutableDictionary *dic = [NSMutableDictionary new];
        NSMutableArray *array1 = [NSMutableArray new];
        NSMutableDictionary *dic1 = [NSMutableDictionary new];
        NSMutableArray *array2 = [NSMutableArray new];
        NSMutableDictionary *dic2 = [NSMutableDictionary new];
        NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"testimage"], 1);
        NSError *error;
        NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
        NSString *fileContents = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    }
}


@end
