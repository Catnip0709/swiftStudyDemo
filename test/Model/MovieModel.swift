//
//  Model.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/5.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

/*********** 数据 ***************/
struct People{
    var photo: UIImage
    var name: String
    var subname:String
    
    init(t_photo: UIImage, t_name: String, t_subname: String){
        photo   = t_photo
        name    = t_name
        subname = t_subname
    }
}
struct Movie {
    var name: String
    var time: String
    var pic : UIImage
    var score: String
    var actor = [People]()
    
    init(t_name: String, t_time: String, t_actor: [People], t_score: String, t_pic: UIImage){
        name  = t_name
        time  = t_time
        actor = t_actor
        score = t_score
        pic   = t_pic
    }
}
struct MovieData{
    var movie            = [Movie]()
    var tvDateSource     = [People]()
    var selectedIdx: Int = 0
}
