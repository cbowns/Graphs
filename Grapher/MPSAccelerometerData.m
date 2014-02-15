//
//  MPSAccelerometerData.m
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import "MPSAccelerometerData.h"

@interface MPSAccelerometerData ()

/// Properties redeclared readwrite from header.
@property (nonatomic, assign, readwrite) CGFloat magnitude;
@property (nonatomic, assign, readwrite) CFTimeInterval timestamp;

@end

@implementation MPSAccelerometerData

/// Override NSObject's DI.
- (instancetype)init
{
    return [self initWithAccelerometerDataWithMagnitude:0.f timestamp:0];
}

/// Implement our custom initializer.
- (instancetype)initWithAccelerometerDataWithMagnitude:(CGFloat)magnitude timestamp:(CFTimeInterval)timestamp
{
    self = [super init];
    if (self) {
        _magnitude = magnitude;
        _timestamp = timestamp;
    }
    return self;
}

/// Description.
- (NSString *)description
{
    return [NSString stringWithFormat:@"[%.6f %.6f]", self.timestamp, self.magnitude];
}

@end
