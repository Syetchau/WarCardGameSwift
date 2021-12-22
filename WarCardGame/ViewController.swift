//
//  ViewController.swift
//  WarCardGame
//
//  Created by LiewSyetChau on 6/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var computerScore: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var leftGeneratedNumber = 0
    var rightGeneratedNumber = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomCard()
    }

    @IBAction func dealTapped(_ sender: Any) {
        countingScore()
        generateRandomCard()
    }
    
    func generateRandomCard() {
        //randomCard
        let leftRandomNumber = Int.random(in: 2...14)
        let rightRandomNumber = Int.random(in: 2...14)
        
        leftGeneratedNumber = leftRandomNumber
        rightGeneratedNumber = rightRandomNumber
        
        //show card image
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
    }
    
    func countingScore() {
        //countingScore logic
        if leftGeneratedNumber > rightGeneratedNumber {
            //left side win
            leftScore += 1
            playerScore.text = String(leftScore)
        } else if leftGeneratedNumber < rightGeneratedNumber {
            //right side win
            rightScore += 1
            computerScore.text = String(rightScore)
        } else {
            //tie
            showToast(message: "Tie", font: .systemFont(ofSize: 14.0))
        }
    }
    
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

