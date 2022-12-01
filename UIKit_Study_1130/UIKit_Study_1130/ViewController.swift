//
//  ViewController.swift
//  UIKit_Study_1130
//
//  Created by MacBook on 2022/11/30.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: UIViewController {
    let myTextField = {
        let myTextField = UITextField()
        //...
        myTextField.text = ""
        myTextField.placeholder = "입력해주세요"
        myTextField.addTarget(self, action: #selector(inputText), for: .editingChanged)
        return myTextField
    }()
    
    let myLabel = {
        let myLabel = UILabel()
        myLabel.text = "허두영"
        return myLabel
    }()
    
    let myTextView = {
        let myTextView = UITextView()
        myTextView.text = "Hi"
        return myTextView
    }()
    
    let myImage = {
        let myImage = UIImageView()
        myImage.load(url: URL(string: "data:image/jpeg;base64,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")!)
    return myImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    //target 함수
    @objc func inputText() {
        myLabel.text = myTextField.text == "" ? "허두영" : myTextField.text ?? "허두영"
        //이미 layout을 설정하고 layout을 수정하려할때는 updateConstarints
        myLabel.snp.updateConstraints { make in
            make.top.equalToSuperview()
        }
    }
    
    

}


/*
 remakeConstraints -> 새로운 레이아웃을 적용해야 할 경우

 updateConstraints -> 기존에 작성된 레이아웃에서 값을 변경해야 할 경우

  

 make -> remake, make -> update를 각각 실행한다고 가정하였을때,

 remake는 레이아웃을 다시 잡아주는 과정이라 새로운 레이아웃을 줄 수 있고 전부 잡아주면 되지만 update는 make에 들어있는 것들을 기준으로 바꿀 수만 있다 그렇지 않으면 fatal error~ 가 나타난 것임
 */
private extension ViewController {
    func setupLayout() {
        view.addSubview(myTextField)
        view.addSubview(myLabel)
        view.addSubview(myTextView)
        view.addSubview(myImage)
        myTextField.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        myLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.leading.equalToSuperview().offset(30)
        }
        myTextView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(50)
            make.width.equalTo(100)
        }

        myImage.snp.remakeConstraints { make in
            make.bottom.equalToSuperview()//.offset(-100)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        //myTextField.background.foregroundColor(.black)
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
