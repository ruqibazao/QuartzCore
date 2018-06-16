//
//  ViewController.m
//  CAAnimation
//
//  Created by mac on 16-3-22.
//  Copyright (c) 2016年 zhiyou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layer = [CALayer layer];
    _layer.frame = CGRectMake(100, 200, 100, 100);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    //_layer.contents = (id)[UIImage imageNamed:@"layer.jpg"].CGImage;
    [self.view.layer addSublayer:_layer];
    NSArray *array = @[@"事务",@"基本",@"帧动画",@"组",@"转场"];
    float colSpace = (self.view.frame.size.width-60*5)/6;
    for (int i = 0; i < 5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor cyanColor];
        float y = i>2?100:50;
        button.frame = CGRectMake(colSpace+(colSpace+60)*(i%3), y, 60, 40);
        button.layer.borderColor = [UIColor grayColor].CGColor;
        button.layer.borderWidth = 0.5;
        button.tag = i+100;
        
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)sender {
    /*核心动画  //keyPath : 想要执行什么动画;
     CAAnimation 动画 (3个子类)
     {
        CAPropertyAnimation (不会执行动画)生成这两种动画(基本动画 CABasicAnimation 帧动画 CAKeyframeAnimation) CATransition(转场) CAAnimationGroup
     }
     */
    switch (sender.tag) {
        case 100:
            [self transaction];
            break;
        case 101://基本动画
            [self basicAnimation];
            break;
        case 102: //(帧动画)
            [self keyframeAnimation];
            break;
        case 103://组可以执行多个动画 //模拟震动
            [self animationGroup];
            break;
        case 104://转场动画
            [self transition];
            break;
            
        default:
            break;
    }
}

- (void)transition {
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    //`fromLeft' `fromRight' `fromTop' and `fromBottom' {cube 方块  suckEffect三角}等
    animation.type = @"cube";
    [_layer addAnimation:animation forKey:nil];
}

- (void)animationGroup {
    CAKeyframeAnimation *key = [CAKeyframeAnimation animation];
    key.duration = 0.1;
    key.keyPath = @"position";
    key.values = @[
                   [NSValue valueWithCGPoint:CGPointMake(160, 250)],
                   [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                   [NSValue valueWithCGPoint:CGPointMake(160, 250)],
                   [NSValue valueWithCGPoint:CGPointMake(150, 250)]
                   ];
    key.autoreverses = YES;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //这里可以添加多个动画
    group.animations = @[key];
    //max时间
    group.duration = 1;
    [_layer addAnimation:group forKey:nil];
}


- (void)keyframeAnimation {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";//CAPropertyAnimation
    //自动逆转
    animation.autoreverses = YES;
    animation.values = @[(id)[UIColor yellowColor].CGColor,
                         (id)[UIColor grayColor].CGColor,
                         (id)[UIColor cyanColor].CGColor,
                         (id)[UIColor purpleColor].CGColor];
    [_layer addAnimation:animation forKey:nil];
}

- (void)basicAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animation];
   /* 动画过度的属性 from 从哪里来 to 到哪里去  */
    animation.keyPath = @"backgroundColor";
    animation.fromValue = (id)[UIColor redColor].CGColor;
    animation.toValue = (id)[UIColor cyanColor].CGColor;
    animation.autoreverses = YES;
    //时间
    animation.duration = 2;
    [_layer addAnimation:animation forKey:nil];
}

- (void)transaction {
    /*
     事务 CATransaction
     *显性事务 和 隐性事务(直接改变CALayer的颜色也有效果)
    
     */
    [CATransaction begin];
    [CATransaction setAnimationDuration:5];
    _layer.backgroundColor = [UIColor yellowColor].CGColor;
    [CATransaction commit];
    _layer.position = CGPointMake(250, 250);
}


@end
