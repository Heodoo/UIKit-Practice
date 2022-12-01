//
//  MatjibView.swift
//  UIKit_Study_1201
//
//  Created by MacBook on 2022/12/02.
//

import UIKit
import Kingfisher
import SnapKit

class MatjibView: UIView {
    
    var matjib : Matjib
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    init(matjib: Matjib) {
        
        self.matjib = matjib
        super.init(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        itemsInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        itemsInit()
    }
    
    
    let nameLabel = UILabel().then {
        $0.text = matjibs[0].name
    }
    
    
    
    let imageView = UIImageView().then{
        $0.load(url: URL(string: matjibs[0].image)!)
    }
    
    // (extension UIImgaeView func load)->(kingfisher)
    
    //kingfisher 로 구현해보려 했으나 실패 그냥 uiimageview 로 받아오기 ㄱㄱ
//    let imageView = UIImageView().then {
//        $0.kf.setImage(with: URL(string: matjibs[0].url)!)
//    }
    
    func itemsInit(){
        self.addSubview(nameLabel)
        self.addSubview(imageView)
        
        nameLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(nameLabel).offset(100)
        }
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
