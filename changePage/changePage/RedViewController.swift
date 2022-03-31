//
//  ViewController.swift
//  changePage
//
//  Created by Kai Fu Jhuang on 2022/3/30.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        layOut()
        pushButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        presentButton.addTarget(self, action: #selector(presentToNext), for: .touchUpInside)
    }
    
    private var pushButton = UIButton()
    private var presentButton = UIButton()
    
    
    @objc func push(_ sender: UIButton) {
        if let OrangeController = storyboard?.instantiateViewController(withIdentifier: "OrangeViewController") as? OrangeViewController {
            navigationController?.pushViewController(OrangeController, animated: true)
        }
        
        print ("push")
    }
    
    
    
    @objc func presentToNext() {
        if let OrangeController = storyboard?.instantiateViewController(withIdentifier: "OrangeViewController") as? OrangeViewController {

            let navBar = UINavigationController.init(rootViewController: OrangeController)
            navBar.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navBar, animated: true, completion: .none)           
        }
        print ("present")
    }
    
    
    func layOut() {
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(pushButton)
        view.addSubview(presentButton)
       
        
        pushButton.setTitle("Push", for: .normal)
        
        presentButton.setTitle("Present", for: .normal)
       
        
        
        NSLayoutConstraint.activate([pushButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
                                    pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    pushButton.heightAnchor.constraint(equalToConstant: 20),
                                     pushButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
                                    
                                     presentButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2) ,
                                     presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     presentButton.heightAnchor.constraint(equalToConstant: 20),
                                     presentButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
                                    ])
        
    }
    
    
    
    


}

