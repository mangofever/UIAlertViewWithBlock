//
//  ViewController.m
//  AlertViewExamples
//
//  Created by Mango on 2015. 3. 18..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+BlockExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickCancelAndOK:(id)sender {
    UIAlertView *alertView = [UIAlertView alertViewWithTitle:@"title" message:@"message"];
    [alertView addButtonWithTitle:@"OK" action:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clicked button index : %lu", buttonIndex);
        NSLog(@"cancel button index : %lu", alertView.cancelButtonIndex);
    }];
    [alertView addCancelButtonWithTitle:@"Cancel" action:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clicked button index : %lu", buttonIndex);
        NSLog(@"cancel button index : %lu", alertView.cancelButtonIndex);
    }];
    
    [alertView show];
}

- (IBAction)clickNilBlock:(id)sender {
    UIAlertView *alertView = [UIAlertView alertViewWithTitle:@"title" message:@"message"];
    [alertView addButtonWithTitle:@"OK" action:nil];
    [alertView show];
}

- (IBAction)clickConvenient:(id)sender {
    [UIAlertView showAlertWithTitle:@"Convenient!" message:@"Good" cancelButtonTitle:@"OK" action:^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clicked button index : %lu", buttonIndex);
        NSLog(@"cancel button index : %lu", alertView.cancelButtonIndex);
    }];
}

@end
