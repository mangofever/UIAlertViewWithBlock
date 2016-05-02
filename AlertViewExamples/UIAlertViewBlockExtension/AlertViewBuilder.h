//
//  AlertViewBuilder.h
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 4. 29..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlertPresenter.h"
#import "AlertButton.h"

typedef void (^UIAlertActionVoidBlock) (void);

@interface AlertViewBuilder : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, readonly) AlertPresenter *presenter;

- (void)addCancelButtonWithTitle:(NSString *)title action:(UIAlertActionVoidBlock)action;
- (void)addButtonWithTitle:(NSString *)title action:(UIAlertActionVoidBlock)action;

@end

