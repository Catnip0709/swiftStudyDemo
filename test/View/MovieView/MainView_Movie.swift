//
//  MainView_Movie.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/12.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit


class MainViewMovie: UIView{
    fileprivate let searchView = SearchView (frame: .zero)
    fileprivate let movieView  = MovieView  (frame: .zero)
    fileprivate let actorView  = ActorView  (frame: .zero)
    fileprivate var timer: Timer?
    
    var data = MovieData() {
        didSet {
            setupInfo()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        var time = 1
        timer = Timer(timeInterval: 1, repeats: true, block: { [weak self] (_) in
            self?.searchView.resetText(content: " 已浏览时间：\(time)s")
            if time >= 5 {
                self?.searchView.RedBagBtnHidden()
            }
            time += 1
        })
        
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfo(){
        searchView.clickBtnHander = { [weak self] (num) in
            guard let self = self else { return }
            self.movieView.scrollToTargetItem(idx: num)
            self.movieView.selectedCellHandler?(IndexPath(row: num, section: 0))
        }
        movieView.movieItems = data.movie
        
        movieView.selectedCellHandler = { [weak self] (idxPath) in
            guard let self = self else { return }
            self.actorView.actorItems = self.data.movie[idxPath.row].actor
        }
        
        actorView.actorItems = data.movie.first?.actor ?? data.movie[0].actor

        actorView.viewJumpHandler = { [weak self] (people) in
            guard let self = self else { return }
            self.actorView.actorItems = [people]
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: Int(self.bounds.width),
                                  height: 60)
        movieView.frame  = CGRect(x: searchView.frame.minX,
                                  y: searchView.frame.maxY + 10,
                                  width: searchView.frame.width,
                                  height: 230)
        actorView.frame  = CGRect(x: searchView.frame.minX,
                                  y: movieView.frame.maxY,
                                  width: searchView.frame.width,
                                  height: 450)
        self.addSubview(searchView)
        self.addSubview(movieView)
        self.addSubview(actorView)
    }
    
    func resetText(content: String){
        searchView.resetText(content: content)
    }
}
