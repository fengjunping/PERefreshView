//
//  UIScrollView+Refresh.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CoreFooterView.h"
#import "CoreHeaderView.h"

@interface UIScrollView (Refresh)

@property (weak, nonatomic) CoreHeaderView *header;

@property (weak, nonatomic) CoreFooterView *footer;


/**
 *  添加一个下拉刷新头部控件
 *
 *  @param target 目标
 *  @param action 回调方法
 */
- (void)addHeaderWithTarget:(id)target action:(SEL)action;


/**
 *  header的状态更新
 */
-(void)setHeaderState:(CoreHeaderViewRefreshState)state;


/**
 *  移除下拉刷新头部控件
 */
- (void)removeHeader;


/**
 *  添加一个上拉刷新尾部控件
 *
 *  @param target 目标
 *  @param action 回调方法
 */
- (void)addFooterWithTarget:(id)target action:(SEL)action;


/**
 *  footer的状态更新
 */
-(void)setFooterState:(CoreFooterViewRefreshState)state;



/**
 *  移除上拉刷新尾部控件
 */
- (void)removeFooter;


@end
