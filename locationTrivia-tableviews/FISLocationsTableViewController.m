//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Ugowe on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTextLabel;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.tableView.accessibilityLabel = @"Locations Table";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.locations.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    
    /* My main issue was figuring out how to connect an instance of FISLocation to the NSArray *locations property that we declared in the header file.
     
        I thought i had to create a for loop to iterate through each item in the locations array, not realizing that this tableView method automatically iterated through each item for me.
     
        Also, I'm not supposed to include the entire array into an instance of FISLocation; I'm only supposed to include one object in the array at a time, that position of that object is determined by the current row of the indexPath
     
     So, first I'm supposed to create an instance of FISLocation and assign it to a particular item within my *locations array determined by indexPath.row. Every time indexPath.row increments, so too does the position of what is selected in the *locations array.
     */
    FISLocation *location = self.locations[indexPath.row];
        
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)location.trivia.count];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    FISTriviaTableViewController *triviaDetail = (FISTriviaTableViewController *)[segue destinationViewController];
    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];

    //make a new FISLocation variable by grabbing it out of self.locations (using indexPath.row)
    
    FISLocation *selectedLocation = self.locations[self.tableView.indexPathForSelectedRow.row];
//    NSLog(@"%@", location.name);
    
    triviaDetail.location = selectedLocation;
    
    //pass that FISLocation  to triviaDetail
    
    
    
    
//    triviaDetail.triviaText = cell.textLabel.text;
    
    
}

@end



