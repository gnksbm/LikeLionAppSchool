//
//  ViewController.swift
//  CaculatorKit
//
//  Created by gnksbm on 2023/06/28.
//
import UIKit

enum Operator: String {
    case plus = "+", minus = "-", devide = "÷", multiple = "x", modulo = "%"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstValue: Double = 0
    var operatorCase: Operator?
    
    var isOperatorSeleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        firstValue = 0
        operatorCase = nil
        resultLabel.text = "0"
        isOperatorSeleted = false
    }
    
    @IBAction func signConversionButtonTapped(_ sender: UIButton) {
        guard let text = resultLabel.text,
              let value = Double(text) else { return }
        firstValue = value * -1
        resultLabel.text = "\(firstValue)"
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let value = resultLabel.text,
              let doubleValue = Double(value),
              let operatorString = sender.titleLabel?.text else { return }
        firstValue = doubleValue
        operatorCase = Operator(rawValue: operatorString)
        isOperatorSeleted = true
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var result: Double?
        //fistvalue - Double , seconValue - Double, operatorCase - Operator(enum)
        guard let operatorCase = self.operatorCase,
              let secondValue = self.resultLabel.text,
              let secondValueDouble = Double(secondValue) else { return }
        switch operatorCase {
        case .plus:
            result = firstValue + secondValueDouble
        case .minus:
            result = firstValue - secondValueDouble
        case .multiple:
            result = firstValue * secondValueDouble
        case .devide:
            result = firstValue / secondValueDouble
        case .modulo:
            result = firstValue.truncatingRemainder(dividingBy: secondValueDouble)
        }
        guard let result else {
            self.resultLabel.text = "Error"
            return
        }
        //result - Double
        //Int(result) .xxxxx사라짐
        //Double - Int <-불가능 Double - Double
        if (result - Double(Int(result))) == 0 || (result - Double(Int(result))) < 0.00000001 {
            self.resultLabel.text = "\(Int(result))"
        } else {
            self.resultLabel.text = String(format: "%.8f", result)
            // 소수점 뒷자를 8개까지 반환
        }
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard !isOperatorSeleted else {
            resultLabel.text = sender.titleLabel?.text
            return
        }
        if resultLabel.text == "0" {
            resultLabel.text = sender.titleLabel?.text
        } else {
            guard let labelText = resultLabel.text else { return }
            let labelNumberCount = labelText.filter { $0.isNumber }.count
            guard labelNumberCount < 9 else { return }
            guard let text = sender.titleLabel?.text else { return }
            resultLabel.text?.append(contentsOf: text)
        }
    }
    
    @IBAction func commaButtonTapped(_ sender: UIButton) {
        guard let isContain = resultLabel.text?.contains(".") else { return }
        guard !isContain else { return }
        guard let commaString = sender.titleLabel?.text else { return }
        resultLabel.text?.append(commaString)
    }
}

