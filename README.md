# UIAlertViewBlockExtension
UIAlertView category for block expression

## Installation
### Using cocoapods
<code>
pod 'UIAlertViewBlockExtension'
</code>

## Features
- Block expression can be used for handling UIAlertView's clicks.
- Similar with UIAlertController in iOS 8.0

## Examples
### can add buttons with action of block
```
UIAlertView *alertView = [UIAlertView alertViewWithTitle:@"title" message:@"message"];

[alertView addButtonWithTitle:@"OK" actionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
  // do something for OK
}];
  
[alertView addCancelButtonWithTitle:@"Cancel" actionBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
  // do something for cancel
}];
    
[alertView show];
```

### can be used with convenient method
```
[UIAlertView showAlertWithTitle:@"Convenient!" 
                        message:@"Good" 
              cancelButtonTitle:@"OK" 
                         action:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                  // do something
                         }
];
```

## Requirements
- iOS version 4.0 or later
