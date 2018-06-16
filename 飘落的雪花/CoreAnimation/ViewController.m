//
//  ViewController.m
//  CoreAnimation
//
//  Created by NegHao.W on 16/3/21.
//  Copyright © 2016年 LiveStar. All rights reserved.
//

#import "ViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1.0];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(flake) userInfo:nil repeats:YES];

}

-(void)flake{
    UIImageView *flakeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    NSInteger range = Width;
    NSInteger starX = round(random() % range);
    NSInteger endX = round(random() % range);
    double scele = 1 / round(random() % 100) + 1.0;
    double speed = 1 / round(random() % 100) + 1.0;
    flakeImage.frame = CGRectMake(starX, -20, 25*scele, 25*scele);
    [self.view addSubview:flakeImage];
    [UIView beginAnimations:@"flake" context:(__bridge void *)(flakeImage)];
    [UIView setAnimationDuration:5 * speed];
    flakeImage.frame = CGRectMake(endX, Height-26, 25.0*scele, 25.0*scele);
    [UIView commitAnimations];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImageView *flakeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"praise.png"]];
    NSInteger range = Width;
    NSInteger starX = round(random() % range);
    NSInteger endX = round(random() % range);
    double scele = 1 / round(random() % 100) + 1.0;
    double speed = 1 / round(random() % 100) + 1.0;
    flakeImage.frame = CGRectMake(Width - 50, Height-26, 25.0*scele, 25.0*scele);
    [self.view addSubview:flakeImage];
    [UIView beginAnimations:@"flake" context:(__bridge void *)(flakeImage)];
    [UIView setAnimationDuration:5 * speed];
    flakeImage.frame = CGRectMake(starX, -20, 25*scele, 25*scele);
    [UIView commitAnimations];
    
}

@end
