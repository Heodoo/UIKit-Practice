//
//  ViewController.swift
//  UIKit_Study_1201
//
//  Created by MacBook on 2022/12/01.
//

import UIKit
import SwiftUI
import SnapKit

//https://github.com/devxoul/Then
// NSObject의 하위클래스들(UI아이템들같은)의 set을 클로저보다 좀더 쉽게 initalize
// 가독성 업
import Then

// 웹에서 이미지를 다운로드하고 캐싱하기 위한 강력한 라이브러리 (스유도 가능)
//https://github.com/onevcat/Kingfisher
import Kingfisher
// <- 오늘은 실패

class ViewController: UIViewController {
    let cusutomView = MatjibView(matjib: matjibs[0]).then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    

}



//레이아웃 세팅
private extension ViewController {
    func setupLayout () {
        view.addSubview(cusutomView)
        cusutomView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
    }
    
}

