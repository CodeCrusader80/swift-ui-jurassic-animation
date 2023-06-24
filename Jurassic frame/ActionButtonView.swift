//
//  ActionButtonView.swift
//  Jurassic frame
//
//  Created by Mathieu Moutarde on 22/06/2023.
//

import SwiftUI

struct ActionButtonView: View {
    @Binding var action: String
    @Binding var currentSprite: Int
    var buttonTitle: String
    var body: some View {
        Button(buttonTitle) {
            currentSprite = 1
            switch buttonTitle {
            case "Running": action = "Run"
            case "Jumping": action = "Jump"
            case "Game Over": action = "Dead"
            default: break
            }
        }.buttonStyle(.borderedProminent)
    }
}
