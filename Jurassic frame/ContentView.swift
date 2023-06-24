//
//  ContentView.swift
//  Jurassic frame
//
//  Created by Mathieu Moutarde on 22/06/2023.
//

import SwiftUI

struct ContentView: View {
    var runCount = 8
    var deadCount = 8
    var jumpCount = 12

    @State var action = "Jump"
    @State var currentSprite = 1
    @State var timer: Timer? = nil

    func getImage() -> String {
        let base = action
        let end = "(\(currentSprite))"
        return base + " " + end
    }
    
    //This function makes it possible to follow the sprites for each animation, in this case running, jumping and game over

    func updateSprite() {
        if action == "Jump" {
            if currentSprite == jumpCount {
                currentSprite = 1
            } else {
                currentSprite += 1
            }
        } else {
            if currentSprite == runCount {
                currentSprite = 1
            } else {
                currentSprite += 1
            }
        }
    }
    
    //This function allows you to stop or start the sequence of sprites once the play button is clicked, rather than having to click on it each time to advance the number of sprites.Note that this function needs a state to work, because SwiftUI has to handle dynamic page rendering depending on whether the animation stops or starts.

    func startOrStopAnimation() {
            if timer != nil {
                timer?.invalidate()
                timer = nil
            } else {
                timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
                    self.updateSprite()
                }
            }
        }

    var body: some View {
        VStack (alignment: .center){
            Text("Jurassic Frame")
                .font(.custom("Jurassic Park", size: 100))
                .foregroundColor(.primary)
                .shadow(color: .red, radius: 0, x: 2, y: 2)
            Image(getImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
                .background(.gray)
                .cornerRadius(25)
            Spacer()
            Button {
                startOrStopAnimation()
            } label: {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 50))
            }.padding(.bottom, 200)
            HStack (spacing: 40){
               ActionButtonView(action: $action, currentSprite: $currentSprite, buttonTitle: "Running")
                ActionButtonView(action: $action, currentSprite: $currentSprite, buttonTitle: "Jumping")
                ActionButtonView(action: $action, currentSprite: $currentSprite, buttonTitle: "Game Over")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
