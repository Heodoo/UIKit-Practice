import UIKit
import Then
import PinLayout
import SnapKit

class ViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)

    //let data = [["Test 1-1","Test 1-2","Test 1-3","Test 1-4"],["Test 2-1","Test 2-2","Test 2-3"],["Test 3-1","Test 3-2"]]
    var data = ["0","1","2","3"
                ,"4"]
    let header = ["Section 1","Section 2","Section 3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .gray
        self.navigationItem.title = "Test"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
        
        setupLayout()
        self.tableView.dataSource = self
        self.tableView.delegate = self

    }
    
    @objc func editButtonTapped () {
        if tableView.isEditing {
            self.tableView.setEditing(false, animated: true)
        }else{
            self.tableView.setEditing(true, animated: true)
        }
    }
    
    @objc func plusButtonTapped () {
        //present 밑에서 화면이 올라오는 형식, 모달시트같은?
        //self.present
        data.append("\(data.count)")
        tableView.reloadData()
    }
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    //셀 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //셀 그리기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    //셀 선택시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //..
    }
    
    // editing 모드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
    //셀 위치 바꾸기
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let targetItem: String = self.data[sourceIndexPath.row]
        self.data.remove(at: sourceIndexPath.row)
        self.data.insert(targetItem, at: destinationIndexPath.row)
    }
    
}
