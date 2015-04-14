#import "DetailViewController.h"
#import "Model.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;

@end


@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.characterLabel.text = self.model.emoji;
    self.nameLabel.text = self.model.name;
    self.codeLabel.text = ({
        NSMutableString *string = [NSMutableString stringWithCapacity:self.model.emoji.length];
        for (NSUInteger i = 0; i < self.model.emoji.length; i++) {
            unichar c = [self.model.emoji characterAtIndex:i];
            [string appendFormat:@"%hX ", c];
        }
        string;
    });
}

@end
