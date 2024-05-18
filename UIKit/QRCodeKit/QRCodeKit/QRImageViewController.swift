//
//  QRImageViewController.swift
//  QRCodeKit
//
//  Created by gnksbm on 5/18/24.
//

import UIKit

final class QRImageViewController: UIViewController {
    private let qrImageView = UIImageView()
    private var widthConstraint: NSLayoutConstraint!
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        guard let data = text.data(using: .utf8) else { return }
        qrImageView.image = generateQRImg(data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillTransition(
        to size: CGSize,
        with coordinator: any UIViewControllerTransitionCoordinator
    ) {
        super.viewWillTransition(
            to: size,
            with: coordinator
        )
        setWidthLayoutConstraint()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qrImageView)
        
        setWidthLayoutConstraint()
        
        NSLayoutConstraint.activate([
            qrImageView.heightAnchor.constraint(equalTo: qrImageView.widthAnchor),
            qrImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func generateQRImg(data: Data) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let transform = CGAffineTransform(
            scaleX: 5,
            y: 5
        )
        filter.setValue(
            data,
            forKey: "inputMessage"
        )
        guard let ciImg = filter.outputImage
        else { return nil }
        let scaledImg = ciImg.transformed(by: transform)
        guard let cgImg = context.createCGImage(
            scaledImg,
            from: scaledImg.extent
        )
        else { return nil }
        return UIImage(cgImage: cgImg)
    }
    
    private func setWidthLayoutConstraint() {
        if let widthConstraint {
            widthConstraint.isActive = false
        }
        let secondAnchor = UIDevice.current.orientation.isPortrait ?
        view.widthAnchor : view.heightAnchor
        widthConstraint = qrImageView.widthAnchor.constraint(
            equalTo: secondAnchor,
            multiplier: 0.8
        )
        widthConstraint.isActive = true
    }
}
