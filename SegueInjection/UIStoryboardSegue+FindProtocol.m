#import "UIStoryboardSegue+FindProtocol.h"

@implementation UIStoryboardSegue (FindProtocol)

- (id)destinationViewControllerConformingToProtocol:(Protocol *)protocol
{
    id destinationViewController = self.destinationViewController;
    
    if ([destinationViewController conformsToProtocol:protocol]) {
        return destinationViewController;
    }
    
    // check for container viewControllers
    if ([destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = destinationViewController;
        UIViewController *topViewController = navigationController.topViewController;
        
        if ([topViewController conformsToProtocol:protocol]) {
            return topViewController;
        }
    }
    
    if ([destinationViewController isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *splitViewController = destinationViewController;
        
        // this case might require you to be more specific
        for (UIViewController *viewController in splitViewController.viewControllers) {
            if ([viewController conformsToProtocol:protocol]) {
                return viewController;
            }
        }
    }
    
    // tabbar too, but be careful not to mess with the lazy loading
    
    return nil;
}

@end
