//
//  AppDelegate.m
//  MenuBarControllerSampleApp
//
//  Created by Dmitry Nikolaev on 27.10.14.
//  Copyright (c) 2014 Dmitry Nikolaev. All rights reserved.
//

#import "AppDelegate.h"
@import MenuBarController;

@interface AppDelegate ()

@property (strong) MenuBarController *menuBarController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSImage *image = [NSImage imageNamed:NSImageNameAddTemplate];
    
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Menu"];
    NSMenuItem *item = [menu addItemWithTitle:NSLocalizedString(@"Quit",@"") action:nil keyEquivalent:@""];
    item.target = self;
    item.action = @selector(quit:);
    
    self.menuBarController = [[MenuBarController alloc] initWithImage:image menu:menu handler:^(BOOL active) {
        if (active) {
            NSLog(@"active");
        } else {
            NSLog(@"inactive");
        }
    }];
    
    // Insert code here to initialize your application
}

- (IBAction) quit:(id)sender {
    [[NSApplication sharedApplication] terminate:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
