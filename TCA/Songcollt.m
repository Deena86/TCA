//
//  Songcollt.m
//  TCA
//
//  Created by Deenadayal Loganathan on 11/3/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "Songcollt.h"
#import "SWRevealViewController.h"
#import "ExpandingCell.h"
#import <AVFoundation/AVFoundation.h>
#import "songdetail.h"


@interface Songcollt ()
{
    AVPlayer *player;
    NSDictionary *dictsongs;
    
    NSString *dateofday;
    NSString *message;
    NSArray *arrycatg;
    NSArray *dictcatg;
    
}
@property (strong,nonatomic) IBOutlet UITableView *songvw;
@end

@implementation Songcollt

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.songvw.dataSource=self;
    self.songvw.delegate=self;
    selectedindex=-1;
    Songs=[[NSMutableArray alloc]init];
   // Songs =[[NSMutableArray alloc] initWithObjects:@"கிறிதுமச பாடல்கள்",@"தவக்கால பாடல்கள்" ,nil];
   // song =[[NSArray alloc] initWithObjects:@"பாடல் 1",@"பாடல் 2", nil];
   
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    
   
    
    NSString *strurl = [NSString stringWithFormat:@"http://app.tamilcatholicsusa.org/TCAService.svc/getmusic"];
    NSURL *URL = [NSURL URLWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *error=nil;
    NSData *data = [NSData dataWithContentsOfURL:URL options:NSDataReadingUncached error:& error];
    if(!error)
    {
        dictsongs =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        arrysongs =[dictsongs objectForKey:@"GetMusicResult"];
        
        
    }
    
    
  
    
    
    
    //NSLog(@"%@",arrysongs);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return arrysongs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /* static NSString *cellidentifier =@"expandingCell";
   ExpandingCell *cell =(ExpandingCell *) [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil];
        cell =[nib objectAtIndex:0];
    }
    if (selectedindex==indexPath.row) {
        
    }
    else {
        
    }*/
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    //NSDictionary *arrydlythoughts= [arrysongs objectAtIndex:indexPath.row];
    /*NSArray *songs = [arrydlythoughts objectForKey:@"Songs"];
    NSDictionary *songname = [songs objectAtIndex:indexPath.row];
    NSLog(@"test%@",songname);
    
    NSString *key;
    for(key in arrydlythoughts){
        NSLog(@"Key: %@, Value %@", key, [arrydlythoughts objectForKey: key]);
    }*/
    
   /* NSMutableDictionary *galleries = [NSMutableDictionary dictionary];
    NSString *currentTitle;
    
    for (id key in arrydlythoughts) {
        NSDictionary *subDictionary = [arrydlythoughts objectForKey:key];
        NSString *type = [subDictionary objectForKey:@"type"];
      
        if ([type caseInsensitiveCompare:@"Category"]==NSOrderedSame) {
            currentTitle = [subDictionary objectForKey:@"Category"];
            if ([galleries objectForKey:currentTitle] == nil)
                [galleries setObject:[NSMutableArray array] forKey:currentTitle];
        } else if ([type caseInsensitiveCompare:@"Songs"]==NSOrderedSame && currentTitle != nil)
            [[galleries objectForKey:currentTitle] addObject:subDictionary];
    }*/
    
   /* NSMutableArray *galleries = [NSMutableArray array];
    galleries=[arrydlythoughts objectForKey:@"Songs"];*/
    
    
    
   // NSLog(@"%@",arrydlythoughts);
    /*cell.dayLabel.text=[Songs objectAtIndex:indexPath.row];
    cell.dlythnklbl.text=[song objectAtIndex:indexPath.row];
    cell.clipsToBounds=YES;*/
    NSLog(@"arrysongs %@",arrysongs);
    
   
    //arrycatg =[arrysongs objectAtIndex:0];
    
   /* arrycatg=[arrysongs objectAtIndex:indexPath.row];
   ;*/
  
  
    
    NSDictionary *dictcat= [arrysongs objectAtIndex:indexPath.row];
    
   // NSInteger *test =indexPath.row;
    
    cell.textLabel.text=[dictcat objectForKey:@"Category"];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
    
    
}


/*-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectedindex==indexPath.row) {
        return 100;
    }
    else {
        return 44;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectedindex==indexPath.row) {
        selectedindex=-1;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    if (selectedindex != -1) {
        NSIndexPath *prevpath= [NSIndexPath indexPathForRow:selectedindex inSection:0];
        selectedindex= indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:prevpath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    selectedindex =indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}*/



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"songdetail"]) {
        NSIndexPath *indexpath =nil;
        indexpath = [self.songvw indexPathForSelectedRow];
        NSDictionary *dictsongdetail= [arrysongs objectAtIndex:indexpath.row];
        [[segue destinationViewController] setDictsongdet:dictsongdetail];
        
    }
}

@end
