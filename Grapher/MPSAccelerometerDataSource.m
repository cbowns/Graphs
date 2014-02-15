//
//  MPSAccelerometerDataSource.m
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import "MPSAccelerometerDataSource.h"

// Data to send out.
#import "MPSAccelerometerData.h"

#pragma mark - NSNotification constants
NSString * const MPSAccelerometerDataReceived = @"MPSAccelerometerDataReceived";

NSString * const MPSAccelerometerDataReceivedData = @"MPSAccelerometerDataReceivedData";


// Static singleton.

static MPSAccelerometerDataSource *_sharedInstance;

@interface MPSAccelerometerDataSource ()

@property (nonatomic, strong) NSTimer *dataCreationTimer;

@end

@implementation MPSAccelerometerDataSource

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MPSAccelerometerDataSource alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Initializers

+ (void)load
{
    [self sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Custom initialization.
        [self startDataCreation];
    }
    return self;
}

#pragma mark - Data creation

/// Starts a periodic timer to vend out @c MPSAccelerometerData objects over @c NSNotificationCenter.
- (void)startDataCreation
{
    CFTimeInterval timerInterval = 0.01; // seconds
    self.dataCreationTimer = [NSTimer timerWithTimeInterval:(timerInterval) target:self selector:@selector(generateAccelerometerData:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.dataCreationTimer forMode:NSDefaultRunLoopMode];
}

/// Generates and posts "creative" accelerometer data in an @c MPSAccelerometerDataReceived notification.
- (void)generateAccelerometerData:(NSTimer *)timer
{
    /*
     A simple way to oscillate values across [minimumX, maximumX].
     We find this useful for testing the graph.
     */
    /*
    static double minimumX = -0.75;
    static double maximumX = 0.75;
    static double simulatedX = 0.0;
    static double delta = 0.15;
    static BOOL increase = YES;
    // Oscillate across a range of values in a predictable fashion.
    // Decide if we should continue incrementing or decrementing.
    if (simulatedX >= maximumX) {
        increase = NO;
    } else if (simulatedX <= minimumX) {
        increase = YES;
    }
    if (increase) {
        simulatedX += delta;
    } else {
        simulatedX -= delta;
    }
    */

    double x = drand48();
    double y = drand48();
    double z = drand48();
    CFTimeInterval timestamp = CACurrentMediaTime();
    double magnitude = (fabs(x) + fabs(y) + fabs(z)) / 3.0;

    MPSAccelerometerData *accelerometerData = [[MPSAccelerometerData alloc] initWithAccelerometerDataWithMagnitude:magnitude timestamp:timestamp];

    [[NSNotificationCenter defaultCenter] postNotificationName:MPSAccelerometerDataReceived object:self userInfo:@{MPSAccelerometerDataReceivedData:accelerometerData}];
}


@end
