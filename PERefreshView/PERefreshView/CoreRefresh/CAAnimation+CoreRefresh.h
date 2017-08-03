//
//  CAAnimation+CoreRefresh.h
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//  动画生成分类

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (CoreRefresh)



/**
 *  生成一个翻转动画
 */
+(CABasicAnimation *)rotationAnim;



/**
 *  旋转动画
 */
+(CABasicAnimation *)rotaAnim;



/**
 *  抖动
 */
+(CAKeyframeAnimation *)shakeAnim;


@end
