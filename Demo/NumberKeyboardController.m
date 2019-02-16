//
//  KeyboardController.m
//  Demo
//
//  Created by YLCHUN on 2018/7/10.
//  Copyright © 2018年 ylchun. All rights reserved.
//

#import "NumberKeyboardController.h"

@interface KeyButton : UIButton
@property (nonatomic, copy) NSString *key;
@end

@implementation KeyButton
@end


@implementation NumberKeyboardController
{
    void(^_callabck)(NSString *key);
}

-(instancetype)initWithCallback:(void(^)(NSString *key))callabck {
    if (self = [super init]) {
        _callabck = callabck;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keyAction:(KeyButton *)sender {
    NSString *key = sender.key;
    
    if (key.length > 0) {
        [self insertText:key];
    }else {
        [self deleteBackward];
    }
    
    !_callabck?:_callabck(key);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
