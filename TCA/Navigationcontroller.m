//
//  Navigationcontroller.m
//  TCA
//
//  Created by Deenadayal Loganathan on 10/24/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "Navigationcontroller.h"
#import "SWRevealViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface Navigationcontroller ()

@end

@implementation Navigationcontroller{
    NSArray *menu;
    NSArray *menu1;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    menu= @[@"first",@"second",@"third",@"nine",@"eight"];
    menu1 =@[@"four",@"five",@"six"];
    
    self.tableView.backgroundColor=UIColorFromRGB(0xD1EEFC);
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return [menu count];
            break;
            
        case 1:
            return [menu1 count];
            break;
            
        default:
            return 3;
            break;
    }
    
    
    
    //return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellidentifier;
    switch (indexPath.section) {
        case 0:
          cellidentifier=   [menu objectAtIndex:indexPath.row];
            break;
        case 1:
           cellidentifier = [menu1 objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    //cell.textLabel.font= [UIFont fontWithName:@"TAMKadambri Regular 16.0" size:12.0f];
    
    
    // Configure the cell...
    [cell setBackgroundColor:[UIColor clearColor]];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 100.0)];
    sectionHeaderView.backgroundColor = [UIColor whiteColor];//UIColorFromRGB(0xFFC2BB);
    
    
    UILabel *headerLabel = [[UILabel alloc]initWithFrame: CGRectMake(-30, -5, sectionHeaderView.frame.size.width, 25.0)];
   UIImageView *image = [[UIImageView alloc]initWithFrame: CGRectMake(30, 0, 20, 20)];
   image.image =[UIImage imageNamed:@"TCA Logo.jpg"];
                          
                          //initWithImage:[UIImage imageNamed:@"photo.png"]];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    [headerLabel setFont:[UIFont fontWithName:@"System Bold 16.0" size:20.0]];
    [sectionHeaderView addSubview:image];
    [sectionHeaderView addSubview:headerLabel];
    
    
    switch (section) {
        case 0:
            headerLabel.text = @"அருளோசை";
            
           
            return sectionHeaderView;
            break;
        case 1:
            headerLabel.text = @"சமூக ஊடகங்கள்";
            return sectionHeaderView;
            break;
       
        default:
            break;
    }
    
    return sectionHeaderView;
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0 && indexPath.section==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/tamil.catholics"]];
    }
    else if (indexPath.row==1 && indexPath.section==1)
    {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tamilcatholicsusa.podbean.com"]];
    }
    else if (indexPath.row==2 && indexPath.section==1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.youtube.com/channel/UChDwJfjK78V8XDRU37B-Q6A"]];
    }
    else if (indexPath.row==3 && indexPath.section==1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/tcausatweets"]];
    }

    
}





@end
