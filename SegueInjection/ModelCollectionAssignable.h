#import <Foundation/Foundation.h>

@class ModelCollection;

// method injection style
// easier to work with existing readonly properties
@protocol ModelCollectionAssignable <NSObject>

- (void)assignModelCollection:(ModelCollection *)modelCollection;
- (ModelCollection *)modelCollectionForAssignment;

@end
