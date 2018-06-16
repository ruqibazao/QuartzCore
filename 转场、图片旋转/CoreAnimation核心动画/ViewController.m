//
//  ViewController.m
//  CoreAnimation核心动画
//
//  Created by qianfeng on 15/12/24.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerA.h"

@interface ViewController ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

-(UIImageView *)imageView{
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"1"];
    }
    return _imageView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    
    
#if 0
    //基础动画(放大缩小)
    CABasicAnimation *scaleAnimation = [CABasicAnimation new];
    scaleAnimation.fromValue = @(1.0);
    scaleAnimation.toValue = @(0.1);
    //scaleAnimation.duration = 2.0f;
    scaleAnimation.keyPath = @"transform.scale";
    
    //动画只能添加到图层之上
    //[self.imageView.layer addAnimation:scaleAnimation forKey:@"scale"];
    
    //移除动画
    //[self.imageView.layer removeAnimationForKey:@"scale"]
    
#endif
    
    
#if 1
    //(翻转)
    CABasicAnimation *rotationAnimation = [CABasicAnimation new];
    
    rotationAnimation.keyPath = @"transform.rotation";
    //旋转90读
    rotationAnimation.toValue = @(M_PI*2.0);
    rotationAnimation.duration = 2.0f;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.repeatCount = HUGE_VALF;
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotation"];
#endif
    
    
#if 0
    //平移
    CABasicAnimation *translationAnimation = [CABasicAnimation new];
    
    translationAnimation.keyPath = @"transform.translation.y";
    translationAnimation.toValue = @(200);
    //translationAnimation.duration = 2.0f;
    
    //[self.imageView.layer addAnimation:translationAnimation forKey:@"translation"];
    
#endif
    
    
#if 0
    //组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup new];
    
    groupAnimation.animations = @[scaleAnimation,rotationAnimation,translationAnimation];
    
    groupAnimation.repeatCount = MAXFLOAT;
    groupAnimation.duration = 2.0;
    
    [self.imageView.layer addAnimation:groupAnimation forKey:@"group"];
    
#endif
    
    
#if 0
    //关键帧动画
    CAKeyframeAnimation *keyFramAnimation = [CAKeyframeAnimation new];
    
    keyFramAnimation.keyPath = @"position";
    keyFramAnimation.duration = 3.0;
    keyFramAnimation.repeatCount = MAXFLOAT;
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 400)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    
    //设置移动的路径
    keyFramAnimation.values = @[value1,value2,value3,value4,value5];
    //设置动画永远处于最新的状态
    keyFramAnimation.fillMode = kCAFillModeForwards;
    //动画结束后不自动移除动画
    keyFramAnimation.removedOnCompletion = NO;
    
    //设置动画节奏
    keyFramAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.imageView.layer addAnimation:keyFramAnimation forKey:@"keyFramAnimation"];
    
#endif
    
#if 0
    //设置转圈
    CAKeyframeAnimation *keyFramAnimation = [CAKeyframeAnimation new];
    keyFramAnimation.duration = 3.0f;
    keyFramAnimation.repeatCount = MAXFLOAT;
    
    //创建一个路径
    CGPathRef path = CGPathCreateWithEllipseInRect(CGRectMake(100, 300, 200, 300), nil);
    
    //设置路径
    keyFramAnimation.path = path;
    //控制器动画的元素是位置点
    keyFramAnimation.keyPath = @"position";
    
    //设置动画永远处于最新的状态
    keyFramAnimation.fillMode = kCAFillModeForwards;
    //动画结束后不自动移除动画
    keyFramAnimation.removedOnCompletion = NO;
    
    //设置动画节奏
    keyFramAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.imageView.layer addAnimation:keyFramAnimation forKey:@"keyFramAnimation"];
    
#endif
    
#if 0
    
    CAKeyframeAnimation *keyFramAnimation = [CAKeyframeAnimation new];
    
    keyFramAnimation.keyPath = @"transform.rotation";
    
    NSValue *value1 = @(M_PI_4);
    NSValue *value2 = @(-M_PI_4);
    
    keyFramAnimation.values =  @[value1,value2,value1];
    keyFramAnimation.duration = 0.1f;
    keyFramAnimation.repeatCount = MAXFLOAT;
    
    //设置动画永远处于最新的状态
    keyFramAnimation.fillMode = kCAFillModeForwards;
    //动画结束后不自动移除动画
    keyFramAnimation.removedOnCompletion = NO;
    
    [self.imageView.layer addAnimation:keyFramAnimation forKey:@"rotation"];
#endif
}


- (IBAction)transitionAction:(id)sender {
    
    
    /*
     {@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"};
     */
    //转场动画
    CATransition *transition = [CATransition new];
    //设置动画类型
    transition.type = @"cameraIrisHollowClose";
    //transition.subtype = kCATransitionFromLeft;
    transition.duration = 2.0f;
    
    
    //[self.imageView.layer addAnimation:transition forKey:@"transition"];
    
    //自定义转场动画
    [self.view.superview.layer addAnimation:transition forKey:@"transition"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerA *ctlA = [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerA"];
    [self presentViewController:ctlA animated:NO completion:nil];
    
    
    
    
}

@end
