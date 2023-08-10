//
//  ViewController.swift
//  TableViewDiffableDataSourceKit
//
//  Created by gnksbm on 2023/08/10.
//

import UIKit
struct NoteCategory: Identifiable {
    var id = UUID().uuidString
    var categoryName: String
    var itemList: [NoteItem]
}

struct NoteItem: Equatable {
    var id: UUID = UUID()
    var title: String
    // contents의 내용을 MD이 아닌 String이라고 가정
    var contents: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

class ViewController: UIViewController {
    var datas: [NoteCategory] = NoteCategory.sampleDatas
    var dataSource: UITableViewDiffableDataSource<Int, NoteCategory.ID>!

//    @IBOutlet weak var tableView: UITableView!
    let tableView = UITableView()
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")

        // cell의 모양 - (cellForRowAt과 동일)
        dataSource = UITableViewDiffableDataSource<Int, NoteCategory.ID>(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: NoteTVCell.identifier, for: indexPath) as! NoteTVCell
            cell.titlteLabel.text = self.datas[indexPath.section].itemList[indexPath.row].title

            return cell
        })
        tableView.dataSource = dataSource
        tableView.register(NoteTVCell.self, forCellReuseIdentifier: NoteTVCell.identifier)

        // tableView에 들어갈 Section, Item 초기화
        var snapshot = NSDiffableDataSourceSnapshot<Int, NoteCategory.ID>()
        snapshot.appendSections([0]) // 주의: section하나를 안넣어주면 에러
        snapshot.appendItems(datas.map { $0.id })
        dataSource.apply(snapshot)
    }

}

extension NoteItem {
    static let sampleDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
}

extension NoteCategory {
    static let sampleDatas = [
        NoteCategory(categoryName: "Github", itemList: [
            NoteItem(title: "add", contents: "add의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "commit", contents: "commit의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "pull", contents: "pull의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "push", contents: "push의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "fetch", contents: "fetch의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "branch", contents: "branch의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "diff", contents: "diff의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
        ]),
        NoteCategory(categoryName: "Swift", itemList: [
            NoteItem(title: "Class", contents: "Class의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Struct", contents: "Struct의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Enum", contents: "Enum의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Actor", contents: "Actor의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Optional", contents: "Optional의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Generic", contents: "Generic의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
            NoteItem(title: "Error", contents: "Error의 MD으로 작성된 내용입니다.\n" + NoteItem.sampleDescription),
        ]),
    ]
}

class NoteTVCell: UITableViewCell {
    static let identifier: String = "NoteTVCell"
    // MARK: - Views
    
    let cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titlteLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        drawBackgroundView()
        drawTitlteLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    func drawBackgroundView() {
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cellBackgroundView)
        
        NSLayoutConstraint.activate([
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func drawTitlteLabel() {
        titlteLabel.translatesAutoresizingMaskIntoConstraints = false
        cellBackgroundView.addSubview(titlteLabel)
        
        NSLayoutConstraint.activate([
            titlteLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            titlteLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10),
            titlteLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 10),
            titlteLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -10),
        ])
    }
}



import SwiftUI

struct UIKitVCPreview: UIViewControllerRepresentable {
    
    let viewControllerGenerator: () -> UIViewController
    
    init(viewControllerGenerator: @escaping () -> UIViewController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewControllerGenerator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct UIKitNaviVCPreview: UIViewControllerRepresentable {
    
    let viewControllerGenerator: () -> UINavigationController
    
    init(viewControllerGenerator: @escaping () -> UINavigationController) {
        self.viewControllerGenerator = viewControllerGenerator
    }
    
    func makeUIViewController(context: Context) -> some UINavigationController {
        viewControllerGenerator()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//MARK: - Preview

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitVCPreview {
            ViewController()
        }
    }
}
