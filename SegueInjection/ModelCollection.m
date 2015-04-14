#import "ModelCollection.h"
#import "Model.h"


@implementation ModelCollection

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self loadStandardModels];
    
    return self;
}

- (void)loadStandardModels
{
    NSString *emojis = @"🐶🐱🐭🐹🐰🐸🐯🐨🐻🐷🐮🐵🐼🐧🐦🐤🐔🐍🐢🐛🐝🐜🐞🐌🐙🐠🐬🐳";
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:emojis.length];
    
    [emojis enumerateSubstringsInRange:NSMakeRange(0, emojis.length)
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [models addObject:[[Model alloc] initWithEmoji:substring]];
    }];
    
    _models = [models copy];
}

- (Model *)modelAtIndex:(NSUInteger)index
{
    return [self.models objectAtIndex:index];
}

- (NSUInteger)count
{
    return self.models.count;
}

@end
