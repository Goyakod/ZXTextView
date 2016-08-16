//
//  ZXTextView.h
//  basicApp
//
//  Created by pro on 16/8/16.
//  Copyright © 2016年 goyakod. All rights reserved.
//




#import <UIKit/UIKit.h>

@interface ZXTextView : UITextView

/**
 *  占位文字
 */
@property (copy, nonatomic) NSString *placeholder;

/**
 *  占位文字颜色
 */
@property (strong, nonatomic) UIColor *placeholderColor;

/**
 *  内容颜色（！！外部不要调用textColor直接来改变字体颜色，用此属性来代替！！）
 */
@property (strong, nonatomic) UIColor *contentColor;


@end
