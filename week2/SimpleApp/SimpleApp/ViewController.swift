//
//  ViewController.swift
//  SimpleApp
//
//  Created by 莊凱富 on 2022/1/15.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = 0
    var randomNum = 0
    
    @IBOutlet weak var textChange: UILabel!
    
    @IBOutlet weak var colorchange: UIView!
    
  
    let text = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.", "Contrary to popular belief, Lorem Ipsum is not simply random text.", "Richard McClintock, a Latin professor at Hampden-Sydney College in ", "looked up one of the more obscure Latin words, consectetur",
    "from a Lorem Ipsum passage, and going through the cities of the word", "This book is a treatise on the theory of ethics, very popular during the.", "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..", ]
    
    
    
    @IBAction func changeColor(sender: UIButton) {
        self.view.backgroundColor = UIColor.randomColor()
    }
    
    
    @IBAction func changeText (sender: UIButton) {
        let randomNumber = Int.random(in: 0...6)
        let i = randomNumber
        textChange.text = String(text[i])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor()
    }

}


extension UIColor{

  static func randomColor() -> UIColor {
        let randomNum = Int.random(in: 0...6)
        let c = randomNum
        let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow, UIColor.cyan, UIColor.brown, UIColor.lightGray ]
         
         return colors[c]

    
   }}




    
    

