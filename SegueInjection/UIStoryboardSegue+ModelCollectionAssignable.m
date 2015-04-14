#import "UIStoryboardSegue+ModelCollectionAssignable.h"
#import "UIStoryboardSegue+FindProtocol.h"
#import "ModelCollectionAssignable.h"


@implementation UIStoryboardSegue (ModelCollectionAssignable)

- (void)assignModelCollection:(ModelCollection *)modelCollection
{
    id<ModelCollectionAssignable> destination = [self destinationViewControllerConformingToProtocol:@protocol(ModelCollectionAssignable)];
    
    [destination assignModelCollection:modelCollection];
}

- (void)assignModelCollection
{
    if (NO == [self.sourceViewController conformsToProtocol:@protocol(ModelCollectionAssignable)]) {
        return;
    }
    
    id<ModelCollectionAssignable> source = self.sourceViewController;
    
    [self assignModelCollection:[source modelCollectionForAssignment]];
}

@end
