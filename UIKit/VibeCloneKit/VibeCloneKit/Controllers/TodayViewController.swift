//
//  TodayViewController.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

class TodayViewController: UIViewController {
    let todayView = TodayView()
    
    override func loadView() {
        view = todayView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
