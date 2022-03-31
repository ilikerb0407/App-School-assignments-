//
//  BlueViewController.swift
//  changePage
//
//  Created by Kai Fu Jhuang on 2022/3/31.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
        if self.presentingViewController == nil {
            
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done , target: self, action: #selector(PushBackToLast(_:)))
            
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(PresentBackToLast(_:)))
        }
    }
    
    @objc func PresentBackToLast(_ sender: UIButton) {
        
        self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: .none)
    }
    
   
    @objc func PushBackToLast(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
