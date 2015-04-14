#import <UIKit/UIKit.h>
#import "ModelAssignable.h"


@interface DetailViewController : UITableViewController <ModelAssignable>

#pragma mark - ModelAssignable

@property (nonatomic) Model *model;

@end
