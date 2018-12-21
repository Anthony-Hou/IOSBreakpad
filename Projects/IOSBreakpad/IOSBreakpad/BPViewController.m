//
//  BPViewController.m
//  IOSBreakpad
//
//  Created by Juan Cruz Ghigliani on 03/06/14.
//  Copyright (c) 2014 Juan Cruz Ghigliani. All rights reserved.
//

#import "BPViewController.h"

@interface BPViewController ()
- (IBAction)tapCrash:(id)sender;
@end

@implementation BPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapCrash:(id)sender {
    
    NSArray* array = @[];
    
    [array objectAtIndex:666];
}
@end
