//
//  dailythoughts.h
//  TCA
//
//  Created by Deenadayal Loganathan on 11/21/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dailythoughts : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    int selectedindex;
    NSMutableArray *day;
    NSArray *dlyitem;
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menu;

@end
