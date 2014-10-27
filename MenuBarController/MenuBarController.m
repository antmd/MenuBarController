//
//  MenuBarController.m
//  MenuBarController
//
//  Created by Dmitry Nikolaev on 27.10.14.
//  Copyright (c) 2014 Dmitry Nikolaev. All rights reserved.
//

#import "MenuBarController.h"

@interface MenuBarController ()

@property (strong, nonatomic) NSStatusItem *statusItem;

@end

@implementation MenuBarController

- (instancetype) initWithImage: (NSImage *) image menu: (NSMenu *) menu handler: (MenuBarControllerActionBlock) handler
{
    self = [super init];
    if (self) {
        self.image = image;
        self.menu = menu;
        self.handler = handler;
        
        self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
        
        self.statusItem.button.image = image;
        self.statusItem.button.appearsDisabled = NO;
        self.statusItem.button.target = self;
        self.statusItem.button.action = @selector(leftClick:);

        __unsafe_unretained MenuBarController *weakSelf = self;
        
        [NSEvent addLocalMonitorForEventsMatchingMask:
         (NSRightMouseDownMask | NSLeftMouseDownMask) handler:^(NSEvent *incomingEvent) {

             if (incomingEvent.type == NSLeftMouseDown) {
                 weakSelf.statusItem.menu = nil;
             }
             
             if (incomingEvent.type == NSRightMouseDown) {
                 weakSelf.handler(NO);
                 weakSelf.statusItem.menu = weakSelf.menu;
             }
             
             return incomingEvent;
         }];

    }
    return self;
}

- (IBAction)leftClick:(id)sender {
    if (self.handler) {
        self.handler(YES);
    }
}

- (NSView *) statusItemView {
    return self.statusItem.button;
}


@end
