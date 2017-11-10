//
//  Networking.h
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^QuerySuccess)(NSURLSessionDataTask *, NSDictionary *);
typedef void (^QueryFailure)(NSURLSessionDataTask *, NSError *);

@interface Networking : NSObject

+ (Networking *)sharedInstance;

- (NSURLSessionDataTask *)query:(NSString *)url
                      onSuccess:(QuerySuccess)success
                      onFailure:(QueryFailure)failure;

@end
