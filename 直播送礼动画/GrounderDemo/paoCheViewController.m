//
//  paoCheViewController.m
//  GrounderDemo
//
//  Created by NegHao.W on 16/4/11.
//  Copyright © 2016年 贾楠. All rights reserved.
//

#import "paoCheViewController.h"

@interface paoCheViewController ()

@end

@implementation paoCheViewController

-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [super viewDidDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onClickPlay:(id)sender {
    //    [UIView animateWithDuration:1.0 animations:^{
    //        self.imageView.transform = CGAffineTransformMakeTranslation(100, 100);
    //
    //    }];
    
    NSMutableArray* tyre_f_images = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [tyre_f_images addObject: [UIImage imageNamed:[NSString stringWithFormat:@"porche-f%d",i]]];
    }
    self.tyre_f.animationImages = tyre_f_images;
    self.tyre_f.animationDuration = 0.1;
    self.tyre_f.animationRepeatCount = 0;
    [self.tyre_f startAnimating];
    
    NSMutableArray* tyre_b_images = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [tyre_b_images addObject: [UIImage imageNamed:[NSString stringWithFormat:@"porche-b%d",i]]];
    }
    self.tyre_b.animationImages = tyre_b_images;
    self.tyre_b.animationDuration = 0.1;
    self.tyre_b.animationRepeatCount = 0;
    [self.tyre_b startAnimating];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 0);
    CGPathAddQuadCurveToPoint(path, NULL, 0, 250, 200, 300);
    animation.path = path;
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.15];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 1.5;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 1.5;
    animationGroup.autoreverses = NO;
    animationGroup.repeatCount = 0;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    [animationGroup setAnimations:[NSArray arrayWithObjects:animation, scaleAnimation, nil]];
    
    [self.carViews.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

- (IBAction)onClickGo:(id)sender {
    [self performSegueWithIdentifier:@"AnimationId" sender:self];
}


-(void)didStopAnimation{
    NSLog(@"结束！！！");
}


- (IBAction)sendCar:(UIButton *)sender {
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 64, 100, 100)];
    bgImageView.image = [UIImage imageNamed:@"lambo.png"];
    [self.myView addSubview:bgImageView];
    self.behindWheelView = [[UIImageView alloc] init];
    self.behindWheelView.frame = CGRectMake(20, 83, 11, 31);
    self.behindWheelView.image = [UIImage imageNamed:@"lambo-b1.png"];
    self.fronlWheelView = [[UIImageView alloc] init];
    self.fronlWheelView.frame = CGRectMake(52, 120, 18, 35);
    self.fronlWheelView.image = [UIImage imageNamed:@"lambo-f1.png"];
    self.fronlWheelImage = [[NSMutableArray alloc] init];
    self.behindWheelImage = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i < 5; i++) {
        UIImage *image = [UIImage imageNamed:@"wheel.png"];
        [self.behindWheelImage addObject:image];
        UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"lambo-f%ld.png",i]];
        [self.fronlWheelImage addObject:image2];
    }
    self.behindWheelView.animationImages = self.behindWheelImage;
    self.behindWheelView.animationDuration = 0.10;
    self.behindWheelView.animationRepeatCount = 0;
    [self.myView addSubview:self.behindWheelView];
    self.fronlWheelView.animationImages = self.fronlWheelImage;
    self.fronlWheelView.animationDuration = 0.10;
    self.fronlWheelView.animationRepeatCount = 0;
    [self.myView addSubview:self.fronlWheelView];
    [self.fronlWheelView startAnimating];
    [self.behindWheelView startAnimating];
    
    
    CALayer *transitionLayer = [[CALayer alloc] init];
    transitionLayer.frame = self.view.layer.bounds;
    //    [self.myView.layer addSublayer:transitionLayer];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(137.5, 33.5)];
    [bezierPath addCurveToPoint: CGPointMake(60.8, 84.65) controlPoint1: CGPointMake(137.5, 33.5) controlPoint2: CGPointMake(79.97, 71.86)];
    [bezierPath addCurveToPoint: CGPointMake(60.8, 164.67) controlPoint1: CGPointMake(41.62, 97.44) controlPoint2: CGPointMake(60.8, 144.67)];
    [bezierPath addCurveToPoint: CGPointMake(189.5, 224.5) controlPoint1: CGPointMake(60.8, 184.68) controlPoint2: CGPointMake(189.5, 224.5)];
    [bezierPath addCurveToPoint: CGPointMake(284.62, 260.45) controlPoint1: CGPointMake(189.5, 224.5) controlPoint2: CGPointMake(260.84, 251.46)];
    [bezierPath addCurveToPoint: CGPointMake(326.5, 301.5) controlPoint1: CGPointMake(308.4, 269.44) controlPoint2: CGPointMake(316.03, 291.24)];
    [bezierPath addCurveToPoint: CGPointMake(268.66, 365.61) controlPoint1: CGPointMake(336.97, 311.76) controlPoint2: CGPointMake(268.66, 365.61)];
    [bezierPath addLineToPoint: CGPointMake(166.51, 380.44)];
    [bezierPath addCurveToPoint: CGPointMake(60.8, 380.44) controlPoint1: CGPointMake(166.51, 380.44) controlPoint2: CGPointMake(87.23, 380.44)];
    [bezierPath addCurveToPoint: CGPointMake(28.5, 404.5) controlPoint1: CGPointMake(34.37, 380.44) controlPoint2: CGPointMake(36.57, 398.49)];
    [bezierPath addCurveToPoint: CGPointMake(28.5, 448.99) controlPoint1: CGPointMake(20.43, 410.51) controlPoint2: CGPointMake(28.5, 437.87)];
    [bezierPath addCurveToPoint: CGPointMake(284.5, 492.5) controlPoint1: CGPointMake(28.5, 460.12) controlPoint2: CGPointMake(284.5, 492.5)];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat starX = self.myView.bounds.origin.x;
    CGFloat starY = self.myView.bounds.origin.y;
    CGPathMoveToPoint(path, NULL, starX, starY);
    positionAnimation.path = bezierPath.CGPath;
    positionAnimation.duration = 2.0;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    CGPathAddCurveToPoint(path, NULL, starX, starY, 220, 300, 320, 450);
    positionAnimation.calculationMode = kCAAnimationCubic;
    positionAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.duration = 2;
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 2.0, 2.0, 2.0)];
    transformAnimation.fillMode = kCAFillModeForwards;
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3.0;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationGroup.removedOnCompletion = NO;
    animationGroup.animations = @[positionAnimation,transformAnimation];
    animationGroup.delegate = self;
    
    
    [self.myView.layer addAnimation:animationGroup forKey:@"cartParabola"];
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self.behindWheelView stopAnimating];
    [self.fronlWheelView stopAnimating];
    
}

@end
