//
//  MPSGraphView.h
//  Grapher
//
//  Created by Christopher Bowns on 2/14/14.
//  Copyright (c) 2014 Mechanical Pants. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPSGraphView : UIView

/// A display link, set up by our parent view controller.
@property (nonatomic, strong) CADisplayLink *displayLink;

@end
