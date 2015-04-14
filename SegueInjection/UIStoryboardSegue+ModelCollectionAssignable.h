#import <UIKit/UIKit.h>

@class ModelCollection;


@interface UIStoryboardSegue (ModelCollectionAssignable)

- (void)assignModelCollection:(ModelCollection *)modelCollection;
- (void)assignModelCollection;

@end
