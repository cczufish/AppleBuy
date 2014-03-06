//
//  DengluViewController.m
//  AppleBuy
//
//  Created by mac on 14-3-5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "DengluViewController.h"
#import "FirstViewController.h"


@interface DengluViewController ()

@end

@implementation DengluViewController
@synthesize delegate;

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
    self.view.backgroundColor = [UIColor purpleColor];
    [self initBackgroudBT];
    [self initButton];
    [self initTextField];
    [self initTextLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Privite Method
- (void)initBackgroudBT
{
    UIButton *backgroundBT = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backgroundBT.frame = [[UIScreen mainScreen] applicationFrame];
    backgroundBT.backgroundColor = [UIColor clearColor];
    [backgroundBT addTarget:self action:@selector(keyboardMiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backgroundBT];
    [backgroundBT release];
}

- (void)initTextLabel
{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 60, 40)];
    nameLabel.text = @"昵称:";
    nameLabel.textColor = [UIColor redColor];
    [self.view addSubview:nameLabel];
    [nameLabel release];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 150, 60, 40)];
    numberLabel.text = @"密码:";
    numberLabel.textColor = [UIColor redColor];
    [self.view addSubview:numberLabel];
    [numberLabel release];
}

- (void)initTextField
{
    _nameText = [[UITextField alloc] initWithFrame:CGRectMake(90, 85, 200, 30)];
    _nameText.backgroundColor = [UIColor whiteColor];
    _nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText.textColor = [UIColor blackColor];
    _nameText.placeholder = @"请填写您的昵称或者邮箱";
    _nameText.font = [UIFont systemFontOfSize:13.0];
    _nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameText.keyboardType = UIKeyboardAppearanceDefault;
    _nameText.returnKeyType = UIReturnKeyDone;
    _nameText.delegate = self;
    [self.view addSubview:_nameText];
    [_nameText release];
    
    _numberText = [[UITextField alloc] initWithFrame:CGRectMake(90, 155, 200, 30)];
    _numberText.backgroundColor = [UIColor whiteColor];
    _numberText.borderStyle = UITextBorderStyleRoundedRect;
    _numberText.textColor = [UIColor blackColor];
    _numberText.placeholder = @"请填写您的密码";
    _numberText.font = [UIFont systemFontOfSize:13.0];
    _numberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _numberText.keyboardType = UIKeyboardTypeNumberPad;
    _numberText.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_numberText];
    [_numberText release];
}

- (void)initButton
{
    UIButton *load = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    load.frame = CGRectMake(120, 200, 60, 40);
    [load setTitle:@"确定" forState:UIControlStateNormal];
    [load setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [load addTarget:self action:@selector(welcome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:load];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(170, 200, 60, 40);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(welcome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];

}

#pragma mark - Action Method
- (void)keyboardMiss
{
    [_nameText resignFirstResponder];
    [_numberText resignFirstResponder];
}

- (void)welcome
{
    
    if ([_nameText.text length]==0 || [_numberText.text length]==0) {
        
    }else{
        [delegate passValueUser:_nameText.text andPassValuePassword:_numberText.text];
    }

    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"call back");
    }];
}

#pragma mark - delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [_numberText resignFirstResponder];
}


@end
