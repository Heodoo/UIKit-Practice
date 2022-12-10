//
//  ViewController.swift
//  CalculatorSanpkit
//
//  Created by MacBook on 2022/12/05.
//

import UIKit
import SwiftUI
import SnapKit
import Then

//var items = Array(1...9).map {
//    String($0)
//}
class ViewController: UIViewController {
    lazy var resultLabel = UILabel().then {
        $0.text = "0"
    }
    var btns = {
        var btns : [UIButton] = []
        
        for item in Array(1...9).map({String($0)})
        {
            var btn = UIButton().then {
                $0.setTitle(item, for: .normal)
                $0.backgroundColor = UIColor.black
                $0.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 30)
                //$0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
                $0.addTarget(self, action: #selector(ac), for: .touchUpInside)
            }
            btns.append(btn)
        }
        return btns
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        setupLayout()
    }
    
    @objc func ac (sender: UIButton) {
        if let title = sender.title(for: .normal) {
            resultLabel.text! += title
        }
    }
    
    func setupLayout() {
        self.view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-200)
            make.size.equalTo(CGSize(width: 200, height: 40))
        }
        
        for i in 0..<3 {
            self.view.addSubview(btns[3*i])
            self.view.addSubview(btns[3*i+1])
            self.view.addSubview(btns[3*i+2])
            btns[3*i].snp.makeConstraints { make in
                make.centerX.equalToSuperview().offset(-100)
                make.centerY.equalToSuperview().offset(i*100)
                //make.top.equalTo(resultLabel.snp.bottom)
                make.size.equalTo(CGSize(width: 70, height: 70))
            }
            btns[3*i+1].snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(i*100)
                make.size.equalTo(CGSize(width: 70, height: 70))
            }
            btns[3*i+2].snp.makeConstraints { make in
                make.centerX.equalToSuperview().offset(100)
                make.centerY.equalToSuperview().offset(i*100)
                make.size.equalTo(CGSize(width: 70, height: 70))
            }
        }
        
    }
    
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

@available(iOS 14.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}


