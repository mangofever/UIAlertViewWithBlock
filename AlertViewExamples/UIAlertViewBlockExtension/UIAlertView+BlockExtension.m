//
//  UIAlertView+BlockExtension.m
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "UIAlertView+BlockExtension.h"
#import <objc/runtime.h>

@implementation UIAlertView (BlockExtension)

@dynamic actionDispatcher;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    alertView.actionDispatcher = [[AlertViewActionDispatcher alloc] init];
    
    return alertView;
}

- (void)addButtonWithTitle:(NSString *)title action:(UIAlertActionBlock)action {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    [self.actionDispatcher registerAction:action forButtonIndex:buttonIndex];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(UIAlertActionBlock)action {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    self.cancelButtonIndex = buttonIndex;
    [self.actionDispatcher registerAction:action forButtonIndex:buttonIndex];
}

- (void)addCancelAction:(UIAlertActionBlock)action {
    [self.actionDispatcher registerCancelAction:action];
}


- (void)setActionDispatcher:(AlertViewActionDispatcher *)actionDispatcher {
    self.delegate = actionDispatcher;
    objc_setAssociatedObject(self, @selector(actionDispatcher), actionDispatcher, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AlertViewActionDispatcher *)actionDispatcher {
    return objc_getAssociatedObject(self, @selector(actionDispatcher));
}


@end


@implementation UIAlertView (ConvenientMethods)

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle action:(UIAlertActionBlock)action {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    alertView.actionDispatcher = [[AlertViewActionDispatcher alloc] init];
    [alertView addCancelButtonWithTitle:cancelButtonTitle action:action];
    
    [alertView show];
}

@end