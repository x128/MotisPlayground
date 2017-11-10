//
//  TeamListDataSource.h
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

@protocol TeamListDataSource <UITableViewDataSource, UITableViewDelegate>

- (void)queryTeamList:(void (^_Nonnull)(NSError *_Nullable))onFinish;

@end
