//
//  WelcomeViewController.swift
//  Battleship
//
//  Created by Jordan Adedeji on 19/11/2019.
//  Copyright © 2019 Jordan Adedeji. All rights reserved.
//

import UIKit
import AVFoundation
var player1 = ""
var player2 = ""

class WelcomeViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    @IBOutlet weak var playerOne: UITextField!
    
    @IBOutlet weak var playerTwo: UITextField!
    

    @IBOutlet weak var ship: UIImageView!
    

    @IBOutlet weak var waves: UIImageView!
    
    @IBAction func instructions(_ sender: UIButton) {
        let alert = UIAlertController(title: "Battleships Instructions", message: "The object of Battleships is to try and sink all of the other player's ships before they sink all of yours. The other player's ships are somewhere on his/her board; you must try and hit them by clicking on one of the squares on the board, if an enemy ship is hidden in that square you score a hit!  If you score a hit you get another shot, if you miss, it's the other player's turn.  The other player tries to hit your ships when it's their turn.  Neither you nor the other player can see the other's board so you must try to guess where they are. Good luck, and thank you for playing our game.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Let's Play", style: .default, handler: { action in
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
    
    
  
    
    @IBAction func pressed(_ sender: Any) {
        if let soundURL = Bundle.main.url(forResource: "yarrrr", withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            }
            catch {
                print(error)
            }
        }else{
            print("Unable to locate audio file")
        }
        
        if (playerOne.text != "" && playerTwo.text != "")        {
        player1 = playerOne.text!
        player2 = playerTwo.text!
        audioPlayer.play()
        performSegue(withIdentifier: "segue", sender: nil)
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        UIImageView.animate(
                       withDuration: 2.0,
                       delay: 0.0, options: [.autoreverse, .repeat],
                       animations: { self.waves.frame.origin.x -= 20},
                       completion: nil)
               
                   UIImageView.animate(
                       withDuration: 7.0,
                   delay: 0.0, options: [.autoreverse, .repeat],
                   animations: { self.ship.frame.origin.x -= 200},
                   completion: nil)
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
