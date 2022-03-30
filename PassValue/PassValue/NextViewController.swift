//
//  NextViewController.swift
//  PassValue
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

//step 1
protocol BackToMainVCDelegate {
    func updateText(_ text: String)
    func sendText(_ text: String, index: Int)
}

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        
        setUpView()
    }
    
    private var textField = UITextField()
    private var button = UIButton()
    var defaultText = ""
    
    // Closure step 1
    var passToCell: ((String) -> ())?
    
    
    //step 2
    var delegate: BackToMainVCDelegate?
    var index = 0
    
    @objc func sendData () {
        
        // 如果第二頁是因為點擊第一頁 Cell 而出現，則按下按鈕會將原本 Cell 的文字修改成 TextField 的內容。
        
        
        // Closure step 2
        guard let text = textField.text else { return }
        passToCell!(text)
        
        // Delegate: 在這頁實作一個protocol
        // step 3
        if defaultText == "" {
            delegate?.updateText(textField.text!)
        } else {
            delegate?.sendText(textField.text!, index: index )
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: 1. **請使用程式碼實現這一頁的 UI** 
    // MARK: 2. 內容為一個 UITextField, 一個 UIButton, Layout 需求如下

    func setUpView() {
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
