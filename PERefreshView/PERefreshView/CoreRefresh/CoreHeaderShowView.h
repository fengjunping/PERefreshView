//
//  CoreHeaderShowView.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreHeaderShowView : UIView

@property (nonatomic,assign) CGFloat progress;                          //进度

@property (nonatomic,assign,getter=isRefreshing) BOOL refreshing;                            //是否刷新中

@end
