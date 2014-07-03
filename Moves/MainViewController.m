//
//  MainViewController.m
//  Moves
//
//  Created by Billy Roh on 7/3/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "MainViewController.h"
#import "DayViewController.h"

@interface MainViewController ()
    @property (nonatomic, strong) NSArray *viewArray;
    @property (nonatomic, strong) UIPageViewController *pageViewController;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // PageViewController setup
        self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        self.pageViewController.view.frame = CGRectMake(0, 0, 320, 568);
        self.pageViewController.dataSource = self;
        
        // Data setup
        DayViewController *today = [[DayViewController alloc] init];
        today.date = @"Today";
        
        DayViewController *yesterday = [[DayViewController alloc] init];
        yesterday.date = @"Yesterday";
        
        DayViewController *sunday = [[DayViewController alloc] init];
        sunday.date = @"Sunday";
        
        DayViewController *monday = [[DayViewController alloc] init];
        monday.date = @"Monday";
        
        DayViewController *tuesday = [[DayViewController alloc] init];
        tuesday.date = @"Tuesday";
        
        self.viewArray = @[sunday, monday, tuesday, yesterday, today];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.pageViewController.view];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIViewController *viewController = self.viewArray[self.viewArray.count - 1];
    [self.pageViewController setViewControllers:@[viewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    int index = [self.viewArray indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.viewArray[index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    int index = [self.viewArray indexOfObject:viewController];
    if (index == (self.viewArray.count - 1)) {
        return nil;
    }
    return self.viewArray[index + 1];
}

@end
