//
//  DayViewController.m
//  Moves
//
//  Created by Billy Roh on 7/3/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "DayViewController.h"

@interface DayViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
    
@end

@implementation DayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.backgroundImage.image = [UIImage imageNamed:self.date];
    [self.backgroundImage sizeToFit];
    self.scrollView.contentSize = CGSizeMake(320, [UIImage imageNamed:self.date].size.height + 40);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
