//
//  CAAnimation+CoreRefresh.m
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import "CAAnimation+CoreRefresh.h"

@implementation CAAnimation (CoreRefresh)

#define kDegreeToRadian(x) (M_PI/180.0 * (x))

/**
 *  生成一个翻转动画
 */
+(CABasicAnimation *)rotationAnim
{
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //起点
    anim.fromValue = @(0);
    //终点
    anim.toValue=@(kDegreeToRadian(-360));
    //动画时长
    anim.duration=.5f;
    //是否反转
    anim.autoreverses=NO;
    //是否重复
    anim.repeatCount=.0f;
    //动画完成移除
    anim.removedOnCompletion=YES;
    
    return anim;
}

/**
 *  旋转动画
 */
+(CABasicAnimation *)rotaAnim
{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 0.8f;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

/**
 *  抖动
 */
+(CAKeyframeAnimation *)shakeAnim
{
    CAKeyframeAnimation *kfa=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    //值
    kfa.values=@[@0.1f,@(0),@(-0.1f),@(0),@0.1f,@(0),@(-0.1f)];
    //设置时间
    kfa.duration=0.15f;
    //是否重复
    kfa.repeatCount=6.0f;
    //是否反转
    kfa.autoreverses=YES;
    //完成移除
    kfa.removedOnCompletion=YES;
    return kfa;
}

@end
