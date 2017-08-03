//
//  CoreFooterView.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreRefreshView.h"

typedef enum{
    
    //这就是最普通的状态，并且普通状态是请继续拉动
    CoreFooterViewRefreshStateNormalForContinueDragUp=0,
    //刷新中
    CoreFooterViewRefreshStateRefreshing,
    //刷新成功
    CoreFooterViewRefreshStateSuccess,
    //刷新失败
    CoreFooterViewRefreshStateFailed,
    //刷新成功->无更多数据
    CoreFooterViewRefreshStateNoMoreData,
    
}CoreFooterViewRefreshState;


@interface CoreFooterView : CoreRefreshView


@property (nonatomic,assign) CoreFooterViewRefreshState state;                                              //底部控件的状态

+ (instancetype)footer;

-(void)removeFooter;

@end
