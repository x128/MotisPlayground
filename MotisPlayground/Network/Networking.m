//
//  Networking.m
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "Networking.h"
#import <AFNetworking/AFNetworking.h>
#import "Settings.h"

@implementation Networking {
    AFHTTPSessionManager *m_httpSessionManager;
}

+ (Networking *)sharedInstance {
    static Networking *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Networking alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = HTTP_TIMEOUT;
        config.timeoutIntervalForResource = HTTP_TIMEOUT;
        config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        m_httpSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        m_httpSessionManager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    }
    return self;
}

#pragma mark AFHTTPSessionManager proxy

- (NSURLSessionDataTask *)query:(NSString *)url
                      onSuccess:(QuerySuccess)success
                      onFailure:(QueryFailure)failure {
    QuerySuccess onSuccess = ^(NSURLSessionDataTask *task, NSDictionary *_Nullable obj) {
        if (LOG_HTTP_RESPONSE)
            NSLog(@"%@ → %@", url, obj);
        if (success)
            success(task, obj);
    };

    QueryFailure onFailure = failure;
    
    NSURLSessionDataTask *task = [m_httpSessionManager GET:url
                                                parameters:nil
                                                  progress:nil
                                                   success:onSuccess
                                                   failure:onFailure];
    return task;
}

@end
