//
//  ViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/11.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "ViewController.h"
#import "NewWebView.h"
#import "MyScrollView.h"
#import "backView.h"




@interface ViewController ()

@property(nonatomic,strong)MyScrollView *scrollView;

@property(nonatomic,strong)backView *backView;

@property(nonatomic,assign)BOOL isEnd;



@property(nonatomic,strong)MyScrollView *scroll1;
@property(nonatomic,strong)MyScrollView *scroll2;

@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.backView=[[backView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.backView];
    
    self.view.backgroundColor=[UIColor blueColor];
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
