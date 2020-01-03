//
//  BtnGroup.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/13.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class BtnGroupCell: UICollectionViewCell{
//    var icon : UIImageView!
    var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        icon = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
//        icon.image = UIImage.init(named: "pkq.jpg")
//        label = UILabel.init(frame: CGRect(x: 0, y: icon.frame.maxY + 5, width: icon.frame.width, height: 10))
        label = UILabel.init(frame: CGRect(x: 0, y: 5, width: 20, height: 10))
        label.text  = "皮卡丘"
        label.textAlignment = .center
        self.backgroundColor = .orange
        
//        self.contentView.addSubview(icon)
        self.contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func Identity() -> String {
        return "BtnGroupCell"
    }
}
class BtnGroupView: UIView{
    var btnGroup = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        btnGroup.frame = self.bounds
        addSubview(btnGroup)
        
        //定义布局方式以及单元格大小
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 70)
        
        //创建集合视图
        self.btnGroup = UICollectionView(frame: self.bounds,
                                               collectionViewLayout: flowLayout)
        self.btnGroup.backgroundColor = UIColor.red
        
        //创建一个重用的单元格
        self.btnGroup.register(BtnGroupCell.self,
                               forCellWithReuseIdentifier: BtnGroupCell.Identity())


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
