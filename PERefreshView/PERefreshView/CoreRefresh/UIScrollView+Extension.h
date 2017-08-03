//
//  UIScrollView+Extension.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)
@property (assign, nonatomic) CGFloat ex_contentInsetTop;
@property (assign, nonatomic) CGFloat ex_contentInsetBottom;
@property (assign, nonatomic) CGFloat ex_contentInsetLeft;
@property (assign, nonatomic) CGFloat ex_contentInsetRight;

@property (assign, nonatomic) CGFloat ex_contentOffsetX;
@property (assign, nonatomic) CGFloat ex_contentOffsetY;

@property (assign, nonatomic) CGFloat ex_contentSizeWidth;
@property (assign, nonatomic) CGFloat ex_contentSizeHeight;
@end
