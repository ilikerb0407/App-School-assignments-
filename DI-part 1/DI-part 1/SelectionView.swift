//
//  SelectionView.swift
//  DI-part 1
//
//  Created by Kai Fu Jhuang on 2022/3/28.
//

import UIKit

protocol SelectionViewDataSource {
    func indicatorColor() -> UIColor
    func numberOfButtons() -> Int
    // 決定button的樣子
    func selectionView() -> SelectionView.ButtonModel
}

// MARK: 用extension 才會有body可以寫,宣告default該長的樣子, README 第四點
extension SelectionViewDataSource {
    
    func indicatorColor() -> UIColor {
        return .blue
    }
    
    func numberOfButtons() -> Int {
        return 2
    }
    
    func selectionView() -> SelectionView.ButtonModel {
        return .init(title: "default", titleColor: .white, titleFont: .systemFont(ofSize: 18))
    }
}





class SelectionView: UIView {
    
    struct ButtonModel {
        let title: String
        let titleColor: UIColor
        let titleFont: UIFont
    }

    var dataSource: SelectionViewDataSource?

}
