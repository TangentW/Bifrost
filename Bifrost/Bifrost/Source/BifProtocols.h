//
//  BifProtocols.h
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BifEvent;

#define BIFHandler(identifier) - (BOOL)BIF_##identifier:(nullable id)_bifData :(nullable BifCallback)_bifCallback
#define BIFEvent _bifData
#define BIFCallback(data) if(_bifCallback) _bifCallback(data)

typedef void (^BifCallback)(__nonnull id);

@protocol BifEventSender
- (void)send:(nonnull BifEvent *)event;
@end

@protocol BifEventReceiver
- (void)_didReceive:(nonnull BifEvent *)event;
- (id<BifEventReceiver>)nextReceiver;
@end
