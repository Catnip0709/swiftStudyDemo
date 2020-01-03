//
//  MainView_Mall.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/12.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class MainViewMall: UIView{
    var imageGroup =  [UIImage]()
    var imageView  = UIImageView(frame: .zero)
    var btnGroupView = BtnGroupView(frame: .zero)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageGroup.append(UIImage(named: "mall1.jpg")!)
        imageGroup.append(UIImage(named: "mall2.jpg")!)
        imageGroup.append(UIImage(named: "mall3.jpg")!)
        
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.frame.width,
                                 height: 150)
        imageView.animationImages = imageGroup
        imageView.animationDuration = 5
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
        
        btnGroupView.frame = CGRect(x: 0,
                                    y: imageView.frame.maxY,
                                    width: self.frame.width,
                                    height: 300)
        btnGroupView.backgroundColor = .lightGray
        
        self.addSubview(imageView)
        self.addSubview(btnGroupView)
    }
}
