//
//  JATransitioningDelegate.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JATransitioningDelegate.h"

@implementation JATransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [JAAnimatedTransitioning new];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    JAAnimatedTransitioning *transitioning = [JAAnimatedTransitioning new];
    transitioning.reverse = YES;
    return transitioning;
}

@end


@implementation JAAnimatedTransitioning

@synthesize reverse;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.reverse) {
        
        toViewController.view.userInteractionEnabled = YES;
        
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
        
    } else {
        
        fromViewController.view.userInteractionEnabled = NO;
        
        toViewController.view.frame = CGRectMake(container.frame.origin.x + 20, container.frame.origin.y + 20, CGRectGetWidth(container.frame) - 40, CGRectGetHeight(container.frame) - 40);
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        [container addSubview:toViewController.view];
    }
//    
//    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
//                                   delay:0
//                                 options:0
//                              animations:^{
//                                  
//                                  if (self.reverse) {
//                                      toViewController.view.layer.opacity = 1;
//                                      toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
//                                      fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
//                                  }
//                                  else {
//                                      fromViewController.view.layer.opacity = 0.5;
//                                      fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
//                                      toViewController.view.transform = CGAffineTransformIdentity;
//                                  }
//                                  
//                              }
//                              completion:^(BOOL finished) {
//                                  
//                                  [transitionContext completeTransition:finished];
//                              }];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1
                        options:0 animations:^{

                            if (self.reverse) {
                                toViewController.view.layer.opacity = 1;
                                toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
                                fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
                            }
                            else {
                                fromViewController.view.layer.opacity = 0.5;
                                fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
                                toViewController.view.transform = CGAffineTransformIdentity;
                            }
                            
                        }
                     completion:^(BOOL finished) {
                            
                         [transitionContext completeTransition:finished];
                     }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

@end