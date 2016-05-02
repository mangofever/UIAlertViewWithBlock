//
//  AlertButton.m
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 4. 29..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import "AlertButton.h"

@implementation AlertButton

+ (id)cancelButtonWithTitle:(NSString *)title action:(void (^)())action
{
    AlertButton *button = [[AlertButton alloc] init];
    button.type = AlertButtonTypeCancel;
    button.title = title;
    button.action = action;
    
    return button;
}

+ (id)buttonWithTitle:(NSString *)title action:(void (^)())action
{
    AlertButton *button = [[AlertButton alloc] init];
    button.type = AlertButtonTypeOthers;
    button.title = title;
    button.action = action;
    
    return button;
}

@end
