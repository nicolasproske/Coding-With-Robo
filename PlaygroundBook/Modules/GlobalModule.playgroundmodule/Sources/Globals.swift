//
//  Globals.swift
//  GlobalModule
//
//  Created by Nicolas Proske.
//

import SwiftUI
import AVKit

public var myFavoriteEmoji: String = ""
public var myName: String = ""

public var tapSoundAudioPlayer: AVAudioPlayer!
public var winSoundAudioPlayer: AVAudioPlayer!
public var backgroundMusicAudioPlayer: AVAudioPlayer!

public var enableTapSounds: Bool = false
public var enableWinSound: Bool = false
public var enableBackgroundMusic: Bool = false
public var enableSpeech: Bool = false
public var enableConfetti: Bool = false

// Source: https://freesound.org/people/FoolBoyMedia/sounds/352667/
public let successSound = Bundle.main.path(forResource: "successSound", ofType: "mp3")
// Source: https://freesound.org/people/timgormly/sounds/181858/
public let incorrectSound = Bundle.main.path(forResource: "incorrectSound", ofType: "aiff")
// Source: https://www.youtube.com/watch?v=ETQskSCtAHc
public let winSound = Bundle.main.path(forResource: "winSound", ofType: "mp3")
// Source: https://www.youtube.com/watch?v=KCcuB6sBnjU
public let backgroundMusic = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")

public var questions: [Question] = []
public let wrongAnswersArray: [String] = ["👽", "🤖", "🦴", "🐶", "🐰", "🐼", "🐯", "🦁", "🐸", "🐥", "🦆", "🐝", "🦋", "🐢", "🐙", "🐠", "🐳", "🌵", "🌳", "🪵", "🍄", "🌹", "🌸", "🌎", "🔥", "🌈", "☁️", "⛄️", "🍋", "🥝", "🌽", "🥗", "🍩", "⚽️", "🏀", "🏈", "🎾", "🛹", "🥁", "🎺", "🎸", "🚗", "🚜", "🚂", "✈️", "🚀", "🚁", "⛵️", "🏠", "💻", "📷", "💎", "🔮", "🦠", "🪣", "🛎", "🧸", "🎁", "📚", "📌", "🖋", "✏️", "🔎", "🔒"]
