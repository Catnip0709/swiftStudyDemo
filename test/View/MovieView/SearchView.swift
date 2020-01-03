//
//  RecommendView.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/5.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class SearchView: UIView {
    fileprivate let topTimeLable   = UILabel     (frame: .zero)
    fileprivate let topRedBagBtn   = UIButton    (frame: .zero)
    fileprivate let topSearchText  = UITextField (frame: .zero)
    fileprivate let topSearchBtn   = UIButton    (frame: .zero)
    var clickBtnHander: ((Int) -> Void)? = nil
    
    override init(frame: CGRect) { // 构造函数
        super.init(frame: frame)
        
        topTimeLable.text = " 已浏览时间：0s"
        
        topRedBagBtn.isHidden = true
        topRedBagBtn.setImage(UIImage(named:"redbag.png"), for: .normal)
    
        topSearchText.borderStyle = .line
        topSearchText.placeholder = " please input..."
        topSearchText.clearButtonMode = .whileEditing   //编辑时出现清除按钮
        
        topSearchBtn.addTarget(self, action: #selector(ClickBtn), for: .touchUpInside)
        topSearchBtn.setImage(UIImage(named: "Search.png"), for: .normal)
        
        
        self.addSubview(topRedBagBtn)
        self.addSubview(topTimeLable)
        self.addSubview(topSearchBtn)
        self.addSubview(topSearchText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){ // 布局调整函数
        super.layoutSubviews()
        topTimeLable.frame  = CGRect(x: 10,
                                     y: 0,
                                     width: self.frame.width * 0.4,
                                     height: self.frame.height / 2)
        topRedBagBtn.frame  = CGRect(x: topTimeLable.frame.maxX,
                                     y: topTimeLable.frame.minY,
                                     width: 25,
                                     height: topTimeLable.frame.height)
        topSearchText.frame = CGRect(x: 10,
                                     y: topTimeLable.frame.maxY,
                                     width: self.frame.width * 0.8,
                                     height: self.frame.height / 2)
        topSearchBtn.frame  = CGRect(x: topSearchText.frame.maxX + 8,
                                     y: topTimeLable.frame.maxY,
                                     width: self.frame.width * 0.1,
                                     height: self.frame.height / 2)
        animation()
    }
    func animation() {
        func angle2Radion(angle: Float) -> Float {
            return angle / Float(180.0 * Double.pi)
        }
        
        let animati = CAKeyframeAnimation(keyPath: "transform.rotation")
        // rotation 旋转，需要添加弧度值
        // 角度转弧度
        animati.values = [angle2Radion(angle: -100), angle2Radion(angle: 100), angle2Radion(angle: -50)]
        animati.repeatCount = MAXFLOAT
        animati.autoreverses = false
        topRedBagBtn.layer.add(animati, forKey: nil)
    }
    
    func resetText (content: String) {
        topTimeLable.text = content
    }
    
    func RedBagBtnHidden () {
        topRedBagBtn.isHidden = false
    }
    
    @objc func ClickBtn(){
        switch(topSearchText.text){
            case "0":
                clickBtnHander?(0)
            case "1":
                clickBtnHander?(1)
            case "2":
                clickBtnHander?(2)
            default:
                clickBtnHander?(3)
        }
    }
}


