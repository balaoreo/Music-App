//
//  ContentView.swift
//  TextImages
//
//  Created by Keona Balaoro on 10/6/22.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var songIndex = 0
    @State private var isStarted = false
    @State private var audioPlayer: AVAudioPlayer!
                
    private let songNames = ["Location Unknown ft. Georgia", "Rockstar", "Hands Down", "Satellite"]
    private let imageNames = ["album01", "album02", "album03", "album04"]
    private let singerNames = ["HONNE", "Mallrat", "The Greeting Committee", "Harry Styles"]
    private let soundNames = ["sound0", "sound1", "sound2", "sound3"]
    
        func playSong(songFileName: String) {
            guard let soundFile = NSDataAsset(name: songFileName) else {
                print("😡 could not read file name \(songFileName)")
                return
        }
            do {
                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    var body: some View {
            VStack{
                Image(imageNames[songIndex])
                    .resizable()
                    .frame(width: 350, height: 350
                           , alignment: .center)
                    .scaledToFill()
                    .padding(20)
                Text("\(songNames[songIndex])")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .italic()
                Text("by \(singerNames[songIndex])")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .italic()
                
                Button("Start New Song") {
                    if songIndex < soundNames.count-1 {
                        songIndex = songIndex + 1
                        
                    }
                    else {
                        songIndex = 0
                    }
                    playSong(songFileName: soundNames[songIndex])
                }
                .font(.caption)
                .buttonStyle(.borderedProminent)
                .padding()
                
                Button("Stop Playing") {
                    if audioPlayer.isPlaying {
                        audioPlayer.stop()
                    }
                }
                .font(.caption)
                .buttonStyle(.borderedProminent)
                .padding()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }
    }
