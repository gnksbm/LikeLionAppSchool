//
//  ViewController.swift
//  CleanMVVMWithSPM
//
//  Created by gnksbm on 2023/12/22.
//

import UIKit

public class ViewController: UIViewController {
    let searchTextField = UITextField()
    
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

extension ViewController: UITextFieldDelegate {
    
}

