//: ![AddingSomeLogicBanner](AddingSomeLogicBanner.png)
//:
//#-hidden-code
import PlaygroundSupport
import GlobalModule
import ViewModule
//#-end-hidden-code
//:
//: # **Lesson 2: Adding some Logic**

//: ## Step 1: Adding functions with parameters
//: - Note: 🤖 says: *"For your first game I would suggest staying simple. Therefore, a quiz is a nice choice! A quiz needs..? - Questions, correct! I already added some default questions, but you can of course add more if you want!"*
//: 1. Adding questions is easy: Type `addQuestion("Bee", "🐝")` and replace both the text and emoji with the correct answer and the associated emoji.
//:
//#-editable-code
// Add your questions line by line below
addQuestion("Dinosaur", "🦖")

//#-end-editable-code

//: ## Step 2: Calling sub-functions
//: - Note: 🤖 says: *"Nice choice, this is going to be an amazing quiz! To mix up the questions, call the `shuffle()` method on our questions."*
//: 1. Add `.shuffle()` at the end of `questions`.
//:
//#-editable-code
// Call the .shuffle() method
questions
//#-end-editable-code

//: ## Step 3: Run your code
//: 1. Tap on `Run My Code`.

//: ## **[Tap here to get to the final lesson ➡️](@next)**
//:
//#-hidden-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(GameScreenView())
//#-end-hidden-code
