//
//  ViewController.swift
//  UIKit_Study_1129
//
//  Created by MacBook on 2022/11/29.
//

import UIKit
import SwiftUI
import SnapKit


class ViewController: UIViewController {
    let test : UILabel = {
        let test = UILabel()
        test.text = "text" // test를 위해서 출력할 라벨
        return test
    }()
    
    let myBtn : UIButton = {
        let testBtn = UIButton()
        testBtn.backgroundColor = .black
        testBtn.setTitle("myButton", for: .normal)
        testBtn.setTitleColor(.white, for: .normal)
        testBtn.addTarget(self, action: #selector(labelToggle), for: .touchUpInside)
        return testBtn
    }()
    
    var isLabelActive = true {
        didSet {
            self.view.setNeedsLayout()
        }
    }
    
    var myText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //UIlabel UItextfield UIbutton UI
       // view.backgroundColor = .white // 배경색
        setupLayout()
        
    }

    @objc func labelToggle(sender: UIButton) {
        test.text = "addadasdsa"
        //test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = false // 얘는 왜 안먹지?
        test.snp.remakeConstraints { make in
            make.top.equalToSuperview()
        }
        
        isLabelActive = !isLabelActive
        print("is: \(isLabelActive)")
        print("sender \(sender)")
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

private extension ViewController {
    
    func setupLayout() {
        view.addSubview(test)
        view.addSubview(myBtn)
//        test.translatesAutoresizingMaskIntoConstraints = false
//        test.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = isLabelActive
//        myBtn.frame = CGRect(x: view.center.x, y: view.center.y + 50.0, width: 100, height: 50)
        test.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        myBtn.snp.remakeConstraints { make in
            //make.center.equalToSuperview()
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
}
