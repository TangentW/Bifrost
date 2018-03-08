//
//  UIResponder+Bifrost.m
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import "UIResponder+Bifrost.h"
#import "Bifrost.h"

@implementation UIResponder (Bifrost)

- (void)_didReceive:(nonnull BifEvent *)event {
    if (![Bifrost handleEvent:event with:self]) {
        [self.nextResponder _didReceive:event];
    }
}

- (id<BifEventReceiver>)nextReceiver {
	return self.nextResponder;
}

- (void)send:(nonnull BifEvent *)event {
    [self.nextReceiver _didReceive:event];
}

@end
