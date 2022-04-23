//
//  ViewController.swift
//  tictactoe
//
//  Created by Michal on 23/04/2022.
//  Copyright © 2022 Michal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var label: UILabel!
    var counter = 0
    var activePlayer = "X"
    var gameState = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    var gameActive = true
    let winPositions = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                        [0, 3, 6], [1, 4, 7], [2, 5, 8],
                        [0, 4, 8], [2, 4, 6]];
    
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag - 1] == " " && gameActive) {
            gameState[sender.tag - 1] = activePlayer
            counter += 1

            if (activePlayer == "X") {
                sender.setImage(UIImage(named: "x.png"), for: UIControl.State())
                activePlayer = "O"
                label.text = "O PLAYS"
                label.textColor = UIColor(red: 0.3843, green: 0, blue: 0.9333, alpha: 1.0) /* #6200ee */
            } else {
                sender.setImage(UIImage(named: "o.png"), for: UIControl.State())
                activePlayer = "X"
                label.text = "X PLAYS"
                label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0) /* #ff0000 */
            }
        }

        for position in winPositions {
            if (gameState[position[0]] == gameState[position[1]] &&
                                    gameState[position[1]] == gameState[position[2]] && gameState[position[0]] != " ") {
                gameActive = false

                if (gameState[position[0]] == "X") {
                    label.text = "X WON!"
                    label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0) /* #ff0000 */
                    playAgainBtn.setTitleColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1.0), for: UIControl.State())
                    
                } else {
                    label.text = "O WON!"
                    label.textColor = UIColor(red: 0.3843, green: 0, blue: 0.9333, alpha: 1.0) /* #6200ee */
                    playAgainBtn.setTitleColor(UIColor(red: 0.3843, green: 0, blue: 0.9333, alpha: 1.0), for: UIControl.State())
                }
                
                playAgainBtn.isHidden = false
        }
    }
        
        if (counter == 9 && gameActive) {
            label.text = "IT'S A DRAW!"
            label.textColor = UIColor(red: 0.298, green: 0.2588, blue: 0.3216, alpha: 1.0) /* #4c4252 */
            
            playAgainBtn.setTitleColor(UIColor(red: 0.298, green: 0.2588, blue: 0.3216, alpha: 1.0), for: UIControl.State())
            
            playAgainBtn.isHidden = false
        }
}
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
        counter = 0
        activePlayer = "X"
        gameActive = true
        playAgainBtn.isHidden = true
        label.text = "X PLAYS"
        label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0) /* #ff0000 */

        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(UIImage(named: "empty.png"), for: UIControl.State())
        }
        
    }
}
