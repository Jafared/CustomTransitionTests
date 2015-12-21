//
//  JAViewController.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JAViewController.h"

@implementation JAViewController

- (IBAction)showRedView:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UINavigationController *nvc = [storyboard instantiateViewControllerWithIdentifier:@"RedNavigationController"];
    
    UIViewController *dst = ((UINavigationController *)nvc).topViewController;
    
    if ( [dst conformsToProtocol:@protocol(UIViewControllerTransitioningDelegate)] ) {
        
        self.transitioningDelegate = (id<UIViewControllerTransitioningDelegate>) dst;
        nvc.transitioningDelegate = self.transitioningDelegate;
        nvc.modalPresentationStyle = UIModalPresentationCustom;
    }
    
    [self presentViewController:nvc animated:YES completion:nil];
}

@end
