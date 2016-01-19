//
//  ViewController.m
//  bounceAnimation
//
//  Created by Apple on 16/1/19.
//  Copyright © 2016年 ZWZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //普通动画效果
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(120, 10, 100, 100)];
    imageview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageview];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    
    
    [UIView setAnimationDuration:3];
    CGPoint point = imageview.center;
    point.y +=300;
    point.x +=80;
    imageview.backgroundColor = [UIColor greenColor];
    [imageview setCenter:point];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationDuration:3];
    [imageview setAlpha:0.50];
    [UIView commitAnimations];
    
    
//    [UIView animateWithDuration:3 animations:^{
//        CGPoint point = imageview.center;
//        point.y +=300;
//        point.x +=100;
//        imageview.backgroundColor = [UIColor greenColor];
//        [imageview setCenter:point];
//
//    } completion:^(BOOL finished) {
//        
//    }];

    
    //回弹效果
    UIImageView * bounceAnimationImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    [self.view addSubview:bounceAnimationImage];
    bounceAnimationImage.backgroundColor = [UIColor greenColor];
    
    [UIView animateWithDuration:3 delay:1 usingSpringWithDamping:0.2 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGPoint point = bounceAnimationImage.center;
        point.y += 400;
//        bounceAnimationImage.center.y = point.y;
        [bounceAnimationImage setCenter:point];
    } completion:^(BOOL finished) {
        //动画完成，改变颜色
        [UIView animateWithDuration:2 animations:^{
            bounceAnimationImage.backgroundColor = [UIColor redColor];
        }];
    }];
    
    
    
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
