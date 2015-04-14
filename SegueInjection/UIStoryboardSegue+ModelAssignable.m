#import "UIStoryboardSegue+ModelAssignable.h"
#import "UIStoryboardSegue+FindProtocol.h"
#import "ModelAssignable.h"


@implementation UIStoryboardSegue (ModelAssignable)

- (void)assignModel:(Model *)model
{
    id<ModelAssignable> destination = [self destinationViewControllerConformingToProtocol:@protocol(ModelAssignable)];
    
    destination.model = model;
}

- (void)assignModel
{
    if (NO == [self.sourceViewController conformsToProtocol:@protocol(ModelAssignable)]) {
        return;
    }
    
    id<ModelAssignable> source = self.sourceViewController;
    
    [self assignModel:source.model];
}

@end
