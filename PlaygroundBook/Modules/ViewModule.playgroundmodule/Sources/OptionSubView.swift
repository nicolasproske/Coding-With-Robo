//
//  OptionSubView.swift
//  ViewModule
//
//  Created by Nicolas Proske.
//

import SwiftUI

// MARK: OptionSubView
public struct OptionSubView: View {

    // Variables for animation purposes
    @State private var scaleEffect: CGFloat = 1.0

    let emoji: String

    // Init to call view in PlaygroundPage without errors
    public init(emoji: String) {
        self.emoji = emoji
    }

    // MARK: Body
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color(.black))
                .frame(width: 85, height: 85)
                .opacity(0.2)
            Text(emoji)
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .shadow(radius: 15)
        }
        .scaleEffect(scaleEffect)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                scaleEffect = 0.90
            }
        }
    }
}
