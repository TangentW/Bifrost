//
//  UIControl+Bifrost.h
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BifProtocols.h"
@class BifEvent;

typedef BifEvent *(^EventMapper) (void);

@interface UIControl (Bifrost)

- (void)postEvents:(UIControlEvents)events mapper:(EventMapper)mapper;
- (void)postEvents:(UIControlEvents)events identifier:(NSString *)identifier;
- (void)postEvents:(UIControlEvents)events identifier:(NSString *)identifier callback:(BifCallback)callback;

@end

@interface _UIControlTarget : NSObject
- (instancetype)initWithCallback:(void (^)(void))callback;
- (void)exec;
@end
