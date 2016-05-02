//
//  UIAlertView+BlockExtension.m
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "UIAlertView+BlockExtension.h"
#import <objc/runtime.h>
#import "AlertViewBuilder.h"

@implementation UIAlertView (BlockExtension)

@dynamic actionDispatcher;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    alertView.actionDispatcher = [[AlertViewActionDispatcher alloc] init];
    
    return alertView;
}

- (void)addButtonWithTitle:(NSString *)title action:(void (^)())action {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    [self.actionDispatcher registerVoidAction:action forButtonIndex:buttonIndex];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(void (^)())action {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    self.cancelButtonIndex = buttonIndex;
    [self.actionDispatcher registerVoidAction:action forButtonIndex:buttonIndex];
}

#pragma mark - getter/setter for actionDispatcher with associated object

- (void)setActionDispatcher:(AlertViewActionDispatcher *)actionDispatcher {
    self.delegate = actionDispatcher;
    objc_setAssociatedObject(self, @selector(actionDispatcher), actionDispatcher, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AlertViewActionDispatcher *)actionDispatcher {
    return objc_getAssociatedObject(self, @selector(actionDispatcher));
}


@end

@implementation UIAlertView (FluentMethods)

+ (AlertViewFluentBuilder *)with {
    return nil;
}

+ (void)showWithTitle:(NSString *)title messsage:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle action:(void (^)())action {
    AlertViewBuilder *builder = [[AlertViewBuilder alloc] init];
    builder.title = title;
    builder.message = message;
    
    [builder addCancelButtonWithTitle:cancelButtonTitle action:action];

    [builder.presenter show];
}

+ (void)showWithTitle:(NSString *)title messsage:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelAction:(void (^)())cancelAction otherButtonTitle:(NSString *)otherButtonTitle otherButtonAction:(void (^)())otherAction {
    AlertViewBuilder *builder = [[AlertViewBuilder alloc] init];
    builder.title = title;
    builder.message = message;
    
    [builder addCancelButtonWithTitle:cancelButtonTitle action:cancelAction];
    [builder addButtonWithTitle:otherButtonTitle action:otherAction];
    
    [builder.presenter show];
}

@end

@implementation UIAlertView (Deprecated)

- (void)addButtonWithTitle:(NSString *)title actionBlock:(UIAlertActionBlock)actionBlock {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    [self.actionDispatcher registerAction:actionBlock forButtonIndex:buttonIndex];
}

- (void)addCancelButtonWithTitle:(NSString *)title actionBlock:(UIAlertActionBlock)actionBlock {
    NSInteger buttonIndex = [self addButtonWithTitle:title];
    self.cancelButtonIndex = buttonIndex;
    [self.actionDispatcher registerAction:actionBlock forButtonIndex:buttonIndex];;
}

- (void)addCancelActionBlock:(UIAlertActionBlock)actionBlock {
    [self.actionDispatcher registerCancelAction:actionBlock];
}

@end
