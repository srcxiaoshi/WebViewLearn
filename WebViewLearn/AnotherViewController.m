//
//  AnotherViewController.m
//  WebViewLearn
//
//  Created by baidu on 16/8/16.
//  Copyright © 2016年 shiruichang. All rights reserved.
//

#import "AnotherViewController.h"
#import "AppDelegate.h"

@interface EncodeClass : NSObject <NSCoding>
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)int age;
@end
@implementation EncodeClass

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeInt:self.age forKey:@"age"];
}

-(id) initWithCoder:(NSCoder *) aDecoder
{
    self=[super init];
    self.name=[aDecoder decodeObjectForKey:@"name"];
    self.age=[aDecoder decodeIntForKey:@"age"];
    return self;
}

@end



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
    
    
    
    //测试block
//    NSMutableArray *arr=[[NSMutableArray alloc] init];
//    [arr addObject:^{
//        NSLog(@"nihao\n");
//    }];
//    typedef void (*NewType)();
//    void (^bb)()=[arr objectAtIndex:0];
//    bb();

    //测试归档
    EncodeClass *enClass=[EncodeClass new];
    enClass.name=@"mingzi";
    enClass.age=1;
    //变成NSData
    NSData *other;
    other=[NSKeyedArchiver archivedDataWithRootObject:enClass];
    [other writeToFile:@"/tmp/objandobj.txt" atomically:YES];
    //从文件中读
    NSData *fileData;
    
    fileData=[NSData dataWithContentsOfFile:@"/tmp/objandobj.txt"];
    
    EncodeClass *fromFile;
    
    fromFile=(EncodeClass *)[NSKeyedUnarchiver unarchiveObjectWithData:fileData];
    
    NSLog(@"------%@",fromFile);

    
    
    
}

@end
