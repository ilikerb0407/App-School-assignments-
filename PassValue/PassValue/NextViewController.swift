//
//  NextViewController.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpView()
    }
    
    var textField = UITextField()
    var button = UIButton()
    var defaultText = ""
    
    
    // MARK: 1. **請使用程式碼實現這一頁的 UI**
    // MARK: 2. 內容為一個 UITextField, 一個 UIButton, Layout 需求如下：

    func setUpView(){
        textField.text = defaultText
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        view.addSubview(button)
        
        textField.borderStyle = .roundedRect
        button.backgroundColor = .blue
        button.setTitle("Press", for: .normal)
        
        NSLayoutConstraint.activate([textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
                                     textField.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
                                     textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     textField.heightAnchor.constraint(equalToConstant: 40),
                                    
                                     button.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
                                     button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.heightAnchor.constraint(equalToConstant: 40),
                                     button.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)])
        
    }
    
    


}
