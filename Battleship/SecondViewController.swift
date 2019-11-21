//
//  SecondViewController.swift
//  Battleship
//
//  Created by Jordan Adedeji on 14/11/2019.
//  Copyright © 2019 Jordan Adedeji. All rights reserved.
//

import UIKit
import AVFoundation
var shipCoordinates2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]

class SecondViewController: UIViewController {
    var audioPlayer1: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!
    var audioPlayer3: AVAudioPlayer!
    var count2  = 0
    var store = [Int]()
    var thescore = 10
    var shipsDestroyed = 0
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var buttonarray: [UIButton]!
    
    @IBOutlet weak var confirmed: UIButton!
    
    
    @IBOutlet weak var changed: UIButton!
    
    @IBOutlet weak var restarted: UIButton!
    
    func updateScore(){
        if (thescore == 1){
               score.text = player1 + " has " + String(thescore) + " ship left!"
               } else {
               score.text = player1 + " has " + String(thescore) + " ships left!"
               }
    }
    
    @IBAction func segue1(_ sender: UIButton) {
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    
    
    @IBAction func change(_ sender: UIButton) {
        for button in self.buttonarray {
            button.setImage( UIImage(named: "default.png"), for: UIControl.State.normal)
        }
        confirmed.isHidden = true
        changed.isHidden = true
        count2 = 0
        shipCoordinates2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
        18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
        35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        if (count2 == 10){
            confirmed.isHidden = true
            changed.isHidden = true
            for button in self.buttonarray {
                button.setImage( UIImage(named: "default.png"), for: UIControl.State.normal)
            }
            count2 = count2 + 1
            first = true
            if (first == true){
            tabBarController?.tabBar.items?[0].badgeValue = "Play"
            tabBarController?.tabBar.items?[1].badgeValue = nil
            }
        }
    }
    
    @IBAction func Button(_ sender: UIButton) {
        if let soundURL = Bundle.main.url(forResource: "splash", withExtension: "mp3") {
                   do {
                       audioPlayer1 = try AVAudioPlayer(contentsOf: soundURL)
                   }
                   catch {
                       print(error)
                   }
               }else{
                   print("Unable to locate audio file")
               }
               
               if let soundURL1 = Bundle.main.url(forResource: "explosion", withExtension: "mp3") {
                   do {
                       audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL1)
                   }
                   catch {
                       print(error)
                   }
               }else{
                   print("Unable to locate audio file")
               }
        
        if let soundURL2 = Bundle.main.url(forResource: "tada", withExtension: "mp3") {
            do {
                audioPlayer3 = try AVAudioPlayer(contentsOf: soundURL2)
            }
            catch {
                print(error)
            }
        }else{
            print("Unable to locate audio file")
        }
        
        
        if(first == false && count2 < 10 && shipCoordinates2[sender.tag - 1] != 0) {
          sender.setImage( UIImage.init(named: "ship.png"), for: .normal)
              shipCoordinates2[sender.tag - 1] = 0
              count2 = count2 + 1
              print("Ship anchored")
          } else if (first == false && count2 == 11){
              if(shipCoordinates1[sender.tag - 1] == sender.tag) {
                  sender.setImage( UIImage(named: "miss.png"), for: UIControl.State.normal)
                  print("Miss")
                audioPlayer1.play()
                first = true
                if (first == true){
                tabBarController?.tabBar.items?[0].badgeValue = "Play"
                tabBarController?.tabBar.items?[1].badgeValue = nil
                }
                  }else if (shipCoordinates1[sender.tag - 1] != sender.tag) {
                  if store.contains(where: {$0 == sender.tag}) {
                      print("already hit")
                  }else {
                      store.append(sender.tag)
                      sender.setImage(UIImage(named: "ship2.png"), for: UIControl.State.normal)
                      print("Hit")
                      shipsDestroyed = shipsDestroyed + 1
                    thescore = thescore - 1
                    updateScore()
                    audioPlayer2.play()
                  }
                if (shipsDestroyed == 10){
                    winner = player2
                    score.text = "You Win!"
                    audioPlayer3.play()
                    tabBarController?.tabBar.items?[1].badgeValue = "Winner!"
                    restarted.isHidden = false
                    count2 = 12
                    shipCoordinates1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
                    35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
                    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
                    shipCoordinates2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
                    35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
                    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
                    first = true
                }
                      }
              }
           if (count2 == 10){
               confirmed.isHidden = false
               changed.isHidden = false
           }
        
    }
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        confirmed.isHidden = true
        changed.isHidden = true
        restarted.isHidden = true
        let alert = UIAlertController(title: "Fleet Deployment", message: "Position your 10 ships " + player2 + "!", preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "Got It!", style: .default, handler: { action in
                   switch action.style {
                   case .default:
                     print("default")
                   case .cancel:
                     print("cancel")
                   case .destructive:
                     print("destructive")
                   }
                 }))
                 self.present(alert, animated: true, completion: nil)
    
    }
    

    

    /*    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
