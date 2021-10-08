//
//  Music.swift
//  ReadME
//
//  Created by AMStudent on 10/8/21.
//

import Foundation

import AVFoundation

func playSound() {
    let url = Bundle.main.url(forResource: "vine-boom", withExtension: "mp3")
    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("error")
}
}
