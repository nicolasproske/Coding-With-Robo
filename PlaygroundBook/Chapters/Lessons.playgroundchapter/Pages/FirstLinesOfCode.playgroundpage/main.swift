//: ![FirstLinesOfCodeBanner](FirstLinesOfCodeBanner.png)
//:
//#-hidden-code
import SwiftUI
import PlaygroundSupport
import GlobalModule
import ViewModule
//#-end-hidden-code
//:
//: # **Lesson 1: First Lines of Code!**
//:
//: - Note: 🤖 says: *"You've probably wondered how programming actually works? To keep it shortly: It isn't as complex as you may think! It's possible to create amazing things with just a few lines of code - And I would like to show it to you right now."*

//: ## Step 1: Assigning values to variables
//: - Note: 🤖 says: *"Here you can see two lines of code I already prepared for you. Simply follow the instructions."*
//: 1. Go down to `myFavoriteEmoji` and type in **your** favorite emoji inside the quotation marks.
//: 2. Repeat step `1` with filling in **your** name next to `myName`.
//:
myFavoriteEmoji = /*#-editable-code*/""/*#-end-editable-code*/
myName = /*#-editable-code*/""/*#-end-editable-code*/

//: ## Note: How to pass variables
// Here you can see a really simple code snippet that shows how to pass a variable - here called 'testVariable' - to a 'Text':
/*:
    Text(testVariable)
 */

//: ## Step 2: Passing variables
//: - Note: 🤖 says: *To display the values of the variables `myFavoriteEmoji` and `myName` when running the code you need to pass them to the `Text` object as shown in the snippet above.*
//: 1. Pass `myFavoriteEmoji` to the first `Text`.
//: 2. Pass `myName` to the second `Text`.
//:
// Basic structure of a View called 'WelcomeScreen'
struct WelcomeScreen: View {
    var body: some View {
        Group {
            Text(/*#-editable-code myFavoriteEmoji*//*#-end-editable-code*/)
            Text(/*#-editable-code myName*//*#-end-editable-code*/)
        }
    }
}

//: ## Step 3: Run your code
//: - Note: 🤖 says: *"Brilliant! The playground is now ready to be tried out!"*
//: 1. Tap on `Run My Code` to see the results!

//: ## **[Tap here to get to the second lesson ➡️](@next)**
//:
//#-hidden-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(WelcomeScreenView())
//#-end-hidden-code
