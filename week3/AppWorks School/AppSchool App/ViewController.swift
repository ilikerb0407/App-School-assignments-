//
//  ViewController.swift
//  AppSchool App
//
//  Created by 莊凱富 on 2022/1/20.
//

import UIKit

class ViewController: UIViewController {
        
    var accounttext = ""
    var passwordtext = ""
    var checktext = ""
    
    let correctaccounttextfield = "appworks_school@gmail.com"
    let correctpasswordtextfield = 1234
    
    
    @IBOutlet weak var segmentedControl : UISegmentedControl!
    
    @IBOutlet weak var accounttextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var checkTextfield: UITextField!
    
    @IBOutlet weak var checklabel: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func segmentedControl (_ sender : UISegmentedControl) {
        
        segmentedControl.selectedSegmentTintColor = .black
    }
    
    
    private enum Pagetype {
        case login
        case signup

    }
    
    private var currentPage: Pagetype = .login {
        didSet{
            loginchangecheckcolor(pagetype: currentPage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginchangecheckcolor(pagetype: .login)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
    }
    
    private func loginchangecheckcolor (pagetype: Pagetype) {
        if pagetype ==  .login {
            checkTextfield.backgroundColor = UIColor.gray
            checklabel.textColor = UIColor.darkGray
            checkTextfield.isUserInteractionEnabled = false
            
        }
        else {
            checkTextfield.backgroundColor = UIColor.white
            checklabel.textColor = UIColor.black
            checkTextfield.isUserInteractionEnabled = true
        }
    }
    
    
  
    @IBAction func segementedControlchange(_ sender : UISegmentedControl) {
        currentPage = sender.selectedSegmentIndex == 0 ? .login : .signup
    }
    
    
    
    
    @IBAction func switchlogInSignUpAction (_ sender : Any) {
        switch segmentedControl.selectedSegmentIndex
           {
           case 0:
            if accounttextfield.text != correctaccounttextfield {
                let alert = UIAlertController(title: "Error", message: "Login fail", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler:{
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            
            }
            
            if passwordTextfield.text != correctaccounttextfield {
                let alert = UIAlertController(title: "Error", message: "Login fail", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler: {
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
           case 1:
            if accounttextfield.text == "" {
                let alert = UIAlertController(title: "Error", message: "Account should not be empty", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler: {
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
            if passwordTextfield.text == "" {
                let alert = UIAlertController(title: "Error", message: "Password should not be empty", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler: {
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
            if checkTextfield.text == "" {
                let alert = UIAlertController(title: "Error", message: "Check Password should not be empty", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler: {
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
            
            if passwordTextfield.text != checkTextfield.text {
                let alert = UIAlertController(title: "Error", message: "Signup fail", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK" , style: .default, handler: {
                    action in
                    self.update()
                })
                
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
           default:
               break
           }
    }
    
    func update(){
        accounttextfield.text = String(accounttext)
        passwordTextfield.text = String(passwordtext)
        checkTextfield.text = String(checktext)
    }
}

