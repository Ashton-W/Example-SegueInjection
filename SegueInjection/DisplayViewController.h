#import <UIKit/UIKit.h>
#import "ModelAssignable.h"


@interface DisplayViewController : UIViewController <ModelAssignable>

#pragma mark - ModelAssignable

@property (nonatomic) Model *model;

@end
