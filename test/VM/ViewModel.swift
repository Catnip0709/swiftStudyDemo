//
//  ViewModel.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/8.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ViewModel{
    var dataSource = MovieData()
    var delegate: ViewController?
    
    func viewJump(index: Int){
        switch index{
            case 1:
                self.delegate?.mainViewMovie.isHidden = false
                self.delegate?.mainViewMall.isHidden  = true
                self.delegate?.mainViewConcert.isHidden  = true
            case 2:
                self.delegate?.mainViewMovie.isHidden = true
                self.delegate?.mainViewMall.isHidden  = false
                self.delegate?.mainViewConcert.isHidden  = true
            case 3:
                self.delegate?.mainViewMovie.isHidden = true
                self.delegate?.mainViewMall.isHidden  = true
                self.delegate?.mainViewConcert.isHidden  = false
        default:
            break
        }
    }
    
    func fetchData(_ completion: ((MovieData?) -> Void)? = nil) {
        DispatchQueue.global().async {
            var MovieActorInfo1 = [People]()
            let p11 = People(t_photo: UIImage(named: "yyqx.png")!, t_name: "易烊千玺", t_subname:"饰 小北")
            let p12 = People(t_photo: UIImage(named: "zdy.png")!,  t_name: "周冬雨",   t_subname:"饰 陈念")
            let p13 = People(t_photo: UIImage(named: "zy.png")!,   t_name: "周也",     t_subname:"饰 魏莱")
            let p14 = People(t_photo: UIImage(named: "yf.png")!,   t_name: "周冬雨",   t_subname:"饰 郑易")
            let p15 = People(t_photo: UIImage(named: "lr.png")!,   t_name: "周冬雨",   t_subname:"饰 罗婷")
            
            MovieActorInfo1.append(p11)
            MovieActorInfo1.append(p12)
            MovieActorInfo1.append(p13)
            MovieActorInfo1.append(p14)
            MovieActorInfo1.append(p15)
            let MovieInfo1 = Movie(t_name: "少年的你", t_time: "2019-10-25", t_actor: MovieActorInfo1, t_score: "9.4", t_pic: UIImage(named:"sndn.jpg")!)
            self.dataSource.movie.append(MovieInfo1)
            
            // 电影2
            var MovieActorInfo2 = [People]()
            let p21 = People(t_photo: UIImage(named:"swxg.jpg")!, t_name: "施瓦辛格", t_subname: "T-800")
            let p22 = People(t_photo: UIImage(named:"ld.jpg")!, t_name: "琳达", t_subname: "Sara")
            let p23 = People(t_photo: UIImage(named:"mkz.jpg")!, t_name: "麦肯", t_subname: "Grace")
            MovieActorInfo2.append(p21)
            MovieActorInfo2.append(p22)
            MovieActorInfo2.append(p23)
            let MovieInfo2 = Movie(t_name: "终结者", t_time: "2019-11-01", t_actor: MovieActorInfo2, t_score: "8.6", t_pic: UIImage(named:"zjz.jpg")!)
            self.dataSource.movie.append(MovieInfo2)
            self.dataSource.movie.append(MovieInfo2)
            self.dataSource.movie.append(MovieInfo1)
            
            DispatchQueue.main.async {
                completion?(self.dataSource)
            }
        }
    }
}

