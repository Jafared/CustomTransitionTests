//
//  JARedViewController.m
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JARedViewController.h"
#import "JAAnimatedTransitioning.h"

@interface JARedViewController ()

@property(nonatomic, strong) JAAnimatedTransitioning *animator;

@end

@implementation JARedViewController


#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        self.animator = [JAAnimatedTransitioning new];
    }
    
    return self;
}


#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    self.navigationItem.leftBarButtonItems = @[ closeButton ];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.navigationController.navigationBar.layer removeAllAnimations];
}


#pragma mark - Private methods

- (void) dismiss {

    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Custom transition delegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    self.animator.reverse = false;
    return self.animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    self.animator.reverse = true;
    return self.animator;
}

@end
