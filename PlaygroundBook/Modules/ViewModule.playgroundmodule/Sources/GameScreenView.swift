import SwiftUI
import AVKit
import PlaygroundSupport
import GlobalModule

// MARK: GameScreenView
public struct GameScreenView: View {

    @State private var currentQuestion: Question?

    // Counter variable to trigger confetti cannon
    @State private var counter: Int = 0

    // Counter variable to count mistakes made by the player
    @State private var mistakes: Int = 0

    private var startTime: DispatchTime = DispatchTime.now()

    // Text to speech
    private let synthesizer = AVSpeechSynthesizer()

    // Init to call view in PlaygroundPage without errors
    public init() {}

    // MARK: Body
    public var body: some View {
        VStack {
            if currentQuestion == nil {
                Text("An error occured. You need to add some questions.")
                    .defaultTextStyle(size: 28)
                    .shadow(radius: 15)
            } else {
                Spacer()

                // Currently searched emoji in text form
                Text("Find and tap on the")
                    .foregroundColor(.white)
                    .defaultTextStyle(size: 24, weight: .light)
                    .shadow(radius: 15)
                    .opacity(0.8)

                if enableConfetti {
                    ConfettiCannon(counter: $counter, num: 25, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }

                HStack {
                    Text(currentQuestion!.searchingFor)
                        .foregroundColor(.white)
                        .defaultTextStyle(size: 45, weight: .bold)
                        .shadow(radius: 15)

                    if enableSpeech {
                    ZStack {
                        Circle()
                            .fill(Color(.white))
                            .frame(width: 55, height: 55)
                            .opacity(0.2)

                        // Text to speech button
                            Button(action: {
                                speakCurrentQuestion()
                            }, label: {
                                Image(systemName: "speaker.wave.2.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28))
                                    .shadow(radius: 15)
                            })
                        }
                    }
                }

                Spacer()

                // Possible three answers placed next to each other
                HStack(spacing: 15) {
                    Spacer()

                    // Select two random emojis, append the correct emoji and shuffle the resulting array
                    ForEach(wrongAnswersArray.filter({ emoji in
                        // Make sure the every emoji is unique
                        return emoji != currentQuestion!.correctEmoji
                    })
                    .pick(2)
                    .appendElement(o: currentQuestion!.correctEmoji)
                    .shuffled(), id: \.self) { emoji in
                        // Make emoji clickable
                        Button(action: {
                            if emoji == currentQuestion!.correctEmoji {
                                withAnimation {
                                    // Clicked correct emoji: Continue with the next question
                                    nextQuestion()
                                }
                                // Init "correct" tap sound
                                tapSoundAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: successSound!))
                            } else {
                                // Init "incorrect" tap sound
                                tapSoundAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: incorrectSound!))

                                // Player did mistake
                                mistakes += 1
                            }
                            // Lower the volume of the sounds
                            tapSoundAudioPlayer.volume = 0.5

                            // Play the previously initialized sounds if enabled
                            if enableTapSounds {
                                tapSoundAudioPlayer.prepareToPlay()
                                tapSoundAudioPlayer.play()
                            }
                        }, label: {
                            OptionSubView(emoji: emoji)
                        })
                    }

                    Spacer()
                }

                Spacer()
            }
        }
        .padding()
        .frame(width: .infinity, height: .infinity)
        .background(Color(.random()))
        .onAppear {
            // Play the background music 5 times in a row if enabled
            if enableBackgroundMusic {
                backgroundMusicAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: backgroundMusic!))
                backgroundMusicAudioPlayer.numberOfLoops = 5
                backgroundMusicAudioPlayer.volume = 0.1
                backgroundMusicAudioPlayer.prepareToPlay()
                backgroundMusicAudioPlayer.play()
            }

            // Adding standard questions to improve the game experience and avoid errors
            addQuestion("Rocket", "🚀")
            addQuestion("Apple Watch", "⌚️")
            addQuestion("Apple", "🍎")
            addQuestion("Taxi", "🚕")
            addQuestion("Crone", "👑")

            // Randomize questions by shuffling them
            questions.shuffle()

            // Select a current question
            currentQuestion = questions[0]

            // Text to speech current question if enabled
            speakCurrentQuestion()
        }
    }

    /**
     
     Changes `currentQuestion` to a new question from the `questions` array, if present.
     Changes live view to `GameOverScreenView` if no question is available.
     Using `AVAudioPlayer` to play a sound.
     
     */
    func nextQuestion() {
        if questions.count > 1 {
            questions.remove(at: 0)

            counter += 1

            // Init a new question
            currentQuestion = questions[0]

            // Text to speech current question if enabled
            speakCurrentQuestion()
        } else {
            // Play win sound if enabled
            if enableWinSound {
                winSoundAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: winSound!))
                winSoundAudioPlayer.volume = 0.7
                winSoundAudioPlayer.prepareToPlay()
                winSoundAudioPlayer.play()
            }

            // Calculate elapsed time
            let elapsedTime: Double = Double(DispatchTime.now().uptimeNanoseconds - startTime.uptimeNanoseconds) / 1000000000

            // Change live view to GameOverScreenView
            PlaygroundPage.current.setLiveView(GameOverScreenView(totalAnswers: counter, mistakes: mistakes, elapsedTime: elapsedTime))
        }
    }

    /**
     
     Speaks current question using `AVSpeechSynthesizer` if enabled.
     
     */
    func speakCurrentQuestion() {
        if enableSpeech {
            let utterance = AVSpeechUtterance(string: currentQuestion!.searchingFor)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                synthesizer.speak(utterance)
            }
        }
    }
}
