//
//  WeatherTVCell.swift
//  WeatherKit_NoSB
//
//  Created by gnksbm on 2023/07/16.
//

import UIKit

class MainBlurTVCell: UITableViewCell {
    
    static let identifier = "MainTVCell"
    
    //MARK: - View
    lazy var blurView: BlurView = {
        let view = BlurView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - func
    func configureUI() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        setBlurView()
    }
    
    func setBlurView() {
        contentView.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
        ])
    }

}
