#import "DisplayViewController.h"
#import "Model.h"
#import "UIStoryboardSegue+ModelAssignable.h"


@interface DisplayViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) UITapGestureRecognizer *tapGesture;
@property (getter=isLabelAnimating) BOOL labelAnimating;

@end


@implementation DisplayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.label addGestureRecognizer:self.tapGesture];
    self.label.userInteractionEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = self.model.name;
    self.label.text = self.model.emoji;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue assignModel];
}

- (void)tapped:(UIGestureRecognizer *)gesture
{
    if (!self.isLabelAnimating) {
        self.labelAnimating = YES;
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.label.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -0.2);
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionCurveEaseInOut animations:^{
                                     self.label.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 0.2);
                                 } completion:NULL];
                             }
                         }];
    }
}

@end
