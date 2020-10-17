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
#import "PropertyViewController.h"
#import "BlockViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *mrcBtn;
@property (strong, nonatomic) UIButton *arcBtn;
@property (strong, nonatomic) UIButton *propBtn;
@property (strong, nonatomic) UIButton *singletonBtn;
@property (strong, nonatomic) UIButton *bridgBtn;
@property (strong, nonatomic) UIButton *blockBtn;

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

    [self.view addSubview:self.bridgBtn];
    [self.bridgBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singletonBtn);
        make.left.equalTo(self.singletonBtn.right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];
    
    [self.view addSubview:self.blockBtn];
    [self.blockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.singletonBtn);
        make.left.equalTo(self.bridgBtn.right).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(40);
    }];


}

#pragma mark - Lazy Init

- (UIButton *)mrcBtn{
    if (!_mrcBtn) {
        UIButton *button = [[UIButton alloc]init];
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
        [button setTitle:@"Property" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(propDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _propBtn = button;
    }
    return _propBtn;
}

- (UIButton *)singletonBtn{
    if (!_singletonBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"Singleton" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(singletonDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _singletonBtn = button;
    }
    return _singletonBtn;
}

- (UIButton *)bridgBtn{
    if (!_bridgBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"Bridging" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(bridgDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _bridgBtn = button;
    }
    return _bridgBtn;
}

- (UIButton *)blockBtn{
    if (!_blockBtn) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"Block" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(blockDemo) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor=UIColor.brownColor;
        _blockBtn = button;
    }
    return _blockBtn;
}

#pragma mark - Action
//MRC
-(void)mrcDemo{
    MRCViewController *vc=[MRCViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

//ARC
-(void)arcDemo{
    ARCViewController *vc=[ARCViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

//属性
-(void)propDemo{
    PropertyViewController *vc=[PropertyViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

//单例
-(void)singletonDemo{
    SingletonViewController *vc=[SingletonViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

//桥 Foundation <=> Core Foundation
-(void)bridgDemo{
    // __bridge  CF -> Foundation
    CFStringRef aCFString = CFStringCreateWithCString(NULL, "bridge CF->F", kCFStringEncodingASCII);
    NSString *aNSString = (__bridge NSString *)aCFString;
    NSLog(@"Foundation对象：%@，地址：%p",aNSString,&aNSString);
    NSLog(@"Core Foundation对象：%@，地址：%p",aCFString,&aCFString);
    CFRelease(aCFString);
    
    // __bridge  Foundation -> CF
    NSString *bNSString = @"bridge F->CF";
    CFStringRef bCFString = (__bridge CFStringRef)(bNSString);
    NSLog(@"Foundation对象：%@，地址：%p",bNSString,&bNSString);
    NSLog(@"Core Foundation对象：%@，地址：%p",bCFString,&bCFString);
    CFRelease(bCFString);
    
    // Foundation -> CF
    NSString *cNSString = @"F->CF";
    CFStringRef c1CFString = (__bridge_retained  CFStringRef)(cNSString);
    CFStringRef c2CFString = (CFStringRef)CFBridgingRetain(cNSString);
    NSLog(@"Foundation对象：%@，地址：%p",cNSString,&cNSString);
    NSLog(@"Core Foundation对象：%@，地址：%p",c1CFString,&c1CFString);
    NSLog(@"Core Foundation对象：%@，地址：%p",c2CFString,&c2CFString);
    CFRelease(c1CFString);
    CFRelease(c2CFString);
    
    // CF -> Foundation
    CFStringRef dCFString = CFStringCreateWithCString(NULL, "CF->F", kCFStringEncodingASCII);
    NSString *d1NSString = (__bridge_transfer NSString *)dCFString;
    NSString *d2NSString = (NSString *)CFBridgingRelease(dCFString);
    NSLog(@"Foundation对象：%@，地址：%p",d1NSString,&d1NSString);
    NSLog(@"Foundation对象：%@，地址：%p",d2NSString,&d2NSString);
    NSLog(@"Core Foundation对象：%@，地址：%p",dCFString,&dCFString);
    
}

-(void)blockDemo{
    BlockViewController *vc=[BlockViewController new];
    printf("Retain Count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(vc)));
    [self.navigationController pushViewController:vc animated:YES];
}


@end
