//
//  TeamListDataSourceImpl.h
//  MotisPlayground
//
//  Created by Dmitry on 09/11/2017.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamListDataSource.h"
#import "Networking.h"

@interface TeamListDataSourceImpl : NSObject<TeamListDataSource> {
@protected
    Networking *m_networking;
}

@end
