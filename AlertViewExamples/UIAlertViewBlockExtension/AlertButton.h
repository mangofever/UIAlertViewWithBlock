//
//  AlertButton.h
//  AlertViewExamples
//
//  Created by chanhyuk on 2016. 4. 29..
//  Copyright © 2016년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AlertButtonType){
    AlertButtonTypeCancel,
    AlertButtonTypeOthers
};

@interface AlertButton : NSObject

@property (nonatomic) AlertButtonType type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) void (^action) (void);

+ (id)cancelButtonWithTitle:(NSString *)title action:(void (^)())action;
+ (id)buttonWithTitle:(NSString *)title action:(void (^)())action;

@end
