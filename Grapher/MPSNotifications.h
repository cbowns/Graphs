//
//  MPSNotifications.h
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - CADisplayLink notifications

/// Posted after display link initialization.
extern NSString * const MPSDisplayLinkInitialized;

/// Posted when a display link update is imminent.
extern NSString * const MPSDisplayLinkWillUpdateScreenContents;
