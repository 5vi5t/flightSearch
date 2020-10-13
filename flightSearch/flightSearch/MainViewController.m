//
//  MainViewController.m
//  flightSearch
//
//  Created by 5vi5t on 13.10.2020.
//

#import "MainViewController.h"
#import "AnotherViewController.h"
#import "DataManager.h"

@interface MainViewController ()

@property (nonatomic, weak) UILabel *textLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Main Screen";
  
  UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"AnotherVC"
                                                           style:UIBarButtonItemStylePlain
                                                          target:self
                                                          action:@selector(showAnotherVC)];
  
  [self.navigationItem setRightBarButtonItem:item];
  
//  [self createControls];
  
  [[DataManager sharedInstance] loadData];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCompleteDataLoad:) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  
  self.textLabel.frame = CGRectMake(20.0, 20.0, self.textLabel.superview.bounds.size.width - 40.0, 30.0);
}

- (void)showAnotherVC {
  AnotherViewController *vc = [[AnotherViewController alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

- (void)didCompleteDataLoad:(NSNotification *)notification {
  self.view.backgroundColor = [UIColor brownColor];
}

- (void)createControls {
  
  CGRect viewFrame = CGRectMake(40.0, 40.0 + 64.0, self.view.bounds.size.width - 80.0, self.view.bounds.size.height - 80.0 - 64.0);
  UIView *greenView = [[UIView alloc] initWithFrame:viewFrame];
  greenView.backgroundColor = [UIColor greenColor];
  greenView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:greenView];
  
  CGRect textFrame = CGRectMake(20.0, 20.0, greenView.bounds.size.width - 40.0, 30.0);
  UILabel *textLabel = [[UILabel alloc] initWithFrame:textFrame];
  textLabel.textColor = [UIColor darkTextColor];
  textLabel.textAlignment = NSTextAlignmentCenter;
  textLabel.text = @"Homework";
  textLabel.backgroundColor = [UIColor blueColor];
  textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [greenView addSubview:textLabel];
  self.textLabel = textLabel;
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:@"Touch me!" forState:UIControlStateNormal];
  [button setTitle:@"Touching..." forState:UIControlStateHighlighted];
  [button setTitle:@"Touched." forState:UIControlStateSelected];
  [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
  button.backgroundColor = [UIColor lightGrayColor];
  button.frame = CGRectMake(0.0, 0.0, 100.0, 44.0);
  button.center = CGPointMake(greenView.bounds.size.width / 2.0, greenView.bounds.size.height / 2.0);
  [greenView addSubview:button];
}

- (void)buttonTap:(UIButton *)sender {
  sender.superview.backgroundColor = [UIColor brownColor];
  sender.selected = YES;
}

@end
