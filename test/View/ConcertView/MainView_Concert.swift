//
//  MainView_Concert.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/28.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class MainViewConcert: UIView{
    var testLable = UILabel(frame: .zero)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLable.text = "演唱会测试"
        
        testLable.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.frame.width,
                                 height: 150)
        
        self.addSubview(testLable)
    }
}
