//
//  Bifrost.h
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BifEvent;

@interface Bifrost : NSObject

+ (BOOL)handleEvent:(nonnull BifEvent *)event with:(nonnull id)obj;

@end
