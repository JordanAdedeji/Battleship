//
//  ViewController.swift
//  Battleship
//
//  Created by Jordan Adedeji on 12/11/2019.
//  Copyright © 2019 Jordan Adedeji. All rights reserved.
//
import AVFoundation
import UIKit

var first = true
var winner = ""
var shipCoordinates1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]

class ViewController: UIViewController {
    var audioPlayer1: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!
    var audioPlayer3: AVAudioPlayer!
    var shipsDestroyed = 0
    var thescore = 10
    var count1  = 0
    var store = [Int]()
    
    @IBOutlet weak var score: UILabel!
    
    
  
    @IBOutlet var buttonarray: [UIButton]!
    
    @IBOutlet weak var confirmed: UIButton!
    
    
    @IBOutlet weak var changed: UIButton!
    
    
    @IBOutlet weak var restarted: UIButton!
    
    func updateScore(){
        if (thescore == 1){
        score.text = player2 + " has " + String(thescore) + " ship left!"
        } else {
        score.text = player2 + " has " + String(thescore) + " ships left!"
        }
    }
    
    
    @IBAction func restart(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    
    
    @IBAction func change(_ sender: UIButton) {
        for button in self.buttonarray {
            button.setImage( UIImage(named: "default.png"), for: UIControl.State.normal)
        }
        confirmed.isHidden = true
        changed.isHidden = true
        count1 = 0
        shipCoordinates1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
        18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
        35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        if (count1 == 10){
            confirmed.isHidden = true
            changed.isHidden = true
            for button in self.buttonarray {
                button.setImage( UIImage(named: "default.png"), for: UIControl.State.normal)
            }
            count1 = count1 + 1
            first = false
            if (first == false){
            tabBarController?.tabBar.items?[1].badgeValue = "Play"
            tabBarController?.tabBar.items?[0].badgeValue = nil
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
        
        if(first == true && count1 < 10 && shipCoordinates1[sender.tag - 1] != 0) {
        sender.setImage( UIImage.init(named: "ship.png"), for: .normal)
            shipCoordinates1[sender.tag - 1] = 0
            count1 = count1 + 1
            print("Ship anchored")
        } else if (count1 == 11 && first == true){
            if(shipCoordinates2[sender.tag - 1] == sender.tag) {
                sender.setImage( UIImage(named: "miss.png"), for: UIControl.State.normal)
                print("Miss")
                first = false
                audioPlayer1.play()
                if (first == false){
                tabBarController?.tabBar.items?[1].badgeValue = "Play"
                tabBarController?.tabBar.items?[0].badgeValue = nil
                }
                }else if (shipCoordinates2[sender.tag - 1] != sender.tag) {
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
                    winner = player1
                    score.text = "You Win!"
                    audioPlayer3.play()
                    restarted.isHidden = false
                    tabBarController?.tabBar.items?[0].badgeValue = "Winner!"
                    count1 = 12
                    shipCoordinates1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
                    35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
                    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
                    shipCoordinates2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
                    18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
                    35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
                    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]
                }
                    }
            }
        if (count1 == 10){
            confirmed.isHidden = false
            changed.isHidden = false
        }
        
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmed.isHidden = true
        changed.isHidden = true
        restarted.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
//        self.tabBarController?.tabBar.items?[2].title = player1
//        tabBarController?.viewControllers?.remove(at: 0)
        self.tabBarController?.tabBar.items?[0].title = player1
        self.tabBarController?.tabBar.items?[1].title = player2
        // Do any additional setup after loading the view.
        
        let alert = UIAlertController(title: "Fleet Deployment", message: "Position your 10 ships " + player1 + "!", preferredStyle: .alert)
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
    
    

}
