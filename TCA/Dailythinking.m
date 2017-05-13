
//
//  Dailythinking.m
//  TCA
//
//  Created by Deenadayal Loganathan on 11/1/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "Dailythinking.h"
#import "ExpandingCell.h"
#import "SWRevealViewController.h"


@interface Dailythinking ()
@property (strong,nonatomic) IBOutlet UITableView *dailytnkvw;


@end

@implementation Dailythinking

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.dailytnkvw.delegate=self;
    self.dailytnkvw.dataSource=self;
    selectedindex=-1;
    /*AFHTTPRequestOperationManager *manger =[[AFHTTPRequestOperationManager alloc]init];
    [manger GET:@"http://app.tamilcatholicsusa.org/TCAService.svc/getthoughts" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"test");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"test");
    }];*/
    
    
    
    
    
    
    
 NSLocale *en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    assert(en_US_POSIX != nil);
        day = [[NSMutableArray alloc]init];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:en_US_POSIX];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
  
    
   /* [dateFormat setDateFormat:@"MMMM d yyyy"];
    NSString *theDate = [dateFormat stringFromDate:dateFromString];*/
    
   
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *dateFromString = [[NSDate alloc] init];
    NSString *testdate =@"11-11-2014";
    // Do any additional setup after loading the view.
    for (int ii=1; ii<9; ii++) {
        
        NSTimeInterval secondsPerDay = 24 * 60 * 60;
        NSString *string;
        NSString *theDate = [dateFormat stringFromDate:dateFromString];
        string =[[NSString alloc]initWithFormat:@"%@",theDate];
        [day addObject:string];
        dateFromString =[dateFromString dateByAddingTimeInterval:secondsPerDay];
    }
    dlyitem = [[NSArray alloc] initWithObjects:@"என்மீது அன்பு கொண்டுள்ளவர் நான் சொல்வதைக் கடைப்பிடிப்பார்",@"ஏளறனட",@"மதநய",@"றனட",@"உஇஅ",@"பமத",@"ண்டன",@"ஙலர",@"எகப", nil];
    self.dailytnkvw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return day.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier =@"expandingCell";
    ExpandingCell *cell =(ExpandingCell *) [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        NSArray *nib =[[NSBundle mainBundle] loadNibNamed:@"ExpandingCell" owner:self options:nil];
        cell =[nib objectAtIndex:0];
       
        
    }
    if (selectedindex==indexPath.row) {
        
    }
    else {
        
    }
    /*self.dictday= [self.arrythgt objectAtIndex:indexPath.row];
    NSString *day=[self.dictday objectForKey:@"dateOfDay"];
    NSString *think=[self.dictday objectForKey:@"message"];*/
    
    
    cell.dayLabel.text=[day objectAtIndex:indexPath.row];
    cell.dlythnklbl.text=[dlyitem objectAtIndex:indexPath.row];
    cell.dlythnklbl.lineBreakMode=NSLineBreakByWordWrapping;
    cell.dlythnklbl.numberOfLines=0;
    cell.clipsToBounds=YES;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*static ExpandingCell *sizingCell;
    static dispatch_once_t onceToken;
    // 1
    dispatch_once(&onceToken, ^{
        sizingCell = [[ExpandingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"expandingCell"];
    });
    
    // 2
    ModelObject *mo = day[indexPath.row];
    
    // 3
    CGFloat (^calcCellHeight)(ExpandingCell *, NSString *) = ^ CGFloat(MyTableViewCell *sizingCell, NSString *labelText){
        
        sizingCell.d
        
        .customLabel.text = labelText;
        
        return [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    };
    
    NSUInteger ix = indexPath.row;
    
    // 4
    if ([self.cachedHeights[ix] isEqual:[NSNull null]]){
        
        CGFloat cellHeight = calcCellHeight(sizingCell, mo.customStringProperty);
        
        self.cachedHeights[ix] = @(cellHeight);
    }
    
    // 5
    return ([self.cachedHeights[ix] floatValue] < MyMinimumCellHeight) ? MyMinimumCellHeight : [self.cachedHeights[ix] floatValue];*/
   if (selectedindex==indexPath.row) {
        return 300;
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
        selectedindex = indexPath.row;
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:prevpath] withRowAnimation:UITableViewRowAnimationFade];
                                
    }
    selectedindex = indexPath.row;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

/*- (void)methodToFetchListOfData {
    
    [self.cachedHeights removeAllObjects];
    
    for (int i = 0; i < day.count; i++) {
        [self.cachedHeights addObject:[NSNull null]];
    }
    
    [self.dailytnkvw reloadData];
}*/







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
