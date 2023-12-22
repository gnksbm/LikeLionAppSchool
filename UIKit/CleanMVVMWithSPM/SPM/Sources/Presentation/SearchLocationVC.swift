//
//  SearchLocationVC.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

public final class SearchLocationVC: UIViewController {
    let searchTextField = UITextField()
    let searchBtn = UIButton()
    let resultTableView = UITableView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupUI()
    }
    
    private func setupDelegate() {
        searchTextField.delegate = self
    }
    
    private func setupUI() {
        
    }
}

extension SearchLocationVC: UITextFieldDelegate {
    
}

