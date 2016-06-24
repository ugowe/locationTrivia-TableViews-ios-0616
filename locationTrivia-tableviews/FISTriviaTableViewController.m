//
//  FISTriviaTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Ugowe on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISTrivium.h"

@interface FISTriviaTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *allTheTrivia;

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@", self.location.name);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.tableView.accessibilityLabel = @"Trivia Table";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.location.trivia.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaCell" forIndexPath:indexPath];
    

//    FISLocation *location = self.locations[indexPath.row];
//    
//    cell.textLabel.text = location.name;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)location.trivia.count];
    FISTrivium *triviaContent = self.location.trivia[indexPath.row];
    
    cell.textLabel.text = triviaContent.content;
    
    return cell;
}

@end
