//
//  VWabttca.m
//  TCA
//
//  Created by Deenadayal Loganathan on 12/3/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "VWabttca.h"
#import "SWRevealViewController.h"
@interface VWabttca ()

@end

@implementation VWabttca

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menu.target=self.revealViewController;
    self.menu.action=@selector(revealToggle:);
    [self.abttcayou loadWithVideoId:@"WzhVGdnD9go"];
   self.Abttca.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    
    NSString *abttca=@"A NJ USA based non-profit org run by Tamil Catholics living in NJ/NY/CT/PA that brings Tamil Catholics all over the world together to celebrate our religion and preserve and cherish our culture.";
    //self.lblabttca.numberOfLines = 3;
    /*self.lblabttca.lineBreakMode =NSLineBreakByWordWrapping ;
    self.lblabttca.numberOfLines = 0;
    [self.lblabttca sizeToFit];*/
   // self.Abttca.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TCAplain3d - 640x1136 - i5 a copy.png"]];
    //Calculate the expected size based on the font and linebreak mode of your label
    CGSize maximumLabelSize = CGSizeMake(296,9999);
    
    CGSize expectedLabelSize = [abttca sizeWithFont:self.lblabttca.font
                                      constrainedToSize:maximumLabelSize
                                          lineBreakMode:self.lblabttca.lineBreakMode];
    
    //adjust the label the the new height.
    CGRect newFrame = self.lblabttca.frame;
    newFrame.size.height = expectedLabelSize.height;
    self.lblabttca.frame = newFrame;
    self.lblabttca.text=abttca;
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
