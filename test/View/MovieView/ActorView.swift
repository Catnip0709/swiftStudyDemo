//
//  ActorView.swift
//  test
//
//  Created by panqiaoqiao on 2019/11/6.
//  Copyright © 2019 panqiaoqiao. All rights reserved.
//

import Foundation
import UIKit

class ActorCell: UITableViewCell{
    var name: UILabel!
    var subname: UILabel!
    var photo: UIImageView!
    var VipIcon: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        photo = UIImageView.init(frame: CGRect(x: 20, y: 30, width: 140, height: 140))
        photo.image = UIImage.init(named:"HeloIcon.png")
        self.contentView.addSubview(photo!)
        
        VipIcon = UIImageView.init(frame: CGRect(x: photo.frame.maxX - 20, y: photo.frame.minY - 20, width: 50, height: 50))
        VipIcon.image = UIImage.init(named:"Vip.png")
        VipIcon.layer.masksToBounds = true
        VipIcon.layer.cornerRadius = 40
        VipIcon.isHidden = true
        self.contentView.addSubview(VipIcon)
        
        name = UILabel.init(frame: CGRect(x: photo.frame.maxX + 50, y: 60, width: 100,height: 30))
        name.text = "姓名"
        name.textAlignment = .center
        self.contentView.addSubview(name!)
        
        subname = UILabel.init(frame: CGRect(x: name.frame.minX, y: name.frame.maxY + 30, width: 100, height: 30))
        subname.text = "角色"
        subname.textColor = .gray
        subname.textAlignment = .center
        self.contentView.addSubview(subname!)
        
        animation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation() {
        func angle2Radion(angle: Float) -> Float {
            return angle / Float(180.0 * Double.pi)
        }
        
        let animati = CAKeyframeAnimation(keyPath: "transform.rotation")
        // rotation 旋转，需要添加弧度值
        // 角度转弧度
        animati.values = [angle2Radion(angle: -100), angle2Radion(angle: 100), angle2Radion(angle: -50)]
        animati.repeatCount = MAXFLOAT
        animati.autoreverses = false
        VipIcon.layer.add(animati, forKey: nil)
    }
    
    // 返回标识符
    static func Identity()->String{
        return "ActorCell"
    }
}

class ActorView: UIView {
    fileprivate let actorTableView = UITableView(frame: .zero)
    var viewJumpHandler: ((People) -> Void)?
    var actorItems = [People]() {
        didSet{
            guard actorItems.count > 0 else { return }
            actorTableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupTableView(){
        actorTableView.dataSource = self
        actorTableView.delegate   = self
        actorTableView.register(ActorCell.classForCoder(), forCellReuseIdentifier: ActorCell.Identity())  //注册cell
        addSubview(actorTableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        actorTableView.frame = self.bounds
    }
}

extension ActorView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActorCell.Identity(), for: indexPath)
        (cell as? ActorCell)?.name.text    = actorItems[indexPath.row].name
        (cell as? ActorCell)?.subname.text = actorItems[indexPath.row].subname
        (cell as? ActorCell)?.photo.image  = actorItems[indexPath.row].photo
        (cell as? ActorCell)?.VipIcon.isHidden = !(indexPath.row < 2)
        return cell
    }
}

extension ActorView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        print(actorItems[indexPath.row].name)
//        viewJumpHandler?(actorItems[indexPath.row])
    }
}
