#import <UIKit/UIKit.h>
#import "ModelCollectionAssignable.h"

@class ModelCollection;


@interface ListViewController : UITableViewController <ModelCollectionAssignable>

@property (nonatomic, readonly) ModelCollection *modelCollection;

@end
