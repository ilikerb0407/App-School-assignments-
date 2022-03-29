//
//  SelectionView.swift
//  DI-part 1
//
//  Created by Kai Fu Jhuang on 2022/3/28.
//

import UIKit

protocol SelectionViewDataSource: AnyObject {
    
    func indicatorColor(_ selectionView: SelectionView) -> UIColor
    func numberOfButtons(_ selectionView: SelectionView) -> Int
    func selectionView(_ selectionView: SelectionView, at index: Int) -> SelectionView.ButtonModel
    
    
}

// MARK: Extension Datasource
extension SelectionViewDataSource {
    
    // MARK: 3. 底線的顏色，預設為藍色
    func indicatorColor(_ selectionView: SelectionView) -> UIColor {
        return .blue
    }
    
    // MARK: 1. 總共有幾個選項，預設為兩個
    func numberOfButtons(_ selectionView: SelectionView) -> Int {
        return 2
    }
    
    // MARK: 2. 每個選項上面的文字(不知道) 4. 選項文字的顏色，預設為白色 5. 選項文字的 Font，預設為 `UIFont.systemFont(ofSize: 18)
    func selectionView(_ selectionView: SelectionView, at index: Int) -> SelectionView.ButtonModel {
        return .init(title: "default\(index)", titleColor: .white, titleFont: .systemFont(ofSize: 18))
    }
}

@objc protocol SelectionViewDelegate: AnyObject {
    
    // MARK: 1. 使用者選擇了哪一個選項。
    @objc optional func didSelectedButton(_ selectionView: SelectionView, didSelectAt index: Int)
    
    // MARK: 2. 控制使用者是否可以選擇某一個選項，當不能選擇的時候，`IndicatorView` 不會移動，使用者選擇選項的 `Delegate method` 也**不會被觸發**。
    @objc optional func shouldSelectedButton(_ selectionView: SelectionView, shouldSelectAt index: Int) -> Bool
}




//MARK: 1. `SelectionView` 可以提供類似 Button 的效果，讓使用者可以與 `SelectionView` 互動；當點選了某一個選項的時候，底下的 `IndicatorView` 會移動到使用者點選的選項下方。

class SelectionView: UIView {
    
    struct ButtonModel {
        let title: String
        let titleColor: UIColor
        let titleFont: UIFont
    }
    
    var stackView: UIStackView = .init()
    let indicatorView: UIView = .init()
    var indicatorViewWidthConstrain: NSLayoutConstraint = .init()
    var indicatorViewLeftConstrain: NSLayoutConstraint = .init()
    let indicatorHeight: CGFloat = 2
    

    weak var dataSource: SelectionViewDataSource?
    {
        didSet
        {
           drawButton()
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        layout()
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        layout()
    }
    
    weak var delegate: SelectionViewDelegate?
    
    // MARK: Build UI layOut + 物件之間的寬
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let ds = dataSource else { return }
        indicatorViewWidthConstrain.constant = stackView.frame.width / CGFloat(ds.numberOfButtons(self))
    }

    
    func layout(){

        // stackView的條件
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        
        // 下面的線
        indicatorView.backgroundColor = .white
        addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: indicatorHeight).isActive = true
        
        indicatorViewLeftConstrain = indicatorView.leftAnchor.constraint(equalTo: leftAnchor)
        indicatorViewLeftConstrain.isActive = true
        
        indicatorViewWidthConstrain = indicatorView.widthAnchor.constraint(equalToConstant: 0)
        indicatorViewWidthConstrain.isActive = true
        
    }
    
    func drawButton(){
        guard let dataS = dataSource else { return }
        
        for index in 0..<dataS.numberOfButtons(self) {
            let button: UIButton = .init()
            let buttonModel = dataS.selectionView(self, at: index)
            button.setTitle(buttonModel.title, for: .normal)
            button.setTitleColor(buttonModel.titleColor, for: .normal)
            button.titleLabel?.font = buttonModel.titleFont
            
            button.tag = index
            stackView.addArrangedSubview(button)
            
            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        }
        
    }
    
    @objc func tapButton(btn: UIButton) {
        if delegate?.shouldSelectedButton?(self, shouldSelectAt: btn.tag) ?? true {
            delegate?.didSelectedButton?(self, didSelectAt: btn.tag)
            UIView.animate(withDuration: 0.4) {
                let width = self.stackView.frame.width/CGFloat(self.dataSource?.numberOfButtons(self) ?? 0)
                self.indicatorViewLeftConstrain.constant = width * CGFloat(btn.tag)
                self.layoutIfNeeded()
            }
        }
    }

}
