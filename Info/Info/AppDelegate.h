//
//  AppDelegate.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 13/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

/**
 @brief Checa se possui internet, se não possuir mostrar erro.
 **/
-(void) checkInternet;


@end

