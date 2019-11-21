//
//  HomeController.swift
//  Battleship
//
//  Created by Jordan Adedeji on 19/11/2019.
//  Copyright © 2019 Jordan Adedeji. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    
    
//    tabBarController?.selectedIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.tabBarController?.tabBar.isHidden = true
        MusicPlayer.shared.startBackgroundMusic()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ship: UIImageView!
       
    @IBOutlet weak var waves: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
