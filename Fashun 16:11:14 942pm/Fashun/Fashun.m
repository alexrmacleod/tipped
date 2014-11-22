//
//  Fashun.m
//  Fashun
//
//  Created by Alex Macleod on 23/10/14.
//  Copyright (c) 2014 Alex Macleod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fashun.h"
#import <SimpleAuth/SimpleAuth.h>

@implementation CustomObject : NSObject

- (void) clientId {
    SimpleAuth.configuration[@"instagram"] = @{
                                               @"client_id" : @"c2711e80304e42f480c6ed43c11963a8",
                                               SimpleAuthRedirectURIKey : @"fashun://auth/instagram"
                                               };
}

- (void) authorize {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        self.accessToken = [userDefaults objectForKey:@"accessToken"];
//        NSLog(@"accessToken: %@", self.accessToken);

    if (self.accessToken == nil) {
    
            [SimpleAuth authorize:@"instagram" completion:^(NSDictionary *responseObject, NSError *error) {
            
            NSString *accessToken = responseObject[@"credentials"][@"token"];
            [userDefaults setObject:accessToken forKey:@"accessToken"];
            [userDefaults synchronize];
            }];
                } else {
//                    NSURLSession *session = [NSURLSession sharedSession];
//                    NSString *urlString = [[NSString alloc] initWithFormat:@"https://api.instagram.com/v1/tags/snow/media/recent?access_token=%@", self.accessToken];
//                    NSURL *url = [[NSURL alloc] initWithString:urlString];
//                    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//                    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
//                        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
//                        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//                        NSArray *photos = [responseDictionary valueForKeyPath:@"data.images.standard_resolution.url"];
//                        NSLog(@"photos: %@", photos);
//
//                    }];
//                    [task resume];
                }
}

- (NSDictionary *) simpleAuth {

    [SimpleAuth authorize:@"instagram" completion:^(NSDictionary *responseObject, NSError *error) {
        NSLog(@"response Object: %@", responseObject);

    }];

    return nil;
}


@end