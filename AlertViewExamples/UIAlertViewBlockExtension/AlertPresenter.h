//
//  AlertPresenter.h
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 5. 2..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlertViewBuilder;

@interface AlertPresenter : NSObject

@property (nonatomic, weak) AlertViewBuilder *builder;

- (void)show;

@end
