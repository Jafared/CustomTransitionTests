//
//  JACustomSegue.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 02/12/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JACustomSegue.h"
#import "JATransitioningDelegate.h"

@implementation JACustomSegue

- (void) perform {
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        
        id <UIViewControllerTransitioningDelegate> myDelegate = [JATransitioningDelegate new];
        dst.transitioningDelegate = myDelegate;
        dst.modalPresentationStyle = UIModalPresentationCustom;
    }
    
    [src presentViewController:dst animated:YES completion:nil];
}

@end
