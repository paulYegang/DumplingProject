//
//  TransitionDelegate.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "TransitionDelegate.h"
#import "PresentationController.h"
@implementation TransitionDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    _isPresent = YES;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _isPresent = NO;
    return self;
}


- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0){

    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (_isPresent) {
        UIView *toview = [transitionContext viewForKey:UITransitionContextToViewKey];
        toview.layer.anchorPoint = CGPointMake(1, 0);
        toview.transform = CGAffineTransformMakeScale(0.0, 0.0);
        [transitionContext.containerView addSubview:toview];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
            toview.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else{
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        fromView.layer.anchorPoint = CGPointMake(1, 0);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
            fromView.transform = CGAffineTransformMakeScale(0.000001, 0.00001);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];

        
    }
}

@end
