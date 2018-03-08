//
//  BifEvent.h
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BifProtocols.h"

@interface BifEvent : NSObject

@property(nonatomic, copy, readonly, nonnull) NSString *identifier;
@property(nonatomic, strong, readonly, nullable) id data;
@property(nonatomic, copy, readonly, nullable) BifCallback callback;

- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier;
- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier data:(nullable id)data;
- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier data:(nullable id)data callback:(nullable BifCallback)callback;

@end
