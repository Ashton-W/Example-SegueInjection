#import "ListViewController.h"
#import "ModelCollection.h"
#import "Model.h"
#import "UIStoryboardSegue+ModelAssignable.m"


@interface ListViewController ()

@property (nonatomic, readwrite) ModelCollection *modelCollection;

@end


@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.modelCollection = [[ModelCollection alloc] init];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Model *selectedModel = [self.modelCollection modelAtIndex:self.tableView.indexPathForSelectedRow.row];
    [segue assignModel:selectedModel];
}

#pragma mark - ModelCollectionAssignable

- (void)assignModelCollection:(ModelCollection *)modelCollection
{
    self.modelCollection = modelCollection;
}

- (ModelCollection *)modelCollectionForAssignment
{
    return self.modelCollection;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelCollection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Model *model = [self.modelCollection modelAtIndex:indexPath.row];
    
    cell.textLabel.text = model.emoji;
    cell.detailTextLabel.text = model.name;
}

@end
