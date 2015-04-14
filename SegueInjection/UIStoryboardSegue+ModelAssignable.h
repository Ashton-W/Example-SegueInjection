#import <UIKit/UIKit.h>

@class Model;


@interface UIStoryboardSegue (ModelAssignable)

- (void)assignModel:(Model *)model;
- (void)assignModel;

@end
