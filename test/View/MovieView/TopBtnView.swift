//
//  TopBtnView.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/12.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class TopBtnView: UIView {
    let movieBtn   = UIButton (frame: .zero)
    let mallBtn    = UIButton (frame: .zero)
    let concertBtn = UIButton (frame: .zero)
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBtn(){
        movieBtn.backgroundColor = .red
        movieBtn.setTitle("电影", for: .normal)
        movieBtn.setTitleColor(.white, for: .normal)
        movieBtn.layer.borderWidth = 1.0
        movieBtn.layer.borderColor = UIColor.red.cgColor
        movieBtn.addTarget(self, action: #selector(clickMovieBtn), for: .touchUpInside)
        
        mallBtn.backgroundColor = .white
        mallBtn.setTitle("商城", for: .normal)
        mallBtn.setTitleColor(.red, for: .normal)
        mallBtn.layer.borderWidth = 1.0
        mallBtn.layer.borderColor = UIColor.red.cgColor
        mallBtn.addTarget(self, action: #selector(clickMallBtn), for: .touchUpInside)
        
        concertBtn.backgroundColor = .white
        concertBtn.setTitle("演出", for: .normal)
        concertBtn.setTitleColor(.red, for: .normal)
        concertBtn.layer.borderWidth = 1.0
        concertBtn.layer.borderColor = UIColor.red.cgColor
        concertBtn.addTarget(self, action: #selector(clickConcertBtn), for: .touchUpInside)
        
        self.addSubview(movieBtn)
        self.addSubview(mallBtn)
        self.addSubview(concertBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieBtn.frame = CGRect(x: Int(Double(self.bounds.width) / 2 - 1.5 * 80),
                                y: 0,
                                width: 80,
                                height: Int(Double(self.bounds.height) * 0.8))
        mallBtn.frame = CGRect(x: movieBtn.frame.maxX,
                                y: 0,
                                width: movieBtn.frame.width,
                                height: movieBtn.frame.height)
        concertBtn.frame = CGRect(x: mallBtn.frame.maxX,
                                   y: 0,
                                   width: movieBtn.frame.width,
                                   height: movieBtn.frame.height)
    }
    
    @objc func clickMovieBtn(){
        movieBtn.backgroundColor = .red
        movieBtn.setTitleColor(.white, for: .normal)
        mallBtn.backgroundColor = .white
        mallBtn.setTitleColor(.red, for: .normal)
        concertBtn.backgroundColor = .white
        concertBtn.setTitleColor(.red, for: .normal)
    }
    @objc func clickMallBtn(){
        movieBtn.backgroundColor = .white
        movieBtn.setTitleColor(.red, for: .normal)
        mallBtn.backgroundColor = .red
        mallBtn.setTitleColor(.white, for: .normal)
        concertBtn.backgroundColor = .white
        concertBtn.setTitleColor(.red, for: .normal)
    }
    @objc func clickConcertBtn(){
        movieBtn.backgroundColor = .white
        movieBtn.setTitleColor(.red, for: .normal)
        mallBtn.backgroundColor = .white
        mallBtn.setTitleColor(.red, for: .normal)
        concertBtn.backgroundColor = .red
        concertBtn.setTitleColor(.white, for: .normal)
    }
}
