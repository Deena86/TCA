//
//  YoutubeVw.m
//  TCA
//
//  Created by Deenadayal Loganathan on 11/9/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "YoutubeVw.h"
#import "SWRevealViewController.h"

@interface YoutubeVw ()

@end

@implementation YoutubeVw


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.playerView  loadWithVideoId:@"M7lc1UVf-VE"];
    
    //[self.playerView  loadWithVideoId:@"PLu66J2RUOHqYcu3A6d6RPUDw5MCZic1I8"];
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    
    [self.playerView loadWithPlaylistId:@"PLu66J2RUOHqYcu3A6d6RPUDw5MCZic1I8"];
    self.playerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    self.youtubevw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
