//
//  TeamListDataSourceImpl.m
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "TeamListDataSourceImpl.h"
#import "TeamListModel.h"
#import "ApiUrlFactory.h"
#import "TeamListCell.h"

@implementation TeamListDataSourceImpl {
    TeamList *m_teamList;
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        m_networking = [Networking sharedInstance];
    }
    return self;
}

- (void)queryTeamList:(void (^)(NSError *))onFinish {
    NSString *url = [ApiUrlFactory teamJsonUrl];
    [m_networking query:url
              onSuccess:^(NSURLSessionDataTask *task, NSDictionary *dict) {
                  m_teamList = [[TeamList alloc] initWithDict:dict];
                  dispatch_async(dispatch_get_main_queue(), ^{
                      onFinish(nil);
                  });
              }
              onFailure:^(NSURLSessionDataTask *task, NSError *error) {
                  dispatch_async(dispatch_get_main_queue(), ^{
                      onFinish(error);
                  });
              }];
}

- (TeamMember *)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= m_teamList.team.count)
        return nil;
    
    return m_teamList.team[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return m_teamList.team.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"TeamListCell";
    TeamListCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];

    if (cell == nil)
        cell = [[TeamListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    
    TeamMember *item = [self itemAtIndexPath:indexPath];
    cell.name.text = item.name;
    cell.address.text = item.address;
    cell.phones.text = item.phonesString;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamMember *item = [self itemAtIndexPath:indexPath];
    CGFloat height = [TeamListCell heightForItem:item cellWidth:tableView.frame.size.width];
    return height;
}

@end
