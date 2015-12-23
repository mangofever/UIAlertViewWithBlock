//
//  UIAlertViewWithBlock.m
//  AlertViewExamples
//
//  Created by danube83 on 2015. 12. 23..
//  Copyright © 2015년 Mangofever. All rights reserved.
//

#import "UIAlertViewWithBlock.h"
#import "UIAlertView+BlockExtension.h"


@implementation UIAlertViewWithBlock

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(void (^)(void))cancelBlock confirmButtonTitle:(NSString *)confirmButtonTitle confirmBlock:(void (^)(NSInteger buttonIndex))confirmBlock
{
    Class alertController = NSClassFromString(@"UIAlertController");
    if (alertController) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (cancelButtonTitle && ![cancelButtonTitle isEqualToString:@""]) {
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     if(cancelBlock)
                                                                         cancelBlock();
                                                                 }];
            [alert addAction:cancelAction];
        }
        
        if (confirmButtonTitle && ![confirmButtonTitle isEqualToString:@""]) {
            
            UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmButtonTitle
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                      if(confirmBlock)
                                                                          confirmBlock(0);
                                                                  }];
            
            [alert addAction:confirmAction];
            
        }

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

    }
}
@end
