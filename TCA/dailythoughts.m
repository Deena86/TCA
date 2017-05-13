//
//  dailythoughts.m
//  TCA
//
//  Created by Deenadayal Loganathan on 11/21/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "dailythoughts.h"
#import "ExpandingCell.h"
#import "SWRevealViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface dailythoughts ()
@property (strong,nonatomic) IBOutlet UITableView *dailytnkvw;
@end

@implementation dailythoughts{
    NSDictionary *dictthoughts;
    NSArray *arrythoughts;
    NSString *dateofday;
    NSString *message;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.dailytnkvw.delegate=self;
    self.dailytnkvw.dataSource=self;
    selectedindex=-1;
    NSString *strurl = [NSString stringWithFormat:@"http://app.tamilcatholicsusa.org/TCAService.svc/getthoughts"];
    NSURL *URL = [NSURL URLWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSError *error=nil;
    NSData *data = [NSData dataWithContentsOfURL:URL options:NSDataReadingUncached error:& error];
    if(!error)
    {
        dictthoughts =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        arrythoughts =[dictthoughts objectForKey:@"GetThoughtsResult"];
    }

    
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.dailytnkvw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    //self.dailytnkvw.rowHeight = UITableViewAutomaticDimension;
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
    return arrythoughts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    NSDictionary *arrydlythoughts= [arrythoughts objectAtIndex:indexPath.row];
    dateofday=[arrydlythoughts objectForKey:@"dateOfDay"];
    message=[arrydlythoughts objectForKey:@"message"];
    cell.dayLabel.text= dateofday;//[day objectAtIndex:indexPath.row];
    NSString *string =message;//[day objectAtIndex:indexPath.row];
    NSLog(@"%@",string);
    cell.dlythnklbl.text=message;//[dlyitem objectAtIndex:indexPath.row];
    cell.dlythnklbl.lineBreakMode=NSLineBreakByWordWrapping;//NSLineBreakByWordWrapping;//NSLineBreakByWordWrapping;
    cell.dlythnklbl.numberOfLines=0;
    cell.clipsToBounds=YES;
    
    CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    
    CGSize expectedLabelSize = [message sizeWithFont:cell.dlythnklbl.font constrainedToSize:maximumLabelSize lineBreakMode:cell.dlythnklbl.lineBreakMode];
    
    //adjust the label the the new height.
    CGRect newFrame = cell.dlythnklbl.frame;
    newFrame.size.height = expectedLabelSize.height +300;
    cell.dlythnklbl.frame = newFrame;
     //cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectedindex==indexPath.row) {
        
        NSDictionary *dict = [arrythoughts objectAtIndex:indexPath.row];
        NSString *str=[dict objectForKey:@"message"];
      
       // CGSize size = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"TAMKalyani 17.0" size:17.0f]}];
        // Values are fractional -- you should take the ceilf to get equivalent values
       // CGSize adjustedSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
        
        CGSize size = [str sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
        
        // Values are fractional -- you should take the ceilf to get equivalent values
        CGSize adjustedSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
       
        NSLog(@"%f",adjustedSize.height);
        return adjustedSize.height +200;
        
        //return 200;
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

@end
