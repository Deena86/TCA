//
//  songdetail.m
//  TCA
//
//  Created by Deenadayal Loganathan on 11/24/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "songdetail.h"
#import <AVFoundation/AVFoundation.h>
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface songdetail ()
{
    NSDictionary *dictsonguri;
    NSDictionary *dictsongsuri;
    NSMutableArray *arrysong;
    NSString *struri;
    AVPlayer *player;
    NSString *urlstr;
    NSMutableArray *arryplayall;
   
    
}

@end

@implementation songdetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    arrysong=[self.dictsongdet objectForKey:@"Songs"];
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *playall =[[UIBarButtonItem alloc] initWithTitle:@"Playall" style:UIBarButtonItemStylePlain target:self action:@selector(playallAction)];
    UIBarButtonItem *flxblspace =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(flxblspc)];
    UIBarButtonItem *rewindButtonitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(rewindAction)];
    
    UIBarButtonItem *playBarButtonitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(playAction)];
    UIBarButtonItem *pauseBarButtonitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(pauseAction)];
    UIBarButtonItem *fastfwrdBarButtonitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(fastfwrdAction)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:playall,flxblspace,rewindButtonitem,playBarButtonitem,pauseBarButtonitem,fastfwrdBarButtonitem,flxblspace, nil];
    self.tbldtlsongvw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [arrysong count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songdetail" forIndexPath:indexPath];
    dictsonguri = [arrysong objectAtIndex:indexPath.row];
    cell.textLabel.text= [dictsonguri objectForKey:@"Title"];
    struri = [dictsonguri objectForKey:@"MusicURI"];
    NSString *combined = [NSString stringWithFormat:@"%@%@", urlstr, struri];
    NSURL *url=[NSURL URLWithString:combined];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    if (arryplayall==nil)
    {
      arryplayall =[[NSMutableArray alloc]init];
        [arryplayall addObject:playerItem];
    }
    
    
    //AVQueuePlayer *Qplyr =[[AVQueuePlayer alloc] initWithItems:arryplayall];
   // UIColor *cc = UIColorFromRGB(0x5BCAFF);
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    
    // Configure the cell...
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    urlstr=@"http://app.tamilcatholicsusa.org/";
    dictsongsuri=[arrysong objectAtIndex:indexPath.row];
    struri = [dictsongsuri objectForKey:@"MusicURI"];
    
    NSString *combined = [NSString stringWithFormat:@"%@%@", urlstr, struri];
    NSURL *url=[NSURL URLWithString:combined];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    
    //AVQueuePlayer *Qplyr =[[AVQueuePlayer alloc] initWithItems:songarry];
    
    //NSMutableArray *songarry =[[NSMutableArray alloc]initWithObjects:[AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://app.tamilcatholicsusa.org/Music/UnnaiThedi/01KADALKADANTHU.mp3"]],[AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://app.tamilcatholicsusa.org/Music/UnnaiThedi/02KARUNAIUNN.mp3"]], nil];
    
    
    
    
    
    player = [AVPlayer playerWithPlayerItem:playerItem];
    //player=[[AVQueuePlayer alloc] initWithItems:songarry];
    [player play];
    
    
   player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
   
    
}


-(void)rewindAction
{
    NSLog(@"Rewind button clicked");
}

-(void)playAction
{
    urlstr=@"http://app.tamilcatholicsusa.org/";
    NSString *combined = [NSString stringWithFormat:@"%@%@", urlstr, struri];
    NSURL *url=[NSURL URLWithString:combined];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    
    
    player = [AVPlayer playerWithPlayerItem:playerItem];
    [player play];
    
    
    player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    NSLog(@"play button clicked %@",combined);
}
-(void)pauseAction
{
    [player pause];
    NSLog(@"pause button clicked");
}
-(void)fastfwrdAction
{
    
    NSLog(@"fastforward button clicked");
}
-(void)playallAction
{
    NSMutableArray *arrplayall = [[NSMutableArray alloc]init];
    urlstr=@"http://app.tamilcatholicsusa.org/";
   
    for (int i=0; i<[arrysong count]; i++) {
        dictsongsuri=[arrysong objectAtIndex:i];
        struri = [dictsongsuri objectForKey:@"MusicURI"];
        NSString *combined = [NSString stringWithFormat:@"%@%@", urlstr, struri];
        NSURL *url=[NSURL URLWithString:combined];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        [arrplayall addObject:playerItem];
        
    }
   
    player=[[AVQueuePlayer alloc] initWithItems:arrplayall];
    [player play];
    
    
    player.actionAtItemEnd = AVPlayerActionAtItemEndAdvance;
}

@end
