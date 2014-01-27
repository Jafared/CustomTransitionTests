//
//  JAViewController.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JAViewController.h"
#import "JATransitioningDelegate.h"

@implementation JAViewController

- (IBAction)showRedView:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *dst = [storyboard instantiateViewControllerWithIdentifier:@"RedNavigationController"];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        
        id <UIViewControllerTransitioningDelegate> myDelegate = [JATransitioningDelegate new];
        dst.transitioningDelegate = myDelegate;
        dst.modalPresentationStyle = UIModalPresentationCustom;
    }
    
    [self presentViewController:dst animated:YES completion:nil];
}

@end
