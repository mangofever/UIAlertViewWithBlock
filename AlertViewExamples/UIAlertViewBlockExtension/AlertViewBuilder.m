//
//  AlertViewBuilder.m
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 4. 29..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import "AlertViewBuilder.h"

@implementation AlertViewBuilder {
    AlertPresenter * _presenter;
}

- (id)init {
    self = [super init];
    if (self) {
        self.buttons = [NSMutableArray array];
        _presenter = [[AlertPresenter alloc] init];
        _presenter.builder = self;
    }
    
    return self;
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(UIAlertActionVoidBlock)action {
    AlertButton *button = [AlertButton cancelButtonWithTitle:title action:action];
    if (button) {
        [self.buttons addObject:button];
    }
}
- (void)addButtonWithTitle:(NSString *)title action:(UIAlertActionVoidBlock)action {
    AlertButton *button = [AlertButton buttonWithTitle:title action:action];
    if (button) {
        [self.buttons addObject:button];
    }
}

- (AlertPresenter *)presenter
{
    return _presenter;
}

@end

