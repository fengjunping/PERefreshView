//
//  CoreHeaderView.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import "CoreRefreshView.h"

typedef enum{
    //普通状态
    CoreHeaderViewRefreshStateNorMal=0,
    //松手立即刷新
    CoreHeaderViewRefreshStateReleaseToRefreshing,
    //刷新中
    CoreHeaderViewRefreshStateRefreshing,
    //刷新成功
    CoreHeaderViewRefreshStateSuccessed,
    //刷新失败
    CoreHeaderViewRefreshStateFailed,
    //刷新成功，无更多数据
    CoreHeaderViewRefreshStateNoMoreData,
    
}CoreHeaderViewRefreshState;

@interface CoreHeaderView : CoreRefreshView

@property (nonatomic,assign) CoreHeaderViewRefreshState state; //状态


+ (instancetype)header;

- (void)removeHeader;

@end
