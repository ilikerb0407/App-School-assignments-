//
//  YellowViewController.swift
//  changePage
//
//  Created by Kai Fu Jhuang on 2022/3/31.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
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
        let count = self.navigationController!.viewControllers.count
        if let preController = self.navigationController?.viewControllers[count-1] {
            self.navigationController?.popToViewController(preController, animated: true)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func PresentBackToLast(_ sender: UIButton) {

        dismiss(animated: true)

    }
    
    
    @objc func push(_ sender: UIButton) {
        if let GreenViewController = storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as? GreenViewController {
            navigationController?.pushViewController(GreenViewController, animated: true)
        }
        
        print ("push")
    }
    
    @objc func presentToNext() {
        if let GreenViewController = storyboard?.instantiateViewController(withIdentifier: "GreenViewController") as? GreenViewController {
            
            let navBar = UINavigationController.init(rootViewController: GreenViewController)
            navBar.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navBar, animated: true, completion: .none)

        }
        
        print ("present")
    }
    
    private var pushButton = UIButton()
    private var presentButton = UIButton()
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
