//
//  BaseViewController.m
//  RailPass
//
//  Created by liujukui on 15/6/8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "BaseViewController.h"

//#import "LoginNavigationController.h"
#import "RDVTabBarController.h"
//#import "AppManager.h"
//#import "TicketViewController.h"
//#import "OrderNewDetailViewController.h"

@interface BaseViewController ()<RDVTabBarDelegate>

@property (nonatomic, assign) CGPoint orignalPoint;
@end

@implementation BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIControl * backgroundControl = [[UIControl alloc] initWithFrame:self.view.frame];
    self.view = backgroundControl;
//    [self.view addSubview:backgroundControl];
    @weakify(self);
    [[backgroundControl rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id x) {
        @strongify(self);
        [self.view endEditing:true];

    }];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(leftButtonDidClicked:)];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  -mark -HD 验证是否登陆
- (BOOL)tabBar:(RDVTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index
{
    self.rdv_tabBarController.selectedIndex = index;
    return YES;
}
- (void)tabBar:(RDVTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.rdv_tabBarController.tabBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.orignalPoint = self.view.frame.origin;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShowNotificationHandle:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHideNotificationHandle:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)leftButtonDidClicked:(UIBarButtonItem *)sender
{
    if (self.navigationController.viewControllers[0] == self) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        return;
    }
//    if ([self isKindOfClass:[OrderNewDetailViewController class]]) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        return;
//    }
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)showToast:(NSString *)message
//{
//    CGSize screenSize = [UIScreen mainScreen].bounds.size;
//    CGPoint point = CGPointMake(screenSize.width/2, screenSize.height - 200);
//    id position = [NSValue valueWithCGPoint:point];
//    [self.view makeToast:message duration:1.0 position:position];
//}

- (void)showLoading
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoading
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark notification handle
- (void)keyBoardShowNotificationHandle:(NSNotification *)notification
{
    UIView * firstResponderView = [self findFirstResponderInputViewInContainerView:self.view];
//    NSNotification * rpTextFieldKeyBoardNotification = [[NSNotification alloc] initWithName:RPTextFieldKeyBoardDidShowNotification object:firstResponderView userInfo:notification.userInfo];
    if (firstResponderView) {
        CGRect responderViewFrame = [firstResponderView convertRect:firstResponderView.frame toView:self.view];
        CGRect keyboardEndFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        float distance = (responderViewFrame.origin.y+responderViewFrame.size.height+self.orignalPoint.y) - keyboardEndFrame.origin.y;
        if (distance>0) {
            [UIView animateWithDuration:0.2 animations:^{
                CGRect orignalFrame = self.view.frame;
                orignalFrame.origin.y -=distance;
                self.view.frame = orignalFrame;
            }];
        }
    }
}

- (void)keyBoardHideNotificationHandle:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
        CGRect orignalFrame = self.view.frame;
        orignalFrame.origin = self.orignalPoint;
        self.view.frame = orignalFrame;
    }];
}

#pragma mark business handle

- (UIView *)findFirstResponderInputViewInContainerView:(UIView *)containerView
{
    for (UIView * subView in containerView.subviews ) {
        if ([subView respondsToSelector:@selector(isFirstResponder)]&&[subView isFirstResponder]) {
            return subView;
        }
        UIView * findView = [self findFirstResponderInputViewInContainerView:subView];
        if (findView) {
            return findView;
        }
    }
    return nil;
}
@end
