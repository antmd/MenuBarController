**MenuBarController** simplify the process of creating menubar apps for OS x that have some non-trivial action for the left mouse button (like some popup window or custom view), and menu for the right.

By default you can set up your own behaviour on menu bar OR use standart menu. This framework allows you to do both.

### How to use

1\. Import the framework:
```objective-c
@import MenuBarController;
```
2\. Set up `MenuBarController` instance with image, menu and click handler:

```objective-c
self.menuBarController = [[MenuBarController alloc] initWithImage:image menu:menu handler:^(BOOL active) {
}];
```

3\. Fill block with needed behaviour. Use active variable to detect if user clicks the left mouse button (active == YES), or clicked the right (active == NO).

### Why to use this framework

Since OS X 10.10 Apple introduces some changes to `NSStatusItem` API, so most of the api is absolete. You should use button member in `NSStatusItem` and set up template image on it, so it could be represented right according to current system preferences (dark menu bar mode etc.). More about changes in 10.10 you can find on [StackOverflow thread][1] and [Developer Forum][2].

### Few things to know

Current implementation uses OS X 10.10 features, and will be adopted for older releases (up to 10.6) soon.

[1]: http://stackoverflow.com/questions/24623559/nsstatusitem-change-image-for-dark-tint
[2]: https://devforums.apple.com/thread/234839?start=25&tstart=0
