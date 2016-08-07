//
//  STGNavigationControllerVerifier.h
//  Staged
//
//  Created by Gustavo Barbosa on 7/31/16.
//
//

#import <UIKit/UIKit.h>

@interface STGNavigationControllerVerifier: NSObject

@property (nonatomic, copy) NSArray<__kindof UIViewController *> * _Nonnull viewControllers;
@property (nonatomic, readonly) __kindof UIViewController  * _Nullable topViewController;
@property (nonatomic) BOOL pushedAnimated;
@property (nonatomic) BOOL poppedAnimated;

@end
