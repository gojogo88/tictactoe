//
//  ViewController.swift
//  tictactoe
//
//  Created by Jonathan Go on 2017/01/17.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    
    
    @IBOutlet weak var playAgainLabel: UIButton!
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        // reset all game variables
        activePlayer = 1    // variable to keep track who's turn it is.
        
        activeGame = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]     // 0 - empty, 1 - nought, 2 - crosses
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            // putting the hide the winning message and button here will put it 4,500 from x bec it will loop 9 times
            
        }
        // Hide the winning message and button initially
        winnerLabel.isHidden = true
            
        playAgainLabel.isHidden = true
            
            
        // positions the labels outside the screen for animation
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
        
    }
    
    //1 is nought, 2 is crosses
    var activePlayer = 1    // variable to keep track who's turn it is.
    
    var activeGame = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]     // 0 - empty, 1 - nought, 2 - crosses
    
    let winningCombinations = [[0, 1, 2], [3, 4 ,5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]  // winning combos
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1     // because array starts at 0 and not 1.  To find out which button was pressed
        
        if gameState[activePosition] == 0 && activeGame {
        
            gameState[activePosition] = activePlayer

            if activePlayer == 1{
                
                sender.setImage(UIImage(named: "nought.png"), for: [])  // to change the image on the button to nought.png when pressed
                                                                    // the empty array is used to specify the default state
                activePlayer = 2
                
            } else {
            
                sender.setImage(UIImage(named: "cross.png"), for: [])  // to change the image on the button to cross.png when pressed
            
                activePlayer = 1
            
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {      // combination 0 -first item in the 3 number combination
                    
                   activeGame = false
                    
                    winnerLabel.isHidden = false
                    
                    playAgainLabel.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                    
                        winnerLabel.text = "Nought has won!"
                    
                    } else {
                        
                        winnerLabel.text = "Crosses has won!"
                        
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainLabel.center = CGPoint(x: self.playAgainLabel.center.x + 500, y: self.playAgainLabel.center.y)
                        
                    })
                    
                }
                
            }
            
        }
        
        // print(sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Hide the winning message and button initially
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        
        // positions the labels outside the screen for animation
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

