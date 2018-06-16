//
//  ViewController.m
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/8.
//  Copyright © 2016年 贾楠. All rights reserved.
//

#import "ViewController.h"
#import "GrounderSuperView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ViewController()
{
    GrounderSuperView *superView;
}
@property (weak, nonatomic) IBOutlet UITextField *textconent;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tanmu];
}
- (IBAction)onClickPlays:(id)sender {
    NSMutableArray* images = [NSMutableArray array];
    for(int i = 1;i<4;i++){
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"plane-screw-4-%d",i]]];
    }
    
    self.imageView.animationImages = images;
    self.imageView.animationDuration = 0.05;
    self.imageView.animationRepeatCount = 0;
    [self.imageView startAnimating];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 600, 0);
    CGPathAddQuadCurveToPoint(path, NULL, 150, 250, 150, 250);
    animation.path = path;
    animation.duration = 2.0;
    //animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.1];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.8];
    scaleAnimation.duration = 2.0;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.0;
    animationGroup.autoreverses = NO;
    animationGroup.repeatCount = 0;
    animationGroup.removedOnCompletion = YES;
    animationGroup.fillMode = kCAFillModeForwards;
    [animationGroup setAnimations:[NSArray arrayWithObjects:animation, scaleAnimation, nil]];
    
    [self.planeView.layer addAnimation:animationGroup forKey:@"animationGroup"];
}


-(void)tanmu{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"弹幕" forState:UIControlStateNormal];
    button.frame = CGRectMake(Width-80, Height-80, 80, 30);
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    superView = [[GrounderSuperView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 140)];
    [self.view addSubview:superView];
}

- (void)buttonClick{
    [superView setModel:self.textconent.text];
}




@end
