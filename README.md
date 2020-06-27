#  Multiple Modals in SwiftUI issue in iOS 14

## Issue
Previously it was possible to have multiple modals effectively achieved in a single sheet view, by showing a different content depending on a `@State` variable. See example below. This is no longer working in SwiftUI in iOS 14, however did work in iOS 13.

When running this example, you should see a modal saying "First view!" or "Second view!" depending on the button pressed, which updates the `@State` variable `whichModal` and then toggles the `showModal` boolean.
Instead my experience has been that clicking on a button the first time will almost seem as if it has not changed the State variable, then subsequent times work.

The fifth tab is the only one which achieves the desired effect, but uses separate sheet views on different elements.

Is this a bug, or is there a different way to now achieve this effect?

```swift
.sheet(
    isPresented: $showModal,
    content: {
        if whichModal == "first" {
            Text("First modal!")
        }
        else if whichModal == "second" {
            Text("Second modal!")
        }
        else {
            Text("Huh?!?")
        }
    }
)
```
