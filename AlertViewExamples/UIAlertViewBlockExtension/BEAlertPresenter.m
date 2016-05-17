//
//  BEAlertPresenter.m
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 5. 2..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEAlertPresenter.h"
#import "BEAlertButton.h"
#import "UIAlertView+BlockExtension.h"
#import "BEAlertViewBuilder.h"

@implementation BEAlertPresenter

- (void)show
{
    if ([UIAlertController class]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.builder.title message:self.builder.message preferredStyle:UIAlertControllerStyleAlert];
        
        for (BEAlertButton *button in self.builder.buttons) {
            UIAlertActionStyle style = UIAlertActionStyleDefault;
            if (button.type == BEAlertButtonTypeCancel) {
                style = UIAlertActionStyleCancel;
            }
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:button.title style:style
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     if(button.action) {
                                                                         button.action();
                                                                     }
                                                                 }];
            [alertController addAction:cancelAction];
        }
        
        
        UIViewController *viewController = [self visibleViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
        [viewController presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.builder.title message:self.builder.message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        alertView.actionDispatcher = [[BEAlertViewActionDispatcher alloc] init];
        
        for (BEAlertButton *button in self.builder.buttons) {
            if (button.type == BEAlertButtonTypeCancel) {
                [alertView addCancelButtonWithTitle:button.title action:button.action];
            } else {
                [alertView addButtonWithTitle:button.title action:button.action];
            }
        }
        [alertView show];
    }
}

- (UIViewController *)visibleViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil)
    {
        return rootViewController;
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        
        return [self visibleViewController:lastViewController];
    }
    if ([rootViewController.presentedViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController.presentedViewController;
        UIViewController *selectedViewController = tabBarController.selectedViewController;
        
        return [self visibleViewController:selectedViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    
    return [self visibleViewController:presentedViewController];
}

@end
