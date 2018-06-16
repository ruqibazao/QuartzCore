//
//  draw.m
//  道具效果
//
//  Created by NegHao.W on 16/3/25.
//  Copyright © 2016年 LiveStar. All rights reserved.
//

#import "draw.h"

@implementation draw

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */



- (void)drawRect:(CGRect)rect {
    // Drawing code
    //// Color Declarations
    //// Color Declarations
    
    drawTrack();
}

void drawTrack(){
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
    
    
}

void drawXiaoHuangRen(){

    UIColor* color2 = [UIColor colorWithRed: 0.986 green: 1 blue: 0 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.954 green: 0.938 blue: 0.04 alpha: 1];
    CGFloat color3HSBA[4];
    [color3 getHue: &color3HSBA[0] saturation: &color3HSBA[1] brightness: &color3HSBA[2] alpha: &color3HSBA[3]];
    
    UIColor* color4 = [UIColor colorWithHue: color3HSBA[0] saturation: 1 brightness: color3HSBA[2] alpha: color3HSBA[3]];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [UIColor.blackColor setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(81.5, 142.5)];
    [bezier4Path addCurveToPoint: CGPointMake(192.5, 142.5) controlPoint1: CGPointMake(131.32, 50.25) controlPoint2: CGPointMake(192.5, 142.5)];
    [color2 setFill];
    [bezier4Path fill];
    [UIColor.blackColor setStroke];
    bezier4Path.lineWidth = 1;
    [bezier4Path stroke];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(81.5, 279.5)];
    [bezier3Path addCurveToPoint: CGPointMake(192.45, 279.5) controlPoint1: CGPointMake(81.5, 279.5) controlPoint2: CGPointMake(137.39, 354.5)];
    bezier3Path.lineCapStyle = kCGLineCapRound;
    
    bezier3Path.lineJoinStyle = kCGLineJoinBevel;
    
    [color2 setFill];
    [bezier3Path fill];
    [UIColor.blackColor setStroke];
    bezier3Path.lineWidth = 1;
    [bezier3Path stroke];
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(82.5, 141.5)];
    [bezier5Path addLineToPoint: CGPointMake(81.5, 279.5)];
    [UIColor.blackColor setStroke];
    bezier5Path.lineWidth = 1;
    [bezier5Path stroke];
    
    
    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
    [bezier6Path moveToPoint: CGPointMake(193.5, 141.5)];
    [bezier6Path addLineToPoint: CGPointMake(192.5, 279.5)];
    [UIColor.blackColor setStroke];
    bezier6Path.lineWidth = 1;
    [bezier6Path stroke];
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(82.5, 141.5, 112, 17)];
    [UIColor.blackColor setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(82, 159, 113, 121)];
    [color4 setFill];
    [rectangle2Path fill];
    
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(90.5, 127.5, 37, 40)];
    [UIColor.blackColor setFill];
    [oval3Path fill];
    [UIColor.blackColor setStroke];
    oval3Path.lineWidth = 1;
    [oval3Path stroke];
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(99.5, 132.5, 28, 35)];
    [UIColor.whiteColor setFill];
    [ovalPath fill];
    [UIColor.blackColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
    
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(143.5, 128.5, 37, 40)];
    [UIColor.blackColor setFill];
    [oval4Path fill];
    [UIColor.blackColor setStroke];
    oval4Path.lineWidth = 1;
    [oval4Path stroke];
    
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(145.5, 132.5, 28, 35)];
    [UIColor.whiteColor setFill];
    [oval2Path fill];
    [UIColor.blackColor setStroke];
    oval2Path.lineWidth = 1;
    [oval2Path stroke];
    
    
    //// Oval 5 Drawing
    UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(111, 145, 14, 11)];
    [UIColor.grayColor setFill];
    [oval5Path fill];
    
    
    //// Oval 6 Drawing
    UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(147, 145, 14, 11)];
    [UIColor.grayColor setFill];
    [oval6Path fill];
    
    
    //// Bezier 7 Drawing
    UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
    [bezier7Path moveToPoint: CGPointMake(112.5, 215.5)];
    [bezier7Path addCurveToPoint: CGPointMake(161.45, 215.5) controlPoint1: CGPointMake(112.5, 215.5) controlPoint2: CGPointMake(137.16, 259)];
    [UIColor.blackColor setStroke];
    bezier7Path.lineWidth = 1;
    [bezier7Path stroke];

}


@end
