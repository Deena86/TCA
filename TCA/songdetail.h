//
//  songdetail.h
//  TCA
//
//  Created by Deenadayal Loganathan on 11/24/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface songdetail : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSDictionary *dictsongdet;
@property (strong, nonatomic) IBOutlet UITableView *tbldtlsongvw;


@end
