//
//  ViewController.m
//  FanzhuanView
//
//  Created by Mac on 14-3-7.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *parentView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 320, 200)];
    parentView.backgroundColor = [UIColor yellowColor];
    parentView.tag = 1000;
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    image1.backgroundColor = [UIColor redColor];
    image1.tag = 1001;
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    image2.backgroundColor = [UIColor blueColor];
    image2.tag = 1002;
    
    [parentView addSubview:image1];
    [parentView addSubview:image2];
    
    [self.view addSubview:parentView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)ActionFanzhuan:(id)sender
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    
    UIView *parentView = [self.view viewWithTag:1000];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:parentView cache:YES];
    
    NSInteger purple = [[parentView subviews]indexOfObject:[parentView viewWithTag:1002]];
    NSInteger maroon = [[parentView subviews]indexOfObject:[parentView viewWithTag:1001]];
    
    [parentView exchangeSubviewAtIndex:purple withSubviewAtIndex:maroon];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    
    [UIView commitAnimations];
}

- (void)animationFinished:(id)sender
{
    NSLog(@"animationFinished!");
}
@end
