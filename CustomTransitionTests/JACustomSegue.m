//
//  JACustomSegue.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 02/12/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JACustomSegue.h"

@implementation JACustomSegue

- (void) perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    UINavigationController *nvc;
    
    if ([dst isKindOfClass:[UINavigationController class]]) {
        
        nvc = (UINavigationController *)dst;
        
        dst = ((UINavigationController *)dst).topViewController;
        
        if ([dst conformsToProtocol:@protocol(UIViewControllerTransitioningDelegate)]) {
            
            src.transitioningDelegate = (id<UIViewControllerTransitioningDelegate>) dst;
            nvc.transitioningDelegate = src.transitioningDelegate;
            nvc.modalPresentationStyle = UIModalPresentationCustom;
        }
        
        [src presentViewController:nvc animated:YES completion:nil];
        
    } else {
        
        if ([dst conformsToProtocol:@protocol(UIViewControllerTransitioningDelegate)]) {
            
            src.transitioningDelegate = (id<UIViewControllerTransitioningDelegate>) dst;
            dst.transitioningDelegate = src.transitioningDelegate;
            dst.modalPresentationStyle = UIModalPresentationCustom;
        }
        
        [src presentViewController:dst animated:YES completion:nil];
    }
}

@end
