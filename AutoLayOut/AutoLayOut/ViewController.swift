//
//  ViewController.swift
//  AutoLayOut
//
//  Created by Kai Fu Jhuang on 2022/3/30.
//

import UIKit

class ViewController: UIViewController {

    
    private var shapeLayer : CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        yellowCircle.layer.cornerRadius = yellowCircle.bounds.width / 2
        rightCircle.layer.cornerRadius = rightCircle.bounds.width / 2
        leftCircle.layer.cornerRadius = leftCircle.bounds.width / 2
    }
    
    var yellowCircle = UIView()
    var rightCircle = UIView()
    var leftCircle = UIView()
    

    func layout() {
        
        
        self.view.addSubview(yellowCircle)
        let safeArea = view.safeAreaLayoutGuide
        
        yellowCircle.translatesAutoresizingMaskIntoConstraints = false
        yellowCircle.backgroundColor = .yellow
        yellowCircle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        yellowCircle.heightAnchor.constraint(equalTo: yellowCircle.widthAnchor).isActive = true
        yellowCircle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        yellowCircle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        self.view.addSubview(rightCircle)
        rightCircle.translatesAutoresizingMaskIntoConstraints = false
        rightCircle.backgroundColor = .blue
        rightCircle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
        
        rightCircle.heightAnchor.constraint(equalTo: rightCircle.widthAnchor).isActive = true
        rightCircle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50).isActive = true
        rightCircle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        self.view.addSubview(leftCircle)
        leftCircle.translatesAutoresizingMaskIntoConstraints = false
        leftCircle.backgroundColor = .red
        leftCircle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
        
        leftCircle.heightAnchor.constraint(equalTo: leftCircle.widthAnchor).isActive = true
        leftCircle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50).isActive = true
        leftCircle.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true


        
    }
    
    
    

    

}

