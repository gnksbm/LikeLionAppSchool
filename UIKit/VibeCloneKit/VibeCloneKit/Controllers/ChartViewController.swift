//
//  ChartViewController.swift
//  VibeCloneKit
//
//  Created by gnksbm on 2023/08/11.
//

import UIKit

class ChartViewController: UIViewController {
    let chartView = ChartView()
    
    override func loadView() {
        view = chartView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
