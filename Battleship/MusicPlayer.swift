//
//  MusicPlayer.swift
//  Battleship
//
//  Created by Jordan Adedeji on 20/11/2019.
//  Copyright © 2019 Jordan Adedeji. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class MusicPlayer  {
  static let shared = MusicPlayer()
   var audioPlayer: AVAudioPlayer?
   func startBackgroundMusic() {
       if let bundle = Bundle.main.path(forResource: "Ocean_Waves-Mike_Koenig-980635527", ofType: "mp3") {
           let backgroundMusic = NSURL(fileURLWithPath: bundle)
           do {
               audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
               guard let audioPlayer = audioPlayer else { return }
               audioPlayer.numberOfLoops = -1
               audioPlayer.prepareToPlay()
               audioPlayer.play()
           } catch {
               print(error)
           }
       }
   }
   func stopBackgroundMusic() {
       guard let audioPlayer = audioPlayer else { return }
       audioPlayer.stop()
   }
   }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

