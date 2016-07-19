//
//  main.m
//  Testkit
//
//  Created by Martin on 10/7/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TIMERUIApplication.h"


int main(int argc, char * argv[]) {
    
    @autoreleasepool {

       // return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        return UIApplicationMain(argc, argv, NSStringFromClass([TIMERUIApplication class]), NSStringFromClass([AppDelegate class]));

    }
}
