//
//  BifEvent.m
//  Bifrost
//
//  Created by Tangent on 08/03/2018.
//  Copyright © 2018 Tangent. All rights reserved.
//

#import "BifEvent.h"

@interface BifEvent ()
@property(nonatomic, copy, nonnull) NSString *identifier;
@property(nonatomic, strong, nullable) id data;
@property(nonatomic, copy, nullable) BifCallback callback;
@end

@implementation BifEvent

- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier {
    return [self initWithIdentifier:identifier data:nil];
}

- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier data:(nullable id)data {
    return [self initWithIdentifier:identifier data:data callback:nil];
}

- (nonnull instancetype)initWithIdentifier:(nonnull NSString *)identifier data:(nullable id)data callback:(nullable BifCallback)callback {
    if (self = [super init]) {
        self.identifier = identifier;
        self.data = data;
        self.callback = callback;
    }
    return self;
}

@end
