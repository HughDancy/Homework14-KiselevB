//
//  CustomCell.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 08.06.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    lazy var iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 5
        
        return iv
    }()
    
    lazy var firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = String()
        firstLabel.font = UIFont(name: "Helvetica", size: 16)
        
        return firstLabel
    }()
    
    lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = String()
        secondLabel.font = UIFont(name: "Helvetica", size: 12)
        secondLabel.textColor = .gray
        
        return secondLabel
    }()
    
    func configurateCell(by image: UIImage, text: String, secondText: String) {
        iv.image = image
        firstLabel.text = text
        secondLabel.text = secondText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(iv)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        iv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        iv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        iv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        iv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        firstLabel.topAnchor.constraint(equalTo: iv.bottomAnchor, constant: 5).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 3).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
