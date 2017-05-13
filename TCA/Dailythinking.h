//
//  Dailythinking.h
//  TCA
//
//  Created by Deenadayal Loganathan on 11/1/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dailythinking : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    int selectedindex;
    NSMutableArray *day;
    NSArray *dlyitem;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *menu;
@property (strong,nonatomic) NSDictionary *dictthght;
@property (strong,nonatomic) NSMutableArray *arrythgt;

@end
