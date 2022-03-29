//
//  ViewController.swift
//  DI-part 1
//
//  Created by Kai Fu Jhuang on 2022/3/28.
//

import UIKit

// 使用者控制SelectionView
class ViewController: UIViewController,SelectionViewDelegate, SelectionViewDataSource {
    
//    func textColor(_ selectionView: SelectionView) -> UIColor {
//        switch selectionView {
//        case selectedViewTop:
//            return .green
//        case selectedViewBottom:
//            return .white
//        default:
//            return .cyan
//        }
//    }
//    
//    func textFont(_ selectionView: SelectionView) -> UIFont {
//        switch selectionView {
//        case selectedViewTop:
//            return .boldSystemFont(ofSize: 20)
//        case selectedViewBottom:
//            return .italicSystemFont(ofSize: 40)
//        default:
//            return .systemFont(ofSize: 20)
//        }
//    }
//    
    
    // 用enum 來宣告顏色
    enum colorType: String {
        
        case red = "Red"
        case yellow = "Yellow"
        case blue = "Blue"
        case green = "Green"
        case brown = "Brown"
        case white = "White"
        
        
        var color : UIColor {
            switch self {
            case .red:
                return .red
            case .yellow:
                return .yellow
            case .blue:
                return .blue
            case .green:
                return .green
            case .brown:
                return .brown
            case .white:
                return .white
            }
        }
        var defaultBottonColor : UIColor {.white}
        var defaultBottonFont : UIFont {.systemFont(ofSize: 18)}
        
        var bottonModel : SelectionView.ButtonModel
        {
            return .init(title: self.rawValue, titleColor: defaultBottonColor, titleFont: defaultBottonFont)
        }
        
    }
    // MARK: selectionDataSource
    // 上面2個botton 下面3 個
    func numberOfButtons(_ selectionView: SelectionView) -> Int {
        switch selectionView {
        case selectedViewTop:
            return colorTypesTop.count
        case selectedViewBottom:
            return colorTypesBottom.count
        default:
            return 0
        }
    }
    
    // 使用者從藍色改成白色
    func indicatorColor() -> UIColor {
        return .white
    }
    
    func selectionView(_ selectionView: SelectionView, at index: Int) -> SelectionView.ButtonModel {
        switch selectionView {
        case selectedViewTop:
            return colorTypesTop[index].bottonModel
        case selectedViewBottom:
            return colorTypesBottom[index].bottonModel
        default:
            return .init(title: "", titleColor: .white, titleFont: .systemFont(ofSize: 20))
        }
    }
    
    
    // MARK: selectionDelegate
    func shouldSelectedButton(_ selectionView: SelectionView, shouldSelectAt index: Int) -> Bool {
        switch selectionView {
        case selectedViewTop:
            return true
        case selectedViewBottom:
            //寫判斷是在didSelect裡面，確定可否移動
            return selectedViewBottomCanMove
        default:
            return true
        }
    }
    
    var selectedViewBottomCanMove: Bool = true
    
    func didSelectedButton(_ selectionView: SelectionView, didSelectAt index: Int) {
        switch selectionView {
        case selectedViewTop:
            colorViewTop.backgroundColor = colorTypesTop[index].color
            
//             如果選到的顏色是黃色的話，下面的buttom就不可以動，寫死的方法
//            if colorTypesTop[index].color == .yellow {
//                selectedViewBottomCanMove = false
//            } else {
//                selectedViewBottomCanMove = true
//            }
//
            selectedViewBottomCanMove = index == colorTypesTop.count - 1 ? false : true
        case selectedViewBottom:
            colorViewBottom.backgroundColor = colorTypesBottom[index].color
            print("12333")
        default:
            print("123")
        }
    }
    
    
    // MARK: 使用者可以控制的地方
    var colorTypesTop: Array<colorType>
    {
        return [.red, .yellow, .blue , .green]
    }
    var colorTypesBottom: Array<colorType>
    {
        return [.yellow, .blue, .brown, .white]
    }
    
    let selectedViewTop: SelectionView = .init()
    let selectedViewBottom: SelectionView = .init()
    //上下的View
    let colorViewTop: UIView = .init()
    let colorViewBottom: UIView = .init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        selectedViewTop.delegate = self
        selectedViewTop.dataSource = self
        selectedViewBottom.delegate = self
        selectedViewBottom.dataSource = self
        
        layOut()
    }
    
    func layOut() {
        //初始化的畫面
        colorViewTop.backgroundColor = colorTypesTop.first?.color
        colorViewBottom.backgroundColor = colorTypesBottom.first?.color
        
        let stackView = UIStackView.init(arrangedSubviews: [selectedViewTop,colorViewTop,selectedViewBottom,colorViewBottom])
        view.addSubview(stackView)
        let safeArea = view.safeAreaLayoutGuide
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100 ).isActive = true
        stackView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }


}

