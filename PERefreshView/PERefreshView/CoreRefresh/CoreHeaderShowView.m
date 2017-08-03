//
//  CoreHeaderShowView.m
//  mworkingHaier
//
//  Created by bydFeng on 2017/7/25.
//  Copyright © 2017年 CaiGaoBaDou. All rights reserved.
//

#import "CoreHeaderShowView.h"
#import "UIView+Extension.h"
#import "CAAnimation+CoreRefresh.h"

#define kDegreeToRadian(x) (M_PI/180.0 * (x))
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]




@interface CoreHeaderShowView ()

@property (nonatomic,strong) CABasicAnimation *rotaAnim;

@property (nonatomic,assign) CGFloat centerX,centerY,radius,startAngle;

@end

@implementation CoreHeaderShowView
{
    CGPoint _circleCenter;
    CGFloat _lineLength;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}


/**
 *  添加边框
 */
-(void)setup {
    _radius = 8;
    _lineLength = M_PI * _radius * 0.5 + 8;
    _circleCenter = CGPointMake(self.frame.size.width/2 , self.frame.size.height/2);
}

-(void)drawRect:(CGRect)rect
{
    [UIView animateWithDuration:0.5 animations:^{
        //获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGContextSetShouldSubpixelQuantizeFonts(ctx, YES);
        CGContextSetAllowsAntialiasing(ctx, YES);
        
        CGContextBeginPath(ctx);
        CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
        //画笔宽度
        CGContextSetLineWidth(ctx, 2);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        
        CGFloat offset = 50;
        CGFloat arrowWidth = 1.5;
        CGFloat arrowLength = 3;
        
        CGFloat startL_x = _circleCenter.x - _radius;
        CGFloat startL_y = _circleCenter.y + (offset + _lineLength) * (1-_progress);
        CGFloat endL_y   = startL_y - _lineLength;
        // 半圆路径百分比
        CGFloat pro = (_circleCenter.y - endL_y)/_radius;
        pro = MAX(0.0, pro);
        CGFloat circlePro = MIN(0.8, pro*0.3);// 圆弧的百分比进度, *0.5降低增加速度 限制最大0.8,防止追尾
        pro = MIN(1.0, pro);
        
        CGContextMoveToPoint(ctx, startL_x, startL_y);
        if (endL_y > _circleCenter.y) {
            CGContextAddLineToPoint(ctx, startL_x  , endL_y);
            CGContextAddLineToPoint(ctx, startL_x - arrowWidth, endL_y + arrowLength);// 画箭头
        }else {
            // 缩短直线 开始画圆
            CGContextAddLineToPoint(ctx, startL_x  , (startL_y - _lineLength*(1-pro)));
            CGContextAddArc(ctx, _circleCenter.x, _circleCenter.y, _radius, -M_PI, -M_PI*(1-circlePro), 0);
            [self drawCircleArrowContext:ctx Process:circlePro isLeft:YES];
        }
        
        
        CGFloat startR_x = _circleCenter.x + _radius;
        CGFloat startR_y = _circleCenter.y - (offset + _lineLength) * (1-_progress);
        CGFloat endR_y   = startR_y + _lineLength;
        CGContextMoveToPoint(ctx, startR_x, startR_y);
        if (endR_y < _circleCenter.y) {
            CGContextAddLineToPoint(ctx, startR_x  , endR_y);
            CGContextAddLineToPoint(ctx, startR_x + arrowWidth, endR_y - arrowLength);
        }else {
            CGContextAddLineToPoint(ctx, startR_x  , startR_y + _lineLength*(1-pro));
            CGContextAddArc(ctx, _circleCenter.x, _circleCenter.y, _radius, 0, M_PI*circlePro, 0);
            [self drawCircleArrowContext:ctx Process:circlePro isLeft:NO];
        }
        
        CGContextDrawPath(ctx, kCGPathStroke);
    }];
}

// 画半圆上的小箭头
- (void)drawCircleArrowContext:(CGContextRef)ctx Process:(float)pro isLeft:(BOOL)left
{
    CGFloat p = left ? M_PI*(1-pro) : M_PI*pro;
    CGFloat cx = _circleCenter.x + cosf(p)*(_radius);
    CGFloat cy = left ? (_circleCenter.y - sinf(p)*(_radius)) : _circleCenter.y + sinf(p)*(_radius);
    float angle = left ? (-p - (float)(0.36*M_PI)) : p - (float)(0.36*M_PI);
    float dx = cosf(angle) * 3.5;
    float dy = sinf(angle) * 3.5;
    CGContextAddLineToPoint(ctx, cx + dx, cy + dy);
}

-(void)setProgress:(CGFloat)progress
{
//    progress*=0.6;
    if(_progress==progress) return;
    
    progress = MAX(0.0, progress);
    
    self.layer.affineTransform = CGAffineTransformMakeRotation(0);
    if (progress > 1.0f) {
        self.layer.affineTransform = CGAffineTransformMakeRotation(M_PI*progress);
    }
    
    progress = MIN(1.0, progress);
    _progress=progress;
    NSLog(@"ff %f",_progress);
    [self setNeedsDisplay];
}


-(void)setRefreshing:(BOOL)refreshing
{
    //记录
    _refreshing=refreshing;
    
    //响应是否刷新中这个状态
    if(refreshing){
        [self refreshWithYes];
    }else{
        [self refreshWithNO];
    }
    
    //重绘
    [self setNeedsDisplay];
}

#pragma mark  正在刷新中
-(void)refreshWithYes
{
    //强制进度
    self.progress=1.0f;
    
    //在iconImageV添加动画
    [self.layer addAnimation:[CAAnimation rotaAnim] forKey:@"rotaAnim"];
}

#pragma mark  没有在刷新
-(void)refreshWithNO{
    
    //强制进度
    self.progress=.001f;
    
    [self.layer removeAllAnimations];
}

#pragma mark  get方法区
-(CGFloat)centerX{
    
    if(!_centerX){
        _centerX=self.ex_width *.5f;
    }
    
    return _centerX;
}

-(CGFloat)centerY{
    
    if(!_centerY){
        _centerY=self.ex_height *.5f;
    }
    
    return _centerY;
}

-(CGFloat)radius{
    
    if(!_radius){
        _radius=MIN(self.centerX, self.centerY);
    }
    
    return _radius;
}

-(CGFloat)startAngle{
    
    if(!_startAngle){
        _startAngle=kDegreeToRadian(270.0f);
    }
    
    return _startAngle;
}


@end
