# BlankKeyboard
UITextView、UITextField 自定义键盘，任意控件唤醒键盘，快速实现自定义原生键盘

### UITextView、UITextField 自定义键盘
查看 BKeyboardController.h 中的 BKeyboardControllerInput 协议
自定义键盘派生于BKeyboardController
```
@interface NumberKeyboardController : BKeyboardController
@end
@implementation NumberKeyboardController

- (IBAction)keyAction:(KeyButton *)sender {
    NSString *key = sender.key;
    if (key.length > 0) {
        [self insertText:key];
    }else {
        [self deleteBackward];
    }
}

- (IBAction)replaceKeyAction:(KeyButton *)sender {
    if ([self hasText]) {
        [self cleanText];
    }
    [self insertText:sender.key];
}

@end
```
自定义键盘使用
```
UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
textView.bKeyboardController = [NumberKeyboardController new];
[textView useBKeyboard];
//[textView useDefKeyboard];
```

### 任意控件唤醒键盘

```
BKeyboard *_keyboard;
...

_keyboard = [BKeyboard new];
_keyboard.rootViewController = [[KeyboardController alloc] initWithInputView:[UIView new]];

[_keyboard show];
//[_keyboard hide];
```

