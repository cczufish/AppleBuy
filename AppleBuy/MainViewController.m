//
//  MainViewController.m
//  AppleBuy
//
//  Created by mac on 14-3-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "FifthViewController.h"
#import "FourthViewController.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self customViewControllers];
}


#pragma mark - Private Method
//装载子视图
- (void)initView
{
    FirstViewController *firstVireController = [[FirstViewController alloc] init];
    BaseNavigationController *firstNavigation = [[BaseNavigationController alloc]initWithRootViewController:firstVireController];
    [firstVireController release];
    
    SecondViewController *secondVireController = [[SecondViewController alloc] init];
    BaseNavigationController *secondNavigation = [[BaseNavigationController alloc]initWithRootViewController:secondVireController];
    [secondVireController release];
    
    ThirdViewController *thirdVireController = [[ThirdViewController alloc] init];
    BaseNavigationController *thirdtNavigation = [[BaseNavigationController alloc]initWithRootViewController:thirdVireController];
    [thirdVireController release];
    
    FourthViewController *fourthVireController = [[FourthViewController alloc] init];
    BaseNavigationController *fourthNavigation = [[BaseNavigationController alloc]initWithRootViewController:fourthVireController];
    [fourthVireController release];
    
    FifthViewController *fithVireController = [[FifthViewController alloc] init];
    BaseNavigationController *fithNavigation = [[BaseNavigationController alloc]initWithRootViewController:fithVireController];
    [fithVireController release];
    
    NSArray *array = @[firstNavigation, secondNavigation, thirdtNavigation, fourthNavigation, fithNavigation];
    [self setViewControllers:array animated:YES];
    
    [firstNavigation release];
    [secondNavigation release];
    [thirdtNavigation release];
    [fourthNavigation release];
    [fithNavigation release];
    
}

//自定义TabBar视图
- (void)customViewControllers
{
    //自定义tabBar
    _tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDiviceHeight-49, kDiviceWidth, 49)];
    _tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    _tabBarBG.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarBG];
    
    //自定义TabbarItem
    NSArray *array = @[@"gray", @"icon_cinema", @"msg_new", @"sc", @"more_setting"];
    NSArray *titles = @[@"首页", @"手机", @"平板", @"电脑", @"更多"];
    
    //选中视图的添加
    _selectedView = [[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBarBG.bounds.size.height/2 - 45/2, 50, 45)];
    _selectedView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_tabBarBG addSubview:_selectedView];
    
    //未解耦合的方法
    
    int x = 0;
    for (int index = 0; index < 5; index ++) {
        //小图片的添加
        UIImageView *itemView = [[UIImageView alloc] initWithFrame:CGRectMake(18+x, 8, 22, 22)];
        itemView.image = [UIImage imageNamed:array[index]];
        itemView.tag = index;
        itemView.contentMode = UIViewContentModeScaleAspectFit;
        itemView.userInteractionEnabled = YES;
        [_tabBarBG addSubview:itemView];
        
        //为小图片添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
        [itemView addGestureRecognizer:tap];
        [tap release];
        
        
        //小图标下面文字的添加
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(itemView.frame.origin.x, itemView.frame.origin.y + itemView.frame.size.height+3, itemView.frame.size.width, 10)];
        title.text = titles[index];
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont boldSystemFontOfSize:10];
        [_tabBarBG addSubview:title];
        
        x += (itemView.frame.size.width + 43);
        
        [itemView release];
        [title release];
    }

}

#pragma mark - Target Action
//未解耦合的方法
- (void)test:(UITapGestureRecognizer *)tap
{
    UIView *view = [tap view];
    [UIView beginAnimations:nil context:nil];
    _selectedView.frame = CGRectMake(5 + 65*view.tag, _tabBarBG.bounds.size.height/2 - 45/2, 50, 45);
    [UIView commitAnimations];
    self.selectedIndex = view.tag;
}
 
#pragma mark - memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
    [_tabBarBG release],     _tabBarBG = nil;
    [_selectedView release], _selectedView = nil;
}

@end

