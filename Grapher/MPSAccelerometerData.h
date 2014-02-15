//
//  MPSAccelerometerData.h
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import <Foundation/Foundation.h>

/// @c MPSAccelerometerData holds accelerometer data from a device.
@interface MPSAccelerometerData : NSObject

/// The normalized magnitude of the accelerometer data.
/// Lies in the range [0.0, 1.0].
@property (nonatomic, assign, readonly) CGFloat magnitude;

/// The timestamp of this sample.
/// Timestamps
@property (nonatomic, assign, readonly) CFTimeInterval timestamp;

/// Designated initializer.
/// (You can't do much with -[init].)
- (instancetype)initWithAccelerometerDataWithMagnitude:(CGFloat)magnitude timestamp:(CFTimeInterval)timestamp;

@end
