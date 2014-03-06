//
//  DengluViewController.h
//  AppleBuy
//
//  Created by mac on 14-3-5.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassUserValueDelegate.h"


@interface DengluViewController : UIViewController <UITextFieldDelegate>
{
    @private
    UITextField *_nameText;
    UITextField *_numberText;
    NSObject<PassUserValueDelegate> *delegate;
}

@property(nonatomic, assign) NSObject<PassUserValueDelegate> *delegate;


@end
