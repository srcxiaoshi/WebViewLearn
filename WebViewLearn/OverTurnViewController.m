//
//  OverTurnViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "OverTurnViewController.h"
#import "NewWebView.h"

@interface OverTurnViewController()

@property(nonatomic,strong)UIView *myview;
@property(nonatomic,strong)NewWebView *webView;
@property(nonatomic,assign)BOOL isQuan;


@end


@implementation OverTurnViewController

-(void)viewDidLoad
{
    //UIView
//    self.myview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
//    self.myview.backgroundColor=[UIColor redColor];
//    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    label.text=@"................";
//    [self.myview addSubview:label];
//    [self.view addSubview:self.myview];
    
    self.isQuan=NO;
    
    self.webView=[[NewWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
    self.webView.backgroundColor=[UIColor redColor];
    
    //不允许网页自动缩放
    self.webView.scalesPageToFit=NO;
    //不允许弹簧效果
    self.webView.scrollView.bounces = NO;
    
    //测试一下，显示内容
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2+100, 100,100)];
    [button setTitle:@"转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(zhuan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    self.view.backgroundColor=[UIColor blueColor];
}


//转屏
-(void)zhuan
{
    self.webView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    //简单的动画效果
    [UIView animateWithDuration:2.0 animations:^{
        //全屏
        if (self.isQuan) {
            //宽度就会变为 width*sx ，对应高度变为 hight * sy。
            CGAffineTransform t = CGAffineTransformMakeScale(1.0,1.0);
            
            //在平移基础上，继续旋转
            t = CGAffineTransformRotate(t, 90);
            self.webView.transform = t;
        }
        else
        {
/*            //self.webView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
//            float tx=0;
//            float ty=0-self.webView.frame.size.height;
//            //平移
//            CGAffineTransform t1=CGAffineTransformMakeTranslation(tx,ty);
//            self.webView.layer.anchorPoint=CGPointMake(0,0);
//            //旋转,旋转的是弧度
//            CGAffineTransform t2 =CGAffineTransformMakeRotation(90*M_PI/180.0f);
//        
//            //缩放 width*sx ，对应高度变为 hight * sy。
//            CGAffineTransform t3 = CGAffineTransformMakeScale([UIScreen mainScreen].bounds.size.height/self.webView.frame.size.width,[UIScreen mainScreen].bounds.size.width/self.webView.frame.size.height);
//            
//            //合成两个变化
//            CGAffineTransform t4=CGAffineTransformConcat(t1,t2);
//
//            t4=CGAffineTransformConcat(t4,t3);
//            
//            
//            NSLog(@"---------%f,%f,%f,%f\n",self.webView.frame.origin.x,self.webView.frame.origin.y,self.webView.frame.size.width,self.webView.frame.size.height);
//            self.webView.transform = t4;
            
*/
            
            
            
/*
            
            //使用系统转屏的实现，如下，测试没有问题
//            //旋转动画
//            [UIView animateWithDuration:[[UIApplication sharedApplication] statusBarOrientationAnimationDuration] animations:^{
//                self.webView.transform = CGAffineTransformIdentity;
//                self.webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
//            }completion:^(BOOL finished) {
//                
//                //[[UIApplication sharedApplication] setStatusBarHidden:NO];
//                
//            }];

 */
            
            
            
            
            
            
            
            
            //旋转,旋转的是弧度，绕（0,0）旋转
            [self setAnchorPoint:CGPointMake(0,0) forView:self.webView];
            CGAffineTransform t1 =CGAffineTransformMakeRotation(90*M_PI/180.0f);
            CGAffineTransform t2=CGAffineTransformMakeTranslation(568,0);
            t1=CGAffineTransformConcat(t1,t2);
            self.webView.transform=t1;
            
        }
    } completion:^(BOOL finished) {
        //
        NSLog(@"完成\n");
        NSLog(@"---------%f,%f,%f,%f\n",self.webView.frame.origin.x,self.webView.frame.origin.y,self.webView.frame.size.width,self.webView.frame.size.height);
        [self setDefaultAnchorPointforView:self.webView];
    }];
    
    
    
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}

- (void)setDefaultAnchorPointforView:(UIView *)view
{
    [self setAnchorPoint:CGPointMake(0.5f, 0.5f) forView:view];
}
@end
