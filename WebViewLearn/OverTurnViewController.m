//
//  OverTurnViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "OverTurnViewController.h"

@interface OverTurnViewController()

@property(nonatomic,strong)UIView *myview;


@end


@implementation OverTurnViewController

-(void)viewDidLoad
{
    //UIView
    self.myview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
    self.myview.backgroundColor=[UIColor redColor];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text=@"................";
    [self.myview addSubview:label];
    [self.view addSubview:self.myview];
    
    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2+100, 100,100)];
    [button setTitle:@"转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(zhuan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    self.view.backgroundColor=[UIColor blueColor];
}


//转屏
-(void)zhuan
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/2, 0.0, 0.0, 1.0) ];
    animation.duration = 1.0;
    animation.cumulative = YES;
    [self.myview.layer addAnimation:animation forKey:nil];
    
    NSLog(@"......\n");
}


@end
