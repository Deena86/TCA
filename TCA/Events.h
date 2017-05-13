//
//  Events.h
//  TCA
//
//  Created by Deenadayal Loganathan on 2/4/15.
//  Copyright (c) 2015 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Events : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menu;
@property (strong, nonatomic) IBOutlet UIView *evntcoll;
@property (weak, nonatomic) IBOutlet UILabel *lbltitl;
@property (weak, nonatomic) IBOutlet UILabel *lbldt;
@property (weak, nonatomic) IBOutlet UILabel *lblplac;
@property (weak, nonatomic) IBOutlet UILabel *lbladdr;
-(NSArray *)populateevent:(NSDictionary *) data;
@property (weak, nonatomic) IBOutlet UITextView *txtaddr;
@property (weak, nonatomic) IBOutlet UITableView *tblprogram;


@end
