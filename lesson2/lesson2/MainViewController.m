//
//  MainViewController.m
//  lesson2
//
//  Created by 5vi5t on 16.10.2020.
//

#import "MainViewController.h"
#import "TableViewController.h"
#import "CustomTableViewCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.title = @"Table as object";
  
  UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"TableVC" style:UIBarButtonItemStylePlain target:self action:@selector(showTableVC)];
  
  [self.navigationItem setRightBarButtonItem:item];

  UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  tableView.dataSource = self;
  [self.view addSubview:tableView];
  self.tableView = tableView;

}

- (void)showTableVC {
  TableViewController *vc = [[TableViewController alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

// MARK: - TableViewDataSource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
  CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
  if (!cell) {
    cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
  }
  
  cell.leftLabel.text = @"Left Title";
  cell.rightLabel.text = @"Right Title";
  
  
  return cell;
}

@end
