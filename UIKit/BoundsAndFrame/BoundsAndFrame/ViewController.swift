//
//  ViewController.swift
//  BoundsAndFrame
//
//  Created by gnksbm on 4/28/24.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var superView: TestView = {
        let view = TestView()
        view.name = "SuperView"
        view.backgroundColor = .red
        view.frame = .init(
            origin: .init(
                x: 100,
                y: 100
            ),
            size: .init(
                width: 200,
                height: 200
            )
        )
        view.addSubview(subView)
        self.view.addSubview(view)
        return view
    }()
    
    private let subView: TestView = {
        let view = TestView()
        view.name = "SubView"
        view.backgroundColor = .blue
        view.frame = .init(
            origin: .init(
                x: 10,
                y: 10
            ),
            size: .init(
                width: 100,
                height: 100
            )
        )
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        ButtonAction.allCases.forEach { action in
            let button = UIButton()
            button.tag = action.rawValue
            button.setTitle(
                action.toString,
                for: .normal
            )
            button.titleLabel?.numberOfLines = 2
            button.backgroundColor = .cyan
            button.addTarget(
                self,
                action: #selector(btnAction),
                for: .touchUpInside
            )
            stackView.addArrangedSubview(button)
        }
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI() {
        [
            superView,
            stackView
        ].forEach { view.addSubview($0) }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.widthAnchor.constraint(
                equalTo: safeArea.widthAnchor,
                multiplier: 0.9
            ),
        ])
    }
    
    enum ButtonAction: Int, CaseIterable {
        case moveFrame, moveBounds, rotate, reset
        
        var toString: String {
            String(describing: self)
        }
    }
    
    @objc private func btnAction(sender: UIButton) {
        UIView.animate(withDuration: 1) { [self] in
            superView.transform = .init(translationX: 0, y: -superView.transform.b)
            superView.frame = .init(
                origin: .init(
                    x: 100,
                    y: 100
                ),
                size: .init(
                    width: 200,
                    height: 200
                )
            )
            superView.bounds.origin = .init(
                x: 0,
                y: 0
            )
            switch ButtonAction.allCases[sender.tag] {
            case .moveFrame:
                superView.frame.origin = .init(x: 100, y: 300)
            case .moveBounds:
                superView.bounds.origin = .init(x: -200, y: -200)
            case .rotate:
                superView.transform = .init(rotationAngle: 45)
            case .reset:
                break
            }
        }
        superView.setNeedsDisplay()
        subView.setNeedsDisplay()
    }
}

final class TestView: UIView {
    var name: String = ""
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print(name)
        print("frame: \(frame)")
        print("bounds: \(bounds)")
    }
}
