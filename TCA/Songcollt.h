//
//  Songcollt.h
//  TCA
//
//  Created by Deenadayal Loganathan on 11/3/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Songcollt : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{
    int selectedindex;
    NSMutableArray *Songs;
    NSArray *song;
    NSMutableArray *arrysongs;
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menu;


@end
