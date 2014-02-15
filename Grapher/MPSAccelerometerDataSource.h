//
//  MPSAccelerometerDataSource.h
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - Notification constants and keys:

#pragma mark Notification names:

/// An @c NSNotification name for sending new generated data.
extern NSString * const MPSAccelerometerDataReceived;

#pragma mark Keys:

/// A key in the notification's @c userInfo dictionary.
/// Contains an instance of @c MPSAccelerometerData.
extern NSString * const MPSAccelerometerDataReceivedData;


@interface MPSAccelerometerDataSource : NSObject

/// Returns the app-wide instance of @c MPSAccelerometerDataSource.
+ (instancetype)sharedInstance;

@end
