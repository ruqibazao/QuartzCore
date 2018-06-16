//
//  paoCheViewController.h
//  GrounderDemo
//
//  Created by NegHao.W on 16/4/11.
//  Copyright © 2016年 贾楠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface paoCheViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (nonatomic, strong) UIView *carView;
@property (nonatomic, strong) UIImageView *fronlWheelView;
@property (nonatomic, strong)   NSMutableArray *fronlWheelImage;
@property (nonatomic, strong)   NSMutableArray *behindWheelImage;
@property (nonatomic, strong) UIImageView *behindWheelView;

@property (nonatomic, strong) UIView *planeView;
@property (nonatomic, strong) UIImageView *planeScrewView;
@property (nonatomic, copy)   NSMutableArray *planScrewImage;

@property (weak, nonatomic) IBOutlet UIImageView *tyre_f;
@property (weak, nonatomic) IBOutlet UIImageView *tyre_b;
@property (weak, nonatomic) IBOutlet UIView *carViews;

@end
