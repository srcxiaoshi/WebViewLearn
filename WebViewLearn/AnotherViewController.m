//
//  AnotherViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/16.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "AnotherViewController.h"
#import "AppDelegate.h"

@interface AnotherViewController()



@property(nonatomic,strong)UIImageView *imgView;


@end
@implementation AnotherViewController

-(void)viewDidLoad
{
    self.imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heng.jpg"]];
    //创建
    AppDelegate * appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    appDelegate.myWindow=[[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
    
    UIViewController *vc=[[UIViewController alloc]init];
    vc.view.backgroundColor=[UIColor redColor];
    [vc.view addSubview:self.imgView];
    
    appDelegate.myWindow.rootViewController=vc;
    appDelegate.myWindow.hidden=NO;
    
    
    appDelegate.myWindow.transform = CGAffineTransformMakeRotation( M_PI / 2 );
    
    NSLog(@"1 %f,%f,%f,%f\n",appDelegate.myWindow.frame.origin.x,appDelegate.myWindow.frame.origin.y
          ,appDelegate.myWindow.frame.size.width,appDelegate.myWindow.frame.size.height);
    
    //appDelegate.myWindow.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    NSLog(@"2 %f,%f,%f,%f\n",appDelegate.myWindow.frame.origin.x,appDelegate.myWindow.frame.origin.y
          ,appDelegate.myWindow.frame.size.width,appDelegate.myWindow.frame.size.height);
}

@end
