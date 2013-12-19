//
//  ViewController.m
//  AttrubitedLabelDemo
//
//  Created by leejan97 on 13-12-19.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewController.h"
#define kDetailLabelGap 25.0
#define kCustomFontMediumBold [UIFont fontWithName:@"Helvetica-Bold" size:12.0f]
#define kCustomFontSmall [UIFont systemFontOfSize:10.0f]

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Attributed Label";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (!customLabel)
    {
        customLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(25, 100, self.view.frame.size.width-kDetailLabelGap*2, 110)];
    }
    
    //this label of CustomLabel's object only shows static data
    customLabel.text = @" • I will be contracting for GeeksMobile\n"
    @" • I agree to the terms of this assignment\n"
    @" • Payment is the responsibility of Test Client\n"
    @" • I will be paid within 30 days of approval of my work\n"
    @" • I have read and agree to follow the Code of Conduct\n"
    @" • Touch me";
    [customLabel setFont:[UIFont systemFontOfSize:12] fromIndex:0 length:[customLabel.text length]];
    
    
    customLabel.delegate = self;
    customLabel.userInteractionEnabled = YES;
    customLabel.numberOfLines = 0;
    
    //set different in a the customLabel
    NSString *touchStr = @"GeeksMobile";
    NSRange range = [customLabel.text rangeOfString:touchStr];
    [customLabel setColor:[UIColor redColor] fromIndex:range.location length:range.length];
    
    
    range = [customLabel.text rangeOfString:@"30 days"];
    [customLabel setFont:kCustomFontMediumBold fromIndex:range.location length:range.length];
    touchStr = @"Code of Conduct";
    range = [customLabel.text rangeOfString:touchStr];
    [customLabel.attString addAttribute:kTouchTextAttribute value:touchStr range:range];
    [customLabel setFont:kCustomFontMediumBold fromIndex:range.location length:range.length];
    
    touchStr = @"Touch";
    range = [customLabel.text rangeOfString:touchStr];
    [customLabel.attString addAttribute:kTouchTextAttribute value:touchStr range:range];
    [customLabel setFont:[UIFont systemFontOfSize:17] fromIndex:range.location length:range.length];
    [customLabel setColor:[UIColor blueColor] fromIndex:range.location length:range.length];
    customLabel.font = kCustomFontSmall;
    [self.view addSubview:customLabel];
}

#pragma mark - CustomLabelDelegate
- (void)attributedTextView:(CustomLabel *)view touchBegin:(NSString *)text{

}
- (void)attributedTextView:(CustomLabel *)view touchEnd:(NSString *)text{
    NSLog(@"----%@-----",text);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
