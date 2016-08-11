//
//  ViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "ViewController.h"
#import "NewWebView.h"
@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    NewWebView * newWebView=[[NewWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
    newWebView.backgroundColor=[UIColor redColor];
    
    //不允许网页自动缩放
    newWebView.scalesPageToFit=NO;
    //不允许弹簧效果
    newWebView.scrollView.bounces = NO;
    
    //测试一下，显示内容
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://bbs.byr.cn/#!default"]];
    [newWebView loadRequest:request];
    
    //测试newWebView 中的ScrollView
    newWebView.bottomView.backgroundColor=[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 199, 100)];
    label.text=@"我是评论";
    [newWebView.bottomView addSubview:label];
    newWebView.bottomView.hidden=YES;
    
    
    
    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view2.backgroundColor=[UIColor yellowColor];
    
    [self.scrollView addSubview:view2];
    [self.scrollView addSubview:newWebView];
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2*3);
    self.scrollView.bounces=NO;
    self.scrollView.canCancelContentTouches=NO;
    [self.view addSubview:self.scrollView];
    self.view.backgroundColor=[UIColor blueColor];
}

#pragma mark newWebView.ScrollView UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y==scrollView.contentSize.height) {
        NSLog(@"\n");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
