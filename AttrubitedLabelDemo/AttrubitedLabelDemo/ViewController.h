//
//  ViewController.h
//  AttrubitedLabelDemo
//
//  Created by leejan97 on 13-12-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLabel.h"
@interface ViewController : UIViewController<CustomLabelDelegate>
{
    CustomLabel *customLabel;
}

@end
