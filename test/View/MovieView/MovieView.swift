//
//  MovieView.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/6.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell{
    var MoviePic : UIImageView!
    var MovieName: UILabel!
    var MovieTime: UILabel!
    var movieScore: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        MoviePic = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 120, height: 150))
        MoviePic.image = UIImage.init(named:"HeloIcon.png")
        
        
        MovieName = UILabel.init(frame: CGRect(x: MoviePic.frame.minX, y: MoviePic.frame.maxY + 5, width: MoviePic.frame.width, height: 25))
        MovieName.text = "电影名"
        MovieName.textAlignment = .center
        
        MovieTime = UILabel.init(frame: CGRect(x: MovieName.frame.minX, y: MovieName.frame.maxY, width: MoviePic.frame.width,height: 15))
        MovieTime.text = "0000-00-00"
        MovieTime.textColor = .gray
        MovieTime.textAlignment = .center
        MovieTime.font = UIFont.init(descriptor: .init(), size: 16)
        
        
        movieScore = UILabel.init(frame: CGRect(x: 5, y: MoviePic.frame.maxY - 20, width: 50, height: 20))
        movieScore.text = "0.0"
        movieScore.textColor = .orange
        movieScore.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        self.contentView.addSubview(MovieTime)
        self.contentView.addSubview(MovieName)
        self.contentView.addSubview(MoviePic)
        self.contentView.addSubview(movieScore)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func Identity() -> String {
        return "MovieCell"
    }
}
class MovieLayout: UICollectionViewFlowLayout{
    override init(){
        super.init()
        self.itemSize = CGSize(width: 140, height: 190) //设置每一个cell的宽高
        self.scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepare() { // 目的：初始时cell1在最中央
        let inset = (self.collectionView?.bounds.width ?? 0)  * 0.5 - self.itemSize.width * 0.5
        self.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    override func shouldInvalidateLayout(forBoundsChange rect: CGRect) -> Bool {
        return true
    }
    
    //缩放
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)!
        let centetX = (self.collectionView?.contentOffset.x ?? 0) + self.collectionView!.frame.size.width/2; //计算CollectionView最中心的x值
        for attrs in array {
            let delta = abs(attrs.center.x - centetX); //根据间距值  计算cell的缩放的比例
            let scale = 1 - delta/self.collectionView!.frame.size.width;//这里scale 必须要 小于1
            attrs.transform = CGAffineTransform(scaleX: scale, y: scale);  //设置缩放比例
        }
        return array
    }
}
class MovieView: UIView {
    fileprivate let movieLabel = UILabel()
    fileprivate let seemoreLable = UILabel()
    fileprivate let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var scrollSelectedIdx: Int = 0
    var selectedCellHandler: ((IndexPath) -> Void)?
    
    var movieItems = [Movie]() {
        didSet { //当movieItems改变时触发
            guard movieItems.count > 0 else { return }
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCollectionView() {
        let layout = MovieLayout()
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.Identity())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        movieLabel.text = "  热门影片"
        movieLabel.textColor = .gray
        movieLabel.font = UIFont.init(descriptor: .init(), size: 15)
        
        seemoreLable.text = "查看更多 >"
        seemoreLable.textColor = .lightGray
        seemoreLable.font = UIFont.init(descriptor: .init(), size: 13)
        
        addSubview(seemoreLable)
        addSubview(movieLabel)
        addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        movieLabel.frame = CGRect(x: 10,
                                  y: 0,
                                  width: Int(Double(self.bounds.width) * 0.75),
                                  height: Int(Double(self.bounds.height) * 0.1))
        
        seemoreLable.frame = CGRect(x: Int(Double(self.bounds.width) * 0.75),
                                    y: 0,
                                    width: Int(Double(self.bounds.width) * 0.25),
                                    height: Int(Double(self.bounds.height) * 0.1))
        
        collectionView.frame = CGRect(x: 0,
                                      y: Int(Double(self.bounds.height) * 0.1),
                                      width: Int(self.bounds.width),
                                      height: Int(Double(self.bounds.height) * 0.9))
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollToSelected()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToSelected()
    }
    
    func scrollToTargetItem(idx: Int){
        self.collectionView.scrollToItem(at: IndexPath(row: idx, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension MovieView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isSelected = true
        collectionView.layoutAttributesForItem(at: indexPath)
        
        selectedCellHandler?(indexPath)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isSelected = false;
        collectionView.cellForItem(at: indexPath)?.backgroundColor = .white
    }
    
    func scrollToSelected() {
        if self.collectionView.contentOffset.x <= 75 {
            self.scrollSelectedIdx = 0
        }
        else if self.collectionView.contentOffset.x < 225 {
            self.scrollSelectedIdx = 1
        }
        else if self.collectionView.contentOffset.x < 375 {
            self.scrollSelectedIdx = 2
        }
        else if self.collectionView.contentOffset.x < 525 {
            self.scrollSelectedIdx = 3
        }
        self.collectionView.scrollToItem(at: IndexPath(row: scrollSelectedIdx, section: 0), at: .centeredHorizontally, animated: true)
        selectedCellHandler?(IndexPath(row: scrollSelectedIdx, section: 0))
    }
}

extension MovieView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.Identity(), for: indexPath)
        (cell as? MovieCell)?.MovieName.text  = movieItems[indexPath.row].name
        (cell as? MovieCell)?.MovieTime.text  = movieItems[indexPath.row].time
        (cell as? MovieCell)?.MoviePic.image  = movieItems[indexPath.row].pic
        (cell as? MovieCell)?.movieScore.text = movieItems[indexPath.row].score
        return cell
    }
    
    
}
