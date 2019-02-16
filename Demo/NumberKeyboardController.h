//
//  KeyboardController.h
//  Demo
//
//  Created by YLCHUN on 2018/7/10.
//  Copyright © 2018年 ylchun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BlankKeyboard/BlankKeyboard.h>

@interface NumberKeyboardController : BKeyboardController
-(instancetype)initWithCallback:(void(^)(NSString *key))callabck;
@end
