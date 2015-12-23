//
//  MFAlertHelper.h
//  AlertViewExamples
//
//  Created by danube83 on 2015. 12. 23..
//  Copyright © 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFAlertHelper : NSObject
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(void (^)(void))cancelBlock confirmButtonTitle:(NSString *)confirmButtonTitle confirmBlock:(void (^)(NSInteger buttonIndex))confirmBlock showingController:(id)showingController;

@end
