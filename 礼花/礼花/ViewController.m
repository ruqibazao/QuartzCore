//
//  ViewController.m
//  礼花
//
//  Created by NegHao.W on 16/3/21.
//  Copyright © 2016年 LiveStar. All rights reserved.
//

#import "ViewController.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (copy, nonatomic) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
//    [self createSnowFlake];
    NSURL *url = [NSURL URLWithString:@"http://v.zhenbi.com/i/13/8018.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _image = [UIImage imageWithData:data];
    [self createSnowFlake];

}

-(void)createSnowFlake{

    CAEmitterLayer *snowworks = [CAEmitterLayer layer];
    snowworks.emitterPosition = CGPointMake(Width/2, 300);
    snowworks.emitterSize = CGSizeMake(50, 50);
    snowworks.emitterMode = kCAEmitterLayerOutline;
    snowworks.emitterShape = kCAEmitterLayerSphere;
    
    //粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.name = @"snow";
    snowflake.birthRate = 1.0;
    snowflake.lifetime = 120.0;
    snowflake.velocity = 10.0;//速度
    snowflake.velocityRange = 1;//速度的范围
    snowflake.yAcceleration = 2;//漂移的方向
    
    snowflake.emissionRange = M_PI_2;
    snowflake.spinRange = M_PI_2;
    snowflake.contents = (id)[UIImage imageNamed:@"2.png"].CGImage;
//    snowflake.color = [UIColor whiteColor].CGColor;
//    snowworks.shadowColor = [UIColor redColor].CGColor;
    
    snowflake.greenRange = 1.0;//粒子的绿色RBG值变化范围
    snowflake.redRange = 1.0;//粒子的红色RBG值变化范围
    snowflake.blueRange = 1.0;//粒子的蓝色RBG值变化范围
    
    snowworks.emitterCells = @[snowflake];
    [self.view.layer addSublayer:snowworks];
    
}

-(void)createFireworks{

    CAEmitterLayer *fireworks = [CAEmitterLayer layer];
    fireworks.emitterPosition = CGPointMake(Width/2, Height-30);
    fireworks.emitterSize = CGSizeMake(200, 200);
    fireworks.emitterMode = kCAEmitterLayerOutline;
    fireworks.emitterShape = kCAEmitterLayerLine;
    fireworks.renderMode = kCAEmitterLayerAdditive;
    fireworks.seed = (arc4random() % 100) + 1;
    
    //ROCKET
    CAEmitterCell *rocket = [CAEmitterCell emitterCell];
    rocket.birthRate = 0.5;//发射粒子的间隔时间
    rocket.emissionRange = 0.25 * M_PI;
    rocket.velocity = 480;//粒子飞行速度
    rocket.velocityRange = 60;//曝发范围
    rocket.yAcceleration = 75;
    rocket.lifetime = 1.02;//粒子曝发次数
    rocket.contents = (id)[UIImage imageNamed:@"8018.jpg"].CGImage;
    rocket.scale = 0.8;//粒子包括曝发后的子粒子的大小
    rocket.color = [UIColor redColor].CGColor;
    rocket.greenRange = 1.0;//粒子的绿色RBG值变化范围
    rocket.redRange = 1.0;//粒子的红色RBG值变化范围
    rocket.blueRange = 1.0;//粒子的蓝色RBG值变化范围
    rocket.spinRange = M_PI;
    
    
    //曝发
    CAEmitterCell *burst = [CAEmitterCell emitterCell];
    burst.birthRate = 1.0;
    burst.velocity = 0;
    burst.scale = 1.02;
    burst.redRange = 1.5;
    burst.greenRange = 1.5;
    burst.blueRange = 1.5;
    burst.lifetime = 0.35;
    
    //火花
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    spark.birthRate = 400;//粒子参数的乘数因子
    spark.velocity = 125;
    spark.emissionRange = M_PI_2;//发射的角度
    spark.yAcceleration = 75;
    spark.lifetime = 3;
    spark.contents = (id)[UIImage imageNamed:@"2"].CGImage;
    spark.scaleRange = -0.2;//缩放比例范围
    spark.greenRange = 1.0;
    spark.redRange = 1.0;
    spark.blueRange = 1.0;
    spark.alphaRange = -0.25;
    spark.spin = M_PI_2;
    spark.spinRange = M_PI_2;//子旋转角度范围
    
    
    fireworks.emitterCells = @[rocket];
    rocket.emitterCells = @[burst];
    burst.emitterCells = @[spark];
    [self.view.layer addSublayer:fireworks];

}







@end
