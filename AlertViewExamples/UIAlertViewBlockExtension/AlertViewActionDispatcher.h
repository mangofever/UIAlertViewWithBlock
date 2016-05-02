//
//  AlertViewActionDispatcher.h
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ActionByCancel -1

typedef void (^UIAlertActionBlock) (id alert, NSInteger buttonIndex);

@interface AlertViewActionDispatcher : NSObject

- (void)registerVoidAction:(void (^)())action forButtonIndex:(NSInteger)buttonIndex;

@end

@interface AlertViewActionDispatcher (Deprecated)

- (void)registerAction:(UIAlertActionBlock)action forButtonIndex:(NSInteger)buttonIndex;
- (void)registerCancelAction:(UIAlertActionBlock)action;

@end
