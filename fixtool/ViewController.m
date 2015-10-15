//
//  ViewController.m
//  fixtool
//
//  Created by JAPAN SHOP on 10/15/15.
//  Copyright © 2015 JAPAN SHOP. All rights reserved.
//

#import "ViewController.h"
#import "MyUtil.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *messageLabel;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Enter
{
    //NSString *message;
    MyUtil *myUtil = [[MyUtil alloc]init];
    //message = [myUtil getCacheDirPath];
    //NSMutableArray *array = [myUtil showFiles];
    
    //self.messageLabel.text = message;
    
    [myUtil changeFilePermission];
}

@end
