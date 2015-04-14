#import <Foundation/Foundation.h>


@interface Model : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *emoji;

- (instancetype)initWithEmoji:(NSString *)emoji NS_DESIGNATED_INITIALIZER;

@end
