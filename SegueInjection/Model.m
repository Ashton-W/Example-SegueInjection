#import "Model.h"


@implementation Model

- (instancetype)initWithEmoji:(NSString *)emoji
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _emoji = [emoji copy];
    
    NSMutableString *name = [emoji mutableCopy];
    CFStringTransform((CFMutableStringRef) name, nil, kCFStringTransformToUnicodeName, NO);
    
    _name = [name stringByReplacingOccurrencesOfString:@"\\N" withString:@""];
    _name = [_name stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"{}"]];
    
    return self;
}

@end
