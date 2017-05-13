//
//  YoutubeVw.h
//  TCA
//
//  Created by Deenadayal Loganathan on 11/9/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
@interface YoutubeVw : UIViewController
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@property (strong, nonatomic) IBOutlet UIView *youtubevw;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *menu;

@end
