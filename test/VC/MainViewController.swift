//
//  ViewController.swift
//  test
//
//  Created by panqiaoqiao on 2019/10/30.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let topBtnView      = TopBtnView    (frame: .zero)
    let mainViewMovie   = MainViewMovie (frame: .zero)
    let mainViewMall    = MainViewMall  (frame: .zero)
    let mainViewConcert = MainViewConcert (frame: .zero)
    
    fileprivate var viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        topBtnView.frame = CGRect (x: 0,
                                   y: 45,
                                   width: view.frame.width,
                                   height: 40)
        mainViewMovie.frame = CGRect (x: 0,
                                      y: topBtnView.frame.maxY,
                                      width: view.frame.width,
                                      height: view.frame.height)
        mainViewMall.frame = CGRect (x: 0,
                                     y: topBtnView.frame.maxY,
                                     width: view.frame.width,
                                     height: view.frame.height)
        mainViewConcert.frame = CGRect (x: 0,
                                        y: topBtnView.frame.maxY,
                                        width: view.frame.width,
                                        height: view.frame.height)
        
        mainViewMall.isHidden = true
        mainViewConcert.isHidden = true
        
        topBtnView.movieBtn.rx.tap
            .subscribe(onNext:{self.viewModel.viewJump(index: 1)})
            .disposed(by: disposeBag)
        
        topBtnView.mallBtn.rx.tap
            .subscribe(onNext:{self.viewModel.viewJump(index: 2)})
            .disposed(by: disposeBag)
        
        topBtnView.concertBtn.rx.tap
            .subscribe(onNext:{self.viewModel.viewJump(index: 3)})
            .disposed(by: disposeBag)
        
        
        
        viewModel.fetchData { [weak self] (data) in
            guard let d = data, let self = self else { return }
            self.mainViewMovie.data = d
        }
        
        view.addSubview(topBtnView)
        view.addSubview(mainViewMovie)
        view.addSubview(mainViewMall)
        view.addSubview(mainViewConcert)
    }
}
