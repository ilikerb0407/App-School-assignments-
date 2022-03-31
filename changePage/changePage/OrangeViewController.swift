//
//  OrangeViewController.swift
//  changePage
//
//  Created by Kai Fu Jhuang on 2022/3/31.
//

import UIKit

class OrangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        pushButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        layOut()
        presentButton.addTarget(self, action: #selector(presentToNext), for: .touchUpInside)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        if self.presentingViewController == nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done , target: self, action: #selector(PushBackToLast(_:)))
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "X", style: .done, target: self, action: #selector(PresentBackToLast(_:)))
        }

    }
    

    @objc func PushBackToLast(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        

    }
    @objc func PresentBackToLast(_ sender: UIButton) {

        dismiss(animated: true)

    }
    
    @objc func push(_ sender: UIButton) {
        if let YellowViewController = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as? YellowViewController {
            navigationController?.pushViewController(YellowViewController, animated: true)
        }
        
        print ("push")
    }
    
    @objc func presentToNext() {
        if let YellowViewController = storyboard?.instantiateViewController(withIdentifier: "YellowViewController") as? YellowViewController {
            
            let navBar = UINavigationController.init(rootViewController: YellowViewController)
            navBar.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navBar, animated: true, completion: .none)
            
        }
        print ("present")
    }
    
    private var backButton = UIButton()
    private var pushButton = UIButton()
    private var presentButton = UIButton()
    private var exitButton = UIButton()
    
    func layOut() {
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pushButton)
        view.addSubview(presentButton)
        view.addSubview(exitButton)
        pushButton.setTitle("Push", for: .normal)
        presentButton.setTitle("Present", for: .normal)
//        exitButton.setTitle("X", for: .normal)
        
        NSLayoutConstraint.activate([pushButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2),
                                    pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                    pushButton.heightAnchor.constraint(equalToConstant: 20),
                                    pushButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
                                    
                                     presentButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 3 * 2) ,
                                     presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     presentButton.heightAnchor.constraint(equalToConstant: 20),
                                     presentButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
                                     
                                     exitButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 10 ) ,
                                     exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150),
                                     exitButton.heightAnchor.constraint(equalToConstant: 20),
                                     exitButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -300)
                                    ])
        
    }
    
    
    

}
