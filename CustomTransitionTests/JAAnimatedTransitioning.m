//
//  JAAnimatedTransitioning.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JAAnimatedTransitioning.h"

@implementation JAAnimatedTransitioning

@synthesize reverse;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.reverse) {
        
        toViewController.view.userInteractionEnabled = YES;
        
    } else {
        
        fromViewController.view.userInteractionEnabled = NO;
        
        toViewController.view.frame = CGRectMake(container.frame.origin.x + 30, container.frame.origin.y + 50, CGRectGetWidth(container.frame) - 60, CGRectGetHeight(container.frame) - 100);
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        toViewController.view.layer.opacity = 0;
        
        [container addSubview:toViewController.view];
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1
                        options:0
                     animations:^{

                            if (self.reverse) {
                                
                                toViewController.view.layer.opacity = 1;
                                toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
                                
                                fromViewController.view.layer.opacity = 0;
                                fromViewController.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
                                
                            } else {
                                
                                fromViewController.view.layer.opacity = 0.5;
                                fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
                                
                                toViewController.view.layer.opacity = 1;
                                toViewController.view.transform = CGAffineTransformIdentity;
                            }
                            
                        }
                     completion:^(BOOL finished) {
                         
                         if (self.reverse) {
                             [fromViewController.view removeFromSuperview];
                         }
                         
                         [transitionContext completeTransition:finished];
                     }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.3;
}

@end