//
//  GameOverScreenView.swift
//  ViewModule
//
//  Created by Nicolas Proske.
//

import SwiftUI
import PlaygroundSupport
import GlobalModule

// MARK: GameOverScreenView
public struct GameOverScreenView: View {

    // Counter variable to trigger confetti cannon
    @State private var counter: Int = 0

    // Variables for animation purposes
    @State private var scaleEffect: CGFloat = 1.0

    // Statistics
    let totalAnswers: Int
    let mistakes: Int
    var mistakeRatio: Double {
        return Double(Double(mistakes) / Double(totalAnswers))
    }
    let elapsedTime: Double

    let randomColor: Color = Color(.random())

    // Timer to trigger confetti cannon
    let timer = Timer.publish(every: Double.random(in: 2.5...5.0), on: .main, in: .common).autoconnect()

    // Init to call view in PlaygroundPage without errors
    public init(totalAnswers: Int, mistakes: Int, elapsedTime: Double) {
        self.totalAnswers = totalAnswers
        self.mistakes = mistakes
        self.elapsedTime = elapsedTime
    }

    // MARK: Body
    public var body: some View {
        VStack {
            HStack {
                Spacer()
            }

            Spacer()

            // Dynamic header depending on mistake ratio
            Group {
                Text(mistakeRatio < 0.2 ? "Amazing!" : mistakeRatio < 0.6 ? "Great!" : "Improvable")
                    .defaultTextStyle(size: 52, weight: .bold)
                    .padding(.bottom, 15)

                ConfettiCannon(counter: $counter)
                    .onReceive(timer) { _ in
                        if enableConfetti && mistakeRatio < 0.6 {
                            counter += 1
                        }
                    }

                Text(mistakeRatio < 0.2 ? "🤯" : mistakeRatio < 0.6 ? "😎" : "🥴")
                    .font(.system(size: 80))
            }
            .foregroundColor(.white)

            Spacer()

            // Statistics
            Group {
                VStack {
                    Text("Solved questions")
                        .defaultTextStyle(size: 24, weight: .bold)

                    Text("\(totalAnswers)")
                        .defaultTextStyle(size: 46, weight: .black)
                }
                .padding(.bottom)

                VStack {
                    Text("Mistakes")
                        .defaultTextStyle(size: 24, weight: .bold)

                    Text("\(mistakes)")
                        .defaultTextStyle(size: 46, weight: .black)
                }
                .padding(.bottom)

                VStack {
                    Text("Elapsed time")
                        .defaultTextStyle(size: 24, weight: .bold)

                    Text("\(String(format: "%.2f", elapsedTime)) sec")
                        .defaultTextStyle(size: 46, weight: .black)
                }
            }
            .foregroundColor(.white)

            Spacer()

            // "Play again" button
            Button(action: {
                PlaygroundPage.current.setLiveView(GameScreenView())
            }, label: {
                Label(
                    title: {
                        Text("Play again")
                            .defaultTextStyle(size: 30, weight: .bold)

                    }, icon: {
                        Image(systemName: "repeat")
                            .font(.system(size: 24))
                    })
                    .foregroundColor(randomColor)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color(.systemBackground))
                    .cornerRadius(25)
            })
            .scaleEffect(scaleEffect)

            Spacer()
        }
        .padding()
        .frame(width: .infinity, height: .infinity)
        .background(randomColor)
        .onAppear {
            // Trigger confetti cannon on appear if enabled
            if enableConfetti {
                counter += 1
            }

            // Animate "Play again" button
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                scaleEffect = 0.95
            }
        }
    }
}
