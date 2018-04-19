//
//  ViewController.m
//  Calculator
//
//  Created by Tony Hoang on 4/2/18.
//  Copyright © 2018 VisionPro. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Calculator* cal = [Calculator new];
    NSInteger p = [cal multiply:@"1"];
    
    NSLog(@"product = %luld", p);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
