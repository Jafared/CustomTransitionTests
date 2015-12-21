//
//  JAAnimatedTransitioning.h
//  CustomTransitionTests
//
//  Created by Alexis Bronchart on 29/11/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JAAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL reverse;

@end