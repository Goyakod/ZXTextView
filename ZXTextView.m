//
//  ZXTextView.m
//  basicApp
//
//  Created by pro on 16/8/16.
//  Copyright © 2016年 goyakod. All rights reserved.
//

#import "ZXTextView.h"

@implementation ZXTextView

/**
 *  代码创建
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化
        [self initialization];
    }
    return self;
}

/**
 *  XIB 创建
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //初始化
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    /**
     *  设置默认占位字体和颜色
     */
    self.font = [UIFont systemFontOfSize:16];
    
    /**
     *  监听编辑状态
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing) name:UITextViewTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing) name:UITextViewTextDidEndEditingNotification object:nil];
}

#pragma mark - Setter method

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    self.text = _placeholder;
    self.textColor = _placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.text = _placeholder;
    self.textColor = _placeholderColor;
}

- (void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
}

#pragma mark - editing Status

- (void)didBeginEditing
{
    /**
     *  准备输入内容把占位去掉并改字体颜色
     */
    if ([self.text isEqualToString:_placeholder]) {
        self.text = @"";
        self.textColor = _contentColor;
    }
}

- (void)didEndEditing
{
    /**
     *  如果编辑介绍并没有输入有效内容则改回占位状态
     */
    if ([self.text isEqualToString:@""]) {
        self.text = _placeholder;
        self.textColor = _placeholderColor;
    }
}

@end
