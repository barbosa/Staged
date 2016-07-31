//
//  UINavigationController+Staged.m
//  Staged
//
//  Created by Gustavo Barbosa on 7/31/16.
//
//

#import "UINavigationController+Staged.h"
#import "UIViewController+StagedSwizziling.h"

NSString * const STGViewControllerWasPushedNotificationName = @"STGViewControllerWasPushedNotificationName";
NSString * const STGViewControllerWasPoppedNotificationName = @"STGViewControllerWasPoppedNotificationName";

NSString * const STGViewControllerPushingAnimatedKey = @"STGViewControllerPushingAnimatedKey";
NSString * const STGViewControllerPoppingAnimatedKey = @"STGViewControllerPoppingAnimatedKey";

@implementation UINavigationController (Staged)

+ (void)stg_swizzle {
    [self stg_replaceInstanceMethod:@selector(pushViewController:animated:)
                         withMethod:@selector(stg_pushViewController:animated:)];

    [self stg_replaceInstanceMethod:@selector(popViewControllerAnimated:)
                         withMethod:@selector(stg_popViewControllerAnimated:)];
}

- (void)stg_pushViewController:(UIViewController *)viewControllerToPush
                      animated:(BOOL)flag {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:STGViewControllerWasPushedNotificationName
                      object:viewControllerToPush
                    userInfo:@{STGViewControllerPushingAnimatedKey: @(flag)}];
}

- (nullable UIViewController *)stg_popViewControllerAnimated:(BOOL)flag {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:STGViewControllerWasPoppedNotificationName
                      object:self.topViewController
                    userInfo:@{STGViewControllerPoppingAnimatedKey: @(flag)}];
    return nil;
}

@end