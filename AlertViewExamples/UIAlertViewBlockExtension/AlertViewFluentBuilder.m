//
//  AlertViewFluentBuilder.m
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 5. 2..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import "AlertViewFluentBuilder.h"

@implementation AlertViewFluentBuilder

//- (AlertViewBuilder * (^)(NSString *title, UIAlertActionVoidBlock action))cancelButton
//{
//    return ^AlertViewBuilder *(NSString *title, UIAlertActionVoidBlock action){
//        [self addCancelButtonWithTitle:title action:action];
//        return self;
//    };
//}
//
//- (AlertViewBuilder * (^)(NSString *title, UIAlertActionVoidBlock action))button
//{
//    return ^AlertViewBuilder *(NSString *title, UIAlertActionVoidBlock action){
//        [self addButtonWithTitle:title action:action];
//        return self;
//    };
//}
//
//- (AlertViewFluentBuilder * (^)(NSString *message))message
//{
//    return ^AlertViewFluentBuilder *(NSString *message){
//        self.builder.message = message;
//        
//        AlertViewFluentBuilder *builder = [[AlertViewFluentBuilder alloc] init];
//        builder.builder = self.builder;
//        return builder;
//    };
//}
//
//- (AlertMessageBuilder * (^)(NSString *title))title
//{
//    return ^AlertMessageBuilder *(NSString *title){
//        self.builder.title = title;
//        AlertMessageBuilder *messageBuilder = [[AlertMessageBuilder alloc] init];
//        messageBuilder.builder = self.builder;
//        
//        return messageBuilder;
//    };
//}

@end
