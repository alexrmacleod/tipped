//
//  Fashun.h
//  Fashun
//
//  Created by Alex Macleod on 23/10/14.
//  Copyright (c) 2014 Alex Macleod. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface CustomObject : NSObject

@property (strong, nonatomic) id someProperty;
@property (nonatomic) NSString *accessToken;
@property (nonatomic) NSDictionary *photo;


- (void) clientId;
- (void) authorize;
- (NSDictionary *) simpleAuth;

@end

#ifndef Fashun_Fashun_h
#define Fashun_Fashun_h


#endif
