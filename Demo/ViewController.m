//
//  ViewController.m
//  Demo
//
//  Created by YLCHUN on 2018/7/4.
//  Copyright © 2018年 ylchun. All rights reserved.
//

#import "ViewController.h"
#import <BlankKeyboard/BlankKeyboard.h>
#import "NumberKeyboardController.h"

@implementation ViewController
{
    __weak IBOutlet UITextView *_textView;
    __weak IBOutlet UITextField *_textField;
    BKeyboard *_keyboard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotificationObserver];
    _textView.bKeyboardController = [NumberKeyboardController new];
    _keyboard = [self bKeyboardWith:_textField];
}


- (IBAction)change2BKeyboard:(id)sender {
    [_textView useBKeyboard];
}
- (IBAction)change2DefKeyboard:(id)sender {
    [_textView useDefKeyboard];
}

-(BKeyboard *)bKeyboardWith:(__weak UITextField *)inputView {
    BKeyboard *keyboard = [BKeyboard new];
    keyboard.rootViewController = [[NumberKeyboardController alloc] initWithCallback:^(NSString *key) {
        if (key.length > 0) {
            inputView.text = [NSString stringWithFormat:@"%@%@", inputView.text, key];
        }else {
            NSInteger toIdx = MAX(inputView.text.length - 1, 0);
            inputView.text = [inputView.text substringToIndex:toIdx];
        }
    }];
    return keyboard;
}


- (IBAction)bKeyboardShow:(id)sender {
    [_keyboard show];
}
- (IBAction)bKeyboardHide:(id)sender {
    [_keyboard hide];
}

- (void)addNotificationObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSLog(@"%s", __func__);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSLog(@"%s", __func__);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [BKeyboard endEditing:NO];
}

@end
