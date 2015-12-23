//
//  MFAlertHelper.m
//  AlertViewExamples
//
//  Created by danube83 on 2015. 12. 23..
//  Copyright © 2015년 Mangofever. All rights reserved.
//

#import "MFAlertHelper.h"
#import "UIAlertView+BlockExtension.h"


@implementation MFAlertHelper

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(void (^)(void))cancelBlock confirmButtonTitle:(NSString *)confirmButtonTitle confirmBlock:(void (^)(NSInteger buttonIndex))confirmBlock showingController:(id)showingController
{
    Class alertController = NSClassFromString(@"UIAlertController");
    if (alertController) {
        
        if(![showingController isKindOfClass:[UIViewController class]]) {
            NSLog(@"showingController is not kind of UIViewController class.");
            return;
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        __block id viewController = showingController;
        if (cancelButtonTitle && ![cancelButtonTitle isEqualToString:@""]) {
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                                   style:UIAlertActionStyleDestructive
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     if(cancelBlock) {
                                                                         cancelBlock();
                                                                         [viewController dismissViewControllerAnimated:YES completion:nil];
                                                                     }
                                                                 }];
            [alert addAction:cancelAction];
        }
        
        if (confirmButtonTitle && ![confirmButtonTitle isEqualToString:@""]) {
            
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmButtonTitle
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                      if(confirmBlock) {
                                                                          confirmBlock(0);
                                                                          [viewController dismissViewControllerAnimated:YES completion:nil];
                                                                      }
                                                                  }];
            
            [alert addAction:confirmAction];
            
        }
        
        [showingController presentViewController:alert animated:YES completion:nil];
        

    } else {
        
        UIAlertView *alertView = [UIAlertView alertViewWithTitle:title message:message];
        if (cancelButtonTitle && ![cancelButtonTitle isEqualToString:@""]) {
            [alertView addCancelButtonWithTitle:cancelButtonTitle
                                         action:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                             if(cancelBlock)
                                                 cancelBlock();
                                         }];
        }
        
        if (confirmButtonTitle && ![confirmButtonTitle isEqualToString:@""]) {
            [alertView addButtonWithTitle:confirmButtonTitle
                                   action:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                       if(confirmBlock)
                                           confirmBlock(buttonIndex);
                                   }];
            
        }
        
        [alertView show];

    }
}
@end
