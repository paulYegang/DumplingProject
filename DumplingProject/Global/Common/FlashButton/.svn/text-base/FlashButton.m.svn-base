//
//  FlashButton.m
//  testBtn
//
//  Created by 顾新生 on 15/11/9.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//

#import "FlashButton.h"
@interface FlashButton()

@property(nonatomic,strong)UIControl *controlView;
@property(nonatomic,assign)SEL action;

@end

@implementation FlashButton
-(instancetype)init{
    if (self=[super init]) {
        [self setupcontrolView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setupcontrolView];
    }
    return self;
}
//建立触摸事件响应视图
-(void)setupcontrolView{
    UIControl *controlView=[[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:controlView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [controlView addGestureRecognizer:tap];
    _controlView=controlView;
    self.clipsToBounds=YES;
}
//重载方法
-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [super addTarget:target action:action forControlEvents:controlEvents];
    self.action=action;
}

//按钮点击
-(void)tapClick:(UITapGestureRecognizer *)tap{
    CGFloat height=self.bounds.size.height,width=self.bounds.size.width;
    CGPoint tapLocation=[tap locationInView:self];
    CGFloat radiusH=MAX(tapLocation.x, width-tapLocation.x);
    CGFloat radiusV=MAX(tapLocation.y, height-tapLocation.y);
    CGFloat radius=MAX(radiusH, radiusV);
    CGFloat scale=MAX(height,width)/radius+0.5;
    
    CAShapeLayer *shapeLayer=[CAShapeLayer layer];
    shapeLayer.position=CGPointMake(tapLocation.x, tapLocation.y);
    shapeLayer.bounds=CGRectMake(0, 0, radius*1.25, radius*1.25);
    shapeLayer.path=[UIBezierPath bezierPathWithRoundedRect:shapeLayer.bounds cornerRadius:radius].CGPath;
    shapeLayer.fillColor=_flashColor.CGColor;
    shapeLayer.opacity = 0;
    shapeLayer.lineWidth = 1;
    [self.layer addSublayer:shapeLayer];
    
    
    [self setupAnimationGroupWithLayer:shapeLayer scale:scale];
    
}

//动画效果
-(void)setupAnimationGroupWithLayer:(CAShapeLayer *)shapeLayer scale:(CGFloat)scale{
    CABasicAnimation *scaleAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1)];
    
    CABasicAnimation *alphaAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue=@1;
    alphaAnimation.toValue=@0;
    
    CAAnimationGroup *groupAnimation=[CAAnimationGroup animation];
    groupAnimation.animations=@[scaleAnimation,alphaAnimation];
    groupAnimation.delegate=self;
    groupAnimation.duration=0.5f;
    groupAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [groupAnimation setValue:shapeLayer forKey:@"circleShaperLayer"];
    [shapeLayer addAnimation:groupAnimation forKey:nil];

}

//动画完成后执行按钮点击事件
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CALayer *layer = [anim valueForKey:@"circleShaperLayer"];
    if (layer) {
        [layer removeFromSuperlayer];
        if (self.action) {
            [self sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}

@end
