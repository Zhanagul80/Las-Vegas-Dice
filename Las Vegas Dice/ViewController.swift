//
//  ViewController.swift
//  Las Vegas Dice
//
//  Created by Zhanagul Tynysbek on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var dice1Text: UILabel!
    @IBOutlet weak var dice2Text: UILabel!
    
    private var counter: Int = 0
    private var hit: Int = 0
    private var miss: Int = 0
    
    let dices: [String:UIImage] = ["1": #imageLiteral(resourceName: "dice-1"), "2": #imageLiteral(resourceName: "dice-2"), "3": #imageLiteral(resourceName: "dice-3"), "4": #imageLiteral(resourceName: "dice-4"), "5": #imageLiteral(resourceName: "dice-5"), "6": #imageLiteral(resourceName: "dice-6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstDice.image = UIImage(named: "dice-1") //#imageLiteral()
        secondDice.image = UIImage(named: "dice-2")
        rollButton.setTitle("Roll", for: .normal) // set text for button
    }

    @IBAction func tapButton(_ sender: UIButton) {
        let dice1 = dices.randomElement()
        firstDice.image = dice1?.value
        dice1Text.text = dice1?.key
        
        let dice2 = dices.randomElement()
        secondDice.image = dice2?.value
        dice2Text.text = dice2?.key
        
        if counter < 5 {
            if dice1?.value == dice2?.value {
                hit += 1
            } else {
                miss += 1
            }
            counter += 1
        } else {
            let title = "Game is over"
            let message = "Hits: \(hit) and Miss: \(miss)"
            let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
            let okAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(okAlertAction)
            present(alertController, animated: true, completion: nil)
            
            hit = 0
            miss = 0
            counter = 0
           
        }
    }
    
}


