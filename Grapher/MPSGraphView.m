//
//  MPSGraphView.m
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import "MPSGraphView.h"

// For CADisplayLink:
#import <QuartzCore/QuartzCore.h>
// For notification constants:
#import "MPSNotifications.h"
// For accelerometer data:
#import "MPSAccelerometerData.h"
#import "MPSAccelerometerDataSource.h"

@interface MPSGraphView ()

/// The initial timestamp for the display link.
@property (nonatomic) CFTimeInterval initialTimestamp;

@end

@implementation MPSGraphView

#pragma mark - Initializers

/// Called when instantiated from a nib.
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code.
        [self sharedInitialization];
    }
    return self;
}

/// Create a display link object and register for callbacks with it.
- (void)createDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkWillUpdateScreenContents:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [[NSNotificationCenter defaultCenter] postNotificationName:MPSDisplayLinkInitialized object:self.displayLink];
}

/// Called during/after initialization.
- (void)sharedInitialization
{
    [self createDisplayLink];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accelerometerDataSourceDidReceiveData:) name:MPSAccelerometerDataReceived object:nil];
}

- (void)dealloc
{
    // Remove our display link observer.
    [self.displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [self.displayLink invalidate];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(context, 0.0f, 0.0f);

    double timeInterval = self.displayLink.timestamp-self.initialTimestamp;
    CGContextAddLineToPoint(context, timeInterval*10, timeInterval*10);

    CGContextDrawPath(context, kCGPathStroke);
}

#pragma mark - NSNotification and other callbacks:

- (void)accelerometerDataSourceDidReceiveData:(NSNotification *)note
{
    MPSAccelerometerData *accelerometerData = [[note userInfo] objectForKey:MPSAccelerometerDataReceivedData];

    // NSLog(@"[%.6f %.6f]", accelerometerData.timestamp - self.initialTimestamp, accelerometerData.magnitude);
}

#pragma mark Display link updates:

/// Post a @c MPSDisplayLinkWillUpdateScreenContents notification when receiving a display link update callback.
- (void)displayLinkWillUpdateScreenContents:(CADisplayLink *)displayLink
{
    // It would be strange for this to be a different display link, but just in case.
    if (displayLink == self.displayLink) {
        if(self.initialTimestamp == 0.0) {
            self.initialTimestamp = [self.displayLink timestamp];
        }
        [self setNeedsDisplay];
    }
}

@end

