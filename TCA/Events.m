//
//  Events.m
//  TCA
//
//  Created by Deenadayal Loganathan on 2/4/15.
//  Copyright (c) 2015 Deena. All rights reserved.
//

#import "Events.h"
#import "SWRevealViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
static int clk;
static long totrows;
@interface Events ()
{
    NSDictionary *dictEvnts;
    NSArray *arryEvnts;
    
    NSArray *arryprog;
    
    
}
@end

@implementation Events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    //self.tblvwEvntDtl.delegate=self;
    //self.tblvwEvntDtl.dataSource=self;
    self.evntcoll.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    self.tblprogram.delegate=self;
    self.tblprogram.dataSource=self;
    
    UIButton *btnprev = [[UIButton alloc]init];
    UIImage *prves = [UIImage imageNamed:@"prevsmall.png"];
    [btnprev setBackgroundImage:prves forState:UIControlStateNormal];
    [btnprev addTarget:self action:@selector(previousAction) forControlEvents:UIControlEventTouchUpInside];
    btnprev.frame=CGRectMake(0, 0, prves.size.width, prves.size.height);
    UIButton *btnnxt = [[UIButton alloc]init];
    UIImage *nxt = [UIImage imageNamed:@"nextsmall.png"];
    [btnnxt setBackgroundImage:nxt forState:UIControlStateNormal];
    [btnnxt addTarget:self action:@selector(nxtAction) forControlEvents:UIControlEventTouchUpInside];
    btnnxt.frame=CGRectMake(0, 0, nxt.size.width, nxt.size.height);

    UIBarButtonItem *btnprevious = [[UIBarButtonItem alloc] initWithCustomView:btnprev];
  
    UIBarButtonItem *barbtnnxt = [[UIBarButtonItem alloc] initWithCustomView:btnnxt];
    //UIBarButtonItem *btnprevious =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay  target:self action:@selector(playAction)];
    //UIBarButtonItem *btnnxt =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay  target:self action:@selector(playAction)];
    
    //UIBarButtonItem *barbtnnxt = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nextsmall.png"]]];
    
   self.tblprogram.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    
    self.navigationItem.leftBarButtonItems=[[NSArray alloc] initWithObjects:self.menu,btnprevious, nil];
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:barbtnnxt, nil];
    
    NSString *strurl = [NSString stringWithFormat:@"http://app.tamilcatholicsusa.org/TCAService.svc/getevent"];
    NSURL *URL = [NSURL URLWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *error=nil;
    NSData *data = [NSData dataWithContentsOfURL:URL options:NSDataReadingUncached error:& error];
    if(!error)
    {
        dictEvnts =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        arryEvnts =[dictEvnts objectForKey:@"GetEventResult"];
    }
   // NSDictionary *dictcat= [arryEvnts objectAtIndex:1];
    NSArray *arr =[[NSArray alloc] initWithObjects:[dictEvnts valueForKeyPath:@"GetEventResult.EvntTitl"], nil];
    totrows = [arr[0] count];
    
    //dtdtl =[arydt objectAtIndex:0];
    //self.navigationItem.title=str;
    
   // self.viewDidLoad();
    
   // self.navigationItem.titleView=lbldate;
    //self.lblEvnttitl.text =[dictcat objectForKey:@"EvntTitl"];
    Events *evnt =[[Events alloc]init];
    clk=0;
    NSMutableDictionary *dtdtl=[[NSMutableDictionary alloc] init];
    dtdtl =[arryEvnts objectAtIndex:clk];
    NSArray *arrydata =[evnt populateevent:dtdtl];
    arryprog =[evnt populateprogram:dtdtl];
    self.lbltitl.text=arrydata[0];
    self.navigationItem.title=arrydata[1];
    
    self.lbldt.text=arrydata[1];;
    self.lblplac.text=arrydata[2];
    self.lbladdr.lineBreakMode=NSLineBreakByWordWrapping;
    self.lbladdr.numberOfLines=0;
    self.txtaddr.text=arrydata[3];
    self.txtaddr.backgroundColor=[UIColor clearColor];

    
   /* CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    
    CGSize expectedLabelSize = [[dtdtl valueForKeyPath:@"EvntTitl"] sizeWithFont:self.lbltitl.font constrainedToSize:maximumLabelSize lineBreakMode:self.lbltitl.lineBreakMode];
    
    //adjust the label the the new height.
    CGRect newFrame = self.lbltitl.frame;
    newFrame.size.height = expectedLabelSize.height;
    newFrame.size.width=expectedLabelSize.width;
    self.lbltitl.frame = newFrame;
    self.lbltitl.textAlignment = NSTextAlignmentCenter;*/
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
   return [arryprog count];
   
   // NSLog(@"%@",@[arryprog count] );
   
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSDictionary *dictcat= [arryprog objectAtIndex:indexPath.row];
    
    // NSInteger *test =indexPath.row;
    NSString *strprog=[NSString stringWithFormat:@"%@%@%@", [dictcat objectForKey:@"Evnttm"], @"-", [dictcat objectForKey:@"Evnt"]];
    
    cell.textLabel.text=strprog;//[dictcat objectForKey:@"Evnt"];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)nxtAction
{
    Events *evnt =[[Events alloc]init];
    if (totrows-1>clk) {
        clk=clk+1;
    }
   
    NSMutableDictionary *dtdtl=[[NSMutableDictionary alloc] init];
    dtdtl =[arryEvnts objectAtIndex:clk];
    NSLog(@"nxtaction%i",clk);
    NSArray *arrydata =[evnt populateevent:dtdtl];
    arryprog =[evnt populateprogram:dtdtl];
    self.lbltitl.text=arrydata[0];
    self.navigationItem.title=arrydata[1];
    
    self.lbldt.text=arrydata[1];;
    self.lblplac.text=arrydata[2];
    self.lbladdr.lineBreakMode=NSLineBreakByWordWrapping;
    self.lbladdr.numberOfLines=0;
    self.txtaddr.text=arrydata[3];
    self.txtaddr.backgroundColor=[UIColor clearColor];
    [self.tblprogram reloadData];

  }

-(void)previousAction
{
    Events *evnt =[[Events alloc]init];
    if ((clk!=0))
    {
        clk=clk-1;
    }
    
    NSMutableDictionary *dtdtl=[[NSMutableDictionary alloc] init];
    dtdtl =[arryEvnts objectAtIndex:clk];
    NSLog(@"nxtaction%i",clk);
    NSArray *arrydata =[evnt populateevent:dtdtl];
    arryprog =[evnt populateprogram:dtdtl];
    self.lbltitl.text=arrydata[0];
    self.navigationItem.title=arrydata[1];
    
    self.lbldt.text=arrydata[1];;
    self.lblplac.text=arrydata[2];
    self.lbladdr.lineBreakMode=NSLineBreakByWordWrapping;
    self.lbladdr.numberOfLines=0;
    self.txtaddr.text=arrydata[3];
    self.txtaddr.backgroundColor=[UIColor clearColor];
    [self.tblprogram reloadData];

}
-(NSArray *) populateevent:(NSDictionary *)data
{
    NSMutableArray *arrydata= [[NSMutableArray alloc]init];
   
    /*NSMutableDictionary *dtdtl=[[NSMutableDictionary alloc] init];
    dtdtl =[data objectAtIndex:clk];*/
    //self.navigationItem.title=arrydt[0];
    NSLog(@"%@",[data valueForKeyPath:@"Evntdate.Datedtl"]);
    NSLog(@"popevn%i",clk);
    arrydata[0]=[data valueForKeyPath:@"EvntTitl"];
    NSArray *tempdata =[[NSArray alloc]initWithObjects:[data valueForKeyPath:@"Evntdate.Datedtl"], nil];
    arrydata[1]=tempdata[0][0];
    NSArray *tempdata1 =[[NSArray alloc]initWithObjects:[data valueForKeyPath:@"Place.Place"], nil];
    arrydata[2]=tempdata1[0][0];
    NSArray *tempdata2 =[[NSArray alloc]initWithObjects:[data valueForKeyPath:@"Place.Street"], nil];
    arrydata[3]=tempdata2[0][0];
    
    
       // self.lbltitl.text=@"Deena";//[data valueForKeyPath:@"EvntTitl"];
    //self.lbldt.text=[data valueForKeyPath:@"Evntdate.Datedtl"] + [data valueForKeyPath:@"Evntdate.Tmedtl"];
    return arrydata;
    
}

    
    -(NSArray *) populateprogram:(NSDictionary *)data
    {
        NSMutableArray *arryprogram= [[NSMutableArray alloc]init];
        
       /* NSMutableDictionary *dtdtl=[[NSMutableDictionary alloc] init];
        dtdtl =[data objectAtIndex:clk];*/
        //self.navigationItem.title=arrydt[0];
       
        
        
        arryprogram=[data valueForKeyPath:@"Program"];
       
        
        
        // self.lbltitl.text=@"Deena";//[data valueForKeyPath:@"EvntTitl"];
        //self.lbldt.text=[data valueForKeyPath:@"Evntdate.Datedtl"] + [data valueForKeyPath:@"Evntdate.Tmedtl"];
        return arryprogram;
        
    }

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 25.0)];
    sectionHeaderView.backgroundColor = [UIColor blueColor];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, 0, sectionHeaderView.frame.size.width, 20.0)];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:@"Verdana" size:17.0]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [sectionHeaderView addSubview:headerLabel];
    headerLabel.text = @"Program";
    
    return sectionHeaderView;

}




@end
