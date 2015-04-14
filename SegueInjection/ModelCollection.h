#import <Foundation/Foundation.h>

@class Model;


@interface ModelCollection : NSObject

@property (nonatomic, readonly) NSArray *models;

- (NSUInteger)count;
- (Model *)modelAtIndex:(NSUInteger)index;

@end
