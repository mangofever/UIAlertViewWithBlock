//
//  AlertPresenter.m
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 5. 2..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertPresenter.h"
#import "AlertButton.h"
#import "UIAlertView+BlockExtension.h"
#import "AlertViewBuilder.h"

@implementation AlertPresenter

- (void)show
{
    if ([UIAlertController class]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.builder.title message:self.builder.message preferredStyle:UIAlertControllerStyleAlert];
        
        for (AlertButton *button in self.builder.buttons) {
            UIAlertActionStyle style = UIAlertActionStyleDefault;
            if (button.type == AlertButtonTypeCancel) {
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
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.builder.title message:self.builder.message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        alertView.actionDispatcher = [[AlertViewActionDispatcher alloc] init];
        
        for (AlertButton *button in self.builder.buttons) {
            if (button.type == AlertButtonTypeCancel) {
                [alertView addCancelButtonWithTitle:button.title action:button.action];
            } else {
                [alertView addButtonWithTitle:button.title action:button.action];
            }
        }
        [alertView show];
    }
}

@end
