//
//  backView.m
//  WebViewLearn
//
//  Created by baidu on 16/8/12.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "backView.h"
#import "NewWebView.h"
#import "MyScrollView.h"


@implementation backView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    //
    self.webView=[[NewWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)];
    self.webView.backgroundColor=[UIColor redColor];
    
    //不允许网页自动缩放
    self.webView.scalesPageToFit=NO;
    //不允许弹簧效果
    self.webView.scrollView.bounces = NO;
    
    //测试一下，显示内容
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://bbs.byr.cn/#!default"]];
    [self.webView loadRequest:request];
    

    
    
    
    //ScrollView
    self.myScrollView=[[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view2.backgroundColor=[UIColor yellowColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 45, 100)];
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    label.font = [UIFont systemFontOfSize:13];
    //label.textColor = [UIColor colorWithHexValue:0x444444];
    label.textAlignment = NSTextAlignmentLeft;
    label.text=@"芒果TV";
    [view2 addSubview:label];
    
    
    [self.myScrollView addSubview:view2];
    
    self.myScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2*3);
    self.myScrollView.bounces=NO;
    self.myScrollView.canCancelContentTouches=NO;
    
    [self.myScrollView addSubview:self.webView];
    [self addSubview:self.myScrollView];
    
    
    //maskview,用来获取touchEven事件
    self.maskView=[[MaskView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.maskView.backView=self;
    [self addSubview:self.maskView];
    
    return self;
}




@end
