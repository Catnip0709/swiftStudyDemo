//
//  ActorViewController.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/8.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class ActorViewController: UIViewController{
    var testLable = UILabel()
    let jumpBtn = UIButton(type: .system)
    
    var peopleData: People?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        jumpBtn.frame = CGRect(x:0,
                               y:0,
                               width:view.frame.width,
                               height:view.frame.height / 2)
        jumpBtn.addTarget(self, action: #selector(pageReturn), for: .touchDown)
        
        
        testLable.text = peopleData?.name ?? ("null")
        testLable.frame = CGRect(x: 0,
                                 y: jumpBtn.frame.maxY,
                                 width: view.frame.width,
                                 height: view.frame.height / 2)
        testLable.backgroundColor = .red
        
        
        view.addSubview(jumpBtn)
        view.addSubview(testLable)
    }
    @objc func pageReturn() {
        self.dismiss(animated: true, completion: nil) //返回主页面
    }
    
}
