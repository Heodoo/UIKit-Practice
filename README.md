# UIKit-Practice
+ UIKit(다양한 프레임워크 + 스토리보드X)을 사용해보자!
+ 다양한 Code Convention 적용해보기

## 22/11/29
+ 코드로 UILabel,UIButton 생성하고 레이아웃 잡아보기 (+ 스냅킷)
+ 버튼 클릭시 라벨 위치이동

## 22/11/30
+ UITextField, UITextView
+ 텍스트필드 입력시 라벨 텍스트를 입력한내용으로 바로 변경(.editingChanged)
+ UIImage url로 불러오기
```swift
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
```

## 22/12/01
+ 클로저 선언 대신 Then으로 아이템 선언해서 가독성 높이기 
+ UIImage + Kingfisher(이미지 캐싱) 으로 이미지 불러오기 
  + 실패 -> 나중에 다시...
+ 라벨과 이미지를 가진 커스텀뷰 만들기 
  + 만들어는 보았으나 프레임같은 레이아웃 설정이 헷갈렸음
  
## 22//12/07
+ 계산기 구현
    + 스냅킷으로 모든 아이템 레이아웃 셋업
+ 버튼 클릭시 에러 발생
    + 에러이름 unrecognized selector sent to class 
    + addTarget 부분에 self가 아닌 ViewController.self 를 입력하면 해당 에러 발생
    + self로 썼다가 경고가 떠서 fix를 눌렀더니 ViewController.self 로 바뀜... (조심하자)
```swift
let btn = UIButton().then {
                $0.setTitle(item, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
                $0.addTarget(ViewController.self, action: #selector(touchNumAndOperBtn), for: .touchUpInside)
                $0.backgroundColor = .orange
            }
```
