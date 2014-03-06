//
//  FirstViewController.m
//  AppleBuy
//
//  Created by mac on 14-3-4.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "FirstViewController.h"
#import "DengluViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}

#pragma mark - ViewController Life
- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.jpg"]];
    [self addItem];
    
    //加载表格视图
    [self initListView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //请求数据
    [self requestData];
}


#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Privite Method
- (void)addItem
{
    //加入navigationItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:(UIBarButtonItemStyleBordered) target:self action:@selector(denglu)];
    self.navigationItem.rightBarButtonItem = item;
    item.tintColor = [UIColor grayColor];
    [item release];
}

- (void)initListView
{
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDiviceWidth, kDiviceHeight-20-44-49) style:UITableViewStylePlain];
    _listView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.jpg"]];
    _listView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    _listView.delegate = self;
    _listView.dataSource = self;
    [self.view addSubview:_listView];
    
}

//刷新UI
- (void)refreshUI
{
    [_listView reloadData];
}

///////////////////////////////////////////////////////////////////////////////////////
//请求数据
- (void)requestData
{
    //_subjectsArray = [[NSMutableArray alloc] initWithCapacity:9];
    //NSArray *array = @[@"1", @"2", @"3",@"4", @"5", @"6"];
    //[_subjectsArray addObjectsFromArray:array];
    //[_subjectsArray addObject:_string];
    
//    NameArray *idArray = [[NameArray alloc] init];
    _subjectsArray = [[NSMutableArray alloc] init];
//    _subjectsArray = idArray.nameArray;

    //刷新UI
}

#pragma mark - Action Method
- (void)denglu
{
    //创建一个模态视图，即登陆界面
    DengluViewController *denglu = [[DengluViewController alloc] init];
    denglu.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    denglu.delegate = self;
    [self presentViewController:denglu animated:YES completion:^{
        NSLog(@"dismiss");
    }];
}

- (void)passValueUser:(NSString *)value andPassValuePassword:(NSString *)pass{
    NSLog(@"%@",value);
    NSLog(@"%@",pass);
    [_subjectsArray addObject:value];
    [_subjectsArray addObject:pass];
    
    [self refreshUI];

}


#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_subjectsArray count];
}

#pragma mark - TableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 定义静态标识符
    static NSString *cellIdentifier = @"cell";
    
    // 检查表视图中是否存在闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = _subjectsArray[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.jpg"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - dealloc
- (void)dealloc
{
    [super dealloc];
    [_listView release], _listView = nil;
}

#pragma DengluViewController Delegate
-(void)changeTableText:(NSString *)text
{
    _string = text;
    NSLog(@"%@",text);
}

@end
