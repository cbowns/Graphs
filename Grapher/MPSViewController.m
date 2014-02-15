//
//  MPSViewController.m
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import "MPSViewController.h"

// QuartzCore for a CADisplayLink.
#import <QuartzCore/QuartzCore.h>

// Notification declarations.
#import "MPSNotifications.h"

// Accelerometer data.
#import "MPSAccelerometerData.h"
#import "MPSAccelerometerDataSource.h"

// Graph view.
#import "MPSGraphView.h"

@interface MPSViewController ()

/// A display link object for synchronizing rendering.
@property (nonatomic, strong) CADisplayLink *displayLink;

/// An @c MPSGraphView that'll draw data.
/// Created in the storyboard.
@property (nonatomic, weak) IBOutlet MPSGraphView *graphView;

@end

@implementation MPSViewController

#pragma mark - Initializers

- (id)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        // Custom initialization goes here
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
