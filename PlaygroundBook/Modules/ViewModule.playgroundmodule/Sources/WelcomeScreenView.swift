//
//  WelcomeScreenView.swift
//  ViewModule
//
//  Created by Nicolas Proske.
//

import SwiftUI
import GlobalModule

// MARK: WelcomeScreenView
public struct WelcomeScreenView: View {

    // Variables for animation purposes
    @State private var firstOffset: CGFloat = /* WWDC */ 20.21 /* 🥳 */
    @State private var secondOffset: CGFloat = 100.0
    @State private var opacity: Double = 0.0

    // Init to call view in PlaygroundPage without errors
    public init() {}

    // MARK: Body
    public var body: some View {
        VStack {
            // Custom emoji if set
            Text(myFavoriteEmoji.isEmpty ? "👋" : myFavoriteEmoji)
                .defaultTextStyle(size: 64)

            // Text with custom name if set
            HStack {
                Spacer()

                Text("Hi")
                    .defaultTextStyle(size: 32, weight: .bold)

                if !myName.isEmpty {
                    Text("\(myName)")
                        .foregroundColor(Color(.random()))
                        .defaultTextStyle(size: 32, weight: .bold)
                }

                Spacer()
            }
            .offset(y: firstOffset)
            .onAppear {
                // Endless floating animation
                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                    firstOffset = 10.0
                }
            }

            // Info text for the user
            VStack {
                Text("Well done!")
                    .defaultTextStyle(size: 24, weight: .bold)
                Text("You can continue with the next lesson.")
                    .defaultTextStyle(size: 18, weight: .light)
            }
            .opacity(opacity)
            .offset(y: secondOffset)
            .padding(.top, 35)
            .onAppear {
                // Delayed animation on appear
                withAnimation(Animation.easeInOut(duration: 1.5).delay(2.0)) {
                    secondOffset = 50.0
                    opacity = 0.3
                }
            }
        }
        .padding()
        .frame(width: .infinity, height: .infinity)
        .background(Color(.systemBackground))
    }
}
