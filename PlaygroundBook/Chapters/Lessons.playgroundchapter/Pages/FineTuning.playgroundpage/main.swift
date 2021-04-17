//: ![FineTuningBanner](FineTuningBanner.png)
//:
//#-hidden-code
import PlaygroundSupport
import GlobalModule
import ViewModule

func addTapSounds() {
    enableTapSounds = true
}

func addWinSound() {
    enableWinSound = true
}

func addBackgroundMusic() {
    enableBackgroundMusic = true
}

func addSpeech() {
    enableSpeech = true
}

func addConfetti() {
    enableConfetti = true
}
//#-end-hidden-code
//:
//: # **Lesson 3: Fine Tuning**

//: ## Step 1: Importing modules
//: - Note: 🤖 says: *"Bit quite around here... I think it's time to change this. Note: Sound is — in addition to an intuitive design — one of the most important elements of a well-designed app and because that's what we want, we're implementing it right now."*
//: 1. Add `import AVKit` to import the module called `AVKit` - provided by Apple - in order to get access to some important features we need if we want to play sounds.
//:
//#-editable-code
// Add import AVKit here

//#-end-editable-code

//: ## Step 2: Adding functions without parameters
//: - Note: 🤖 says: *"Now we have access to functions we need to play some sounds."*
//: 1. Type `addTapSounds()` to give the player a short feedback when tapping a button.
//: 2. Type `addWinSound()` to play a win sound.
//: 3. Type `addBackgroundMusic()` to add some cool background music to your quiz.
//: 4. Type `addSpeech()` to read the questions out loud.
//: 5. Type `addConfetti()` to fire the confetti cannon when answering a question right.
//:
//#-editable-code
// Add addTapSounds(), addWinSound(), addBackgroundMusic(), addSpeech() and addConfetti() line by line below

//#-end-editable-code

//: ## Step 3: Run your code
//: - Note: 🤖 says: *"Since we have sound now, don't forget to turn up the volume on your device."*
//: 1. Make sure the volume is turned up on your device.
//: 2. Tap on `Run My Code`.
//:
//: - Note: ![LittleNico](LittleNico.png) says: *"What's up - Nico here again! Have you tried to add only one of those functions? For example, if you don't want to have background music playing, only add `addTapSounds()` and run your code! Feel free to try it out 😎"*
//:
//#-hidden-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.setLiveView(GameScreenView())
//#-end-hidden-code
