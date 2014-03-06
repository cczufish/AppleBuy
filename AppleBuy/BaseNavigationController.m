//
//  BaseNavigationController.m
//  AppleBuy
//
//  Created by mac on 14-3-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all"] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UINavigationBar (customBackground)

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"nav_bg_all"];
    [image drawInRect:rect];
}

@end
