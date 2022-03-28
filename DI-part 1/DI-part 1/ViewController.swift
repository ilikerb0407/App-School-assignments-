//
//  ViewController.swift
//  DI-part 1
//
//  Created by Kai Fu Jhuang on 2022/3/28.
//

import UIKit

// 使用者控制SelectionView
class ViewController: UIViewController, SelectionViewDelegate, SelectionViewDataSource {
    
    
    // 用enum 來宣告顏色
    enum colorType: String {
        case red = "Red"
        case yellow = "Yellow"
        case blue = "Blue"
        
        var color : UIColor {
            switch self {
            case .red:
                return .red
            case .yellow:
                return .yellow
            case .blue:
                return .blue
            }
        }
        private var defaultBottonColor : UIColor {.white}
        private var defaultBottonFont : UIFont {.systemFont(ofSize: 18)}
        
        var bottonModel : SelectionView.ButtonModel {
            return .init(title: self.rawValue, titleColor: defaultBottonColor, titleFont: defaultBottonFont)
        }
        
    }
    
    // 上面2個botton 下面3 個
    func numberOfButtons() -> Int {
    
    }
    
    // 使用者從藍色改成白色
    func indicatorColor() -> UIColor {
        return .white
    }
    
    
    func selectionView() -> SelectionView.ButtonModel {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }


}

