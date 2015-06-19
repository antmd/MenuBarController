//
//  AppDelegate.m
//  MenuBarControllerSample
//
//  Created by Дмитрий Николаев on 19.01.15.
//  Copyright (c) 2015 Dmitry Nikolaev. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"
@import MenuBarController;

@interface AppDelegate ()

@property (strong) MenuBarController *menuBarController;
@property (strong) NSPopover *popover;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self createPopover];
    [self createMenuBarController];
    // Insert code here to initialize your application
}

- (void) createMenuBarController {
    NSImage *image = [NSImage imageNamed:NSImageNameAddTemplate];

    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"Menu"];
    NSMenuItem *item = [menu addItemWithTitle:NSLocalizedString(@"Quit",@"") action:nil keyEquivalent:@""];
    item.target = self;
    item.action = @selector(quit:);
    
    __weak AppDelegate *weakSelf = self;
    self.menuBarController = [[MenuBarController alloc] initWithImage:image menu:menu handler:^(BOOL active) {
        if (active) {
            [weakSelf.popover showRelativeToRect:NSZeroRect ofView:[weakSelf.menuBarController statusItemView] preferredEdge:NSRectEdgeMinY];
        } else {
            [weakSelf.popover close];
        }
    }];
}

- (void) createPopover {
    self.popover = [[NSPopover alloc] init];
    self.popover.contentViewController = [[MyViewController alloc] init];
    self.popover.behavior = NSPopoverBehaviorApplicationDefined;
}

- (IBAction) quit:(id)sender {
    [[NSApplication sharedApplication] terminate:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
