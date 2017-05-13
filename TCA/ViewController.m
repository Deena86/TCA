//
//  ViewController.m
//  TCA
//
//  Created by Deenadayal Loganathan on 10/24/14.
//  Copyright (c) 2014 Deena. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "Commonclass.h"
#import <sys/sysctl.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
   // UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@" LaunchIcon - 354X649.png"]];
    // Do any additional setup after loading the view, typically from a nib.
   self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@" LaunchIcon - 354X649.png"]];
    if ([[self platformType:platform] isEqual:@"iPhone 5 (GSM+CDMA)"] || [[self platformType:platform] isEqual:@"iPhone 5c (GSM)"] || [[self platformType:platform] isEqual:@"iPhone 5c (GSM+CDMA)"] || [[self platformType:platform] isEqual:@"iPhone 5s (GSM)"] || [[self platformType:platform] isEqual:@"iPhone 5s (GSM+CDMA)"] )
    {
         UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@" LaunchIcon - 354X649.png"]];
    }
    else if ([[self platformType:platform] isEqual:@"iPhone 6"] || [[self platformType:platform] isEqual:@"iPhone 6 Plus"])
    {
       UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Backgroundi6.png"]];
    }
    //UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@" LaunchIcon - 354X649.png"]];
   // backgroundView.contentMode=UIViewContentModeScaleToFill; //UIViewContentModeScaleAspectFit;
    //[self.view addSubview:backgroundView];
    
    
    _menu.target=self.revealViewController;
    _menu.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        //Commonclass *plt =[[Commonclass alloc] init];
    
    NSLog(@"iPhone Device%@",[self platformType:platform]);
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) platformType:(NSString *)platform
{
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2G (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2G (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}


@end