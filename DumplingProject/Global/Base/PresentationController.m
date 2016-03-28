//
//  PresentationController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "PresentationController.h"

@implementation PresentationController


-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    return self;
}

-(UIView *)btnview{
    _btnview = [[UIView alloc] initWithFrame:CGRectZero];
//    _btnview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _btnview.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
    [_btnview addGestureRecognizer:tap];
    
    return _btnview;
}
-(void)containerViewWillLayoutSubviews{
    [self.containerView insertSubview:self.btnview atIndex:0];
     _btnview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.presentedView.frame = CGRectMake(SCREEN_WIDTH- 120, 70, 100, 60);
}

-(void) clickAction{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
