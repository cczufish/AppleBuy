//
//  FirstViewController.h
//  AppleBuy
//
//  Created by mac on 14-3-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DengluViewController.h"
#import "PassUserValueDelegate.h"


@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,PassUserValueDelegate>
{
    @private
    UITableView *_listView;
    NSMutableArray *_subjectsArray;
    NSString *_string;
}

@property (nonatomic, assign)UITableView *listView;

@end
