//
//  UpLoadViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/21.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UpLoadViewController.h"
#import "UpLoadView.h"
#import "AlertView.h"
@interface UpLoadViewController ()
@property (nonatomic, strong) UpLoadView *uploadview;
@property (nonatomic, strong) AlertView *alertview;
@end

@implementation UpLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"上传";
    [self setUPUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}
-(void) setUPUI{
    
    _uploadview = [[UpLoadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    __weak typeof(self) weakself = self;
    _uploadview.uploadBlock = ^(upbtnType upbtntype){
    
        switch (upbtntype) {
            case upbtnTypeUp:
                [weakself uploadFileAction];
                break;
             case upbtnTypeRegit:
                [weakself regitAction];
                break;
            default:
                break;
        }
    };
    
    [self.view addSubview:_uploadview];
    
}

//上传文件action
-(void) uploadFileAction{
    _alertview = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //    _alertview.delegate = self;
    _alertview.title.text = @"上传成功";
    [self.view addSubview: _alertview];
    [[_alertview.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self dismissContactView];
    }];

}

//提交action
-(void) regitAction{
    _alertview = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //    _alertview.delegate = self;
    _alertview.title.text = @"提交成功";
    [self.view addSubview: _alertview];
    [[_alertview.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self dismissContactView];
    }];

}


-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alertview.alpha = 0;
        
    } completion:^(BOOL finished) {
        [weakSelf.alertview removeFromSuperview];
        
    }];
    
}
@end
