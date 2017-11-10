//
//  TeamListViewController.m
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "TeamListViewController.h"
#import "TeamListDataSource.h"
#import "TeamListCell.h"
#import "SyntaxSugar.h"

@implementation TeamListViewController {
    UITableView *m_tableView;
    UILabel *m_errorLabel;
    UIBarButtonItem *m_refreshButton;
    UIActivityIndicatorView *m_loadingIndicator;
}

#pragma mark - Constructors

- (instancetype)initWithDataSource:(id<TeamListDataSource>)dataSource {
    self = [super init];
    if (self != nil) {
        m_dataSource = dataSource;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    NSAssert(false, @"Use initWithDataSource, or switch to Swift and make this initializer private");
    return nil;
}

- (instancetype)init {
    NSAssert(false, @"Use initWithDataSource, or switch to Swift and make this initializer private");
    return nil;
}

#pragma mark - Creation

- (void)loadView {
    UIView *contentView = [[UIView alloc] init];
    [super setView:contentView];
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"The Team";
    
    [self createTable];
    [self createInfoLabel];
    [self createLoadingIndicator];
    [self createRefreshButton];
    
    [self refresh];
}

- (void)createTable {
    m_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    m_tableView.dataSource = m_dataSource;
    m_tableView.delegate = m_dataSource;
    [m_tableView registerClass:[TeamListCell class] forCellReuseIdentifier:@"TeamListCell"];
    [self.view addSubview:m_tableView];

    [m_tableView dontShowSeparatorsWithoutCells];
    m_tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [m_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [m_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [m_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [m_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

- (void)createInfoLabel {
    m_errorLabel = [[UILabel alloc] initWithFrame:self.view.frame];
    m_errorLabel.numberOfLines = 0;
    m_errorLabel.textAlignment = NSTextAlignmentCenter;
    m_errorLabel.textColor = [UIColor grayColor];
    [self.view addSubview:m_errorLabel];
    
    m_errorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [m_errorLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [m_errorLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [m_errorLabel.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor multiplier:0.8].active = YES;
}

- (void)createRefreshButton {
    m_refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                    target:self
                                                                    action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = m_refreshButton;
}

- (void)createLoadingIndicator {
    m_loadingIndicator = [[UIActivityIndicatorView alloc] init];
    m_loadingIndicator.hidesWhenStopped = YES;
    m_loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:m_loadingIndicator];
    
    m_loadingIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    [m_loadingIndicator.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [m_loadingIndicator.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

#pragma mark - Life cycle

- (void)refresh {
    self.state = DisplayStateLoading;
    [m_dataSource queryTeamList:^(NSError *_Nullable error) {
        if (error == nil) {
            self.state = DisplayStateOk;
        } else {
            m_errorLabel.text = error.localizedDescription;
            self.state = DisplayStateError;
        }
        [m_tableView reloadData];
    }];
}

- (void)setState:(DisplayState)state {
    [super setState:state];
    
    [m_refreshButton setEnabled:state != DisplayStateLoading];
    [m_tableView setShown:state == DisplayStateOk];
    [m_loadingIndicator setShown:state == DisplayStateLoading];
    [m_errorLabel setShown:state == DisplayStateError];
    if (state == DisplayStateLoading) {
        [m_loadingIndicator startAnimating];
    } else {
        [m_loadingIndicator stopAnimating];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // I have never used this.
}

@end
