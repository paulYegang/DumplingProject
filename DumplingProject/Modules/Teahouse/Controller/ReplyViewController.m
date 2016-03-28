//
//  ReplyViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ReplyViewController.h"
#import "ReplyView.h"
#import "AlertView.h"
@interface ReplyViewController () <UITextViewDelegate>

@property (nonatomic, strong) ReplyView*replyView;
@property (nonatomic, strong) AlertView *alert;
@end

@implementation ReplyViewController

static id _instance;
+(instancetype) shareInstanceType{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return  _instance;
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_replyView.answerTextView resignFirstResponder];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.iconImage.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"回答";
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];

    _replyView = [[ReplyView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [self.view addSubview:_replyView];
    
    @weakify(self)
    [[_replyView.regitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self)
            [self rigitBtnAction];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//提交成功提示
-(void) rigitBtnAction{
    _alert = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    _alert.title.text = @"答案提交成功";
    [self.view addSubview: _alert];
    [[_alert.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self dismissContactView];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];

}

-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alert.alpha = 0;
        
    } completion:^(BOOL finished) {
        [weakSelf.alert removeFromSuperview];
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
