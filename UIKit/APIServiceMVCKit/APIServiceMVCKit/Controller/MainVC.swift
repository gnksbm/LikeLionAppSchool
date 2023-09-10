//
//  MainVC.swift
//  APIServiceMVCKit
//
//  Created by gnksbm on 2023/09/03.
//

import UIKit

class MainVC: UIViewController {
    let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setSearchController()
        makeButton()
    }
    
    func setSearchController() {
        let vc = SearchResultVC()
        let searchController = UISearchController(searchResultsController: vc)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        var suggestions: [UISearchSuggestionItem] = []
        for num in 1...9 {
            suggestions.append(UISearchSuggestionItem(localizedSuggestion: "\(num)호선"))
        }
        searchController.searchSuggestions = suggestions
    }
    
    func makeButton() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        for num in 1...9 {
            let button = UIButton()
            button.setTitle("\(num)호선", for: .normal)
            button.addTarget(self, action: #selector(searchBtnTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    @objc func searchBtnTapped(sender: UIButton) {
        navigationItem.searchController?.searchBar.text = sender.currentTitle
    }
}

extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let vc = searchController.searchResultsController as! SearchResultVC
        guard let searchTerm = searchController.searchBar.text else { return }
        networkManager.fetchData(searchTerm: searchTerm, completion: { metro in
            DispatchQueue.main.async {
                vc.metro = metro
            }
        })
    }
}

import SwiftUI
struct ViewController_Preview: PreviewProvider {
    static var nc = UINavigationController(rootViewController: MainVC())
    static var previews: some View {
        UIKitPreview {
            nc
        }
    }
}

