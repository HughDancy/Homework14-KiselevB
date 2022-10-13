//
//  TableCell.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 14.06.2022.
//

import UIKit

class TableCell: UICollectionViewListCell {
    
    lazy var iv: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    lazy var firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = String()
        firstLabel.textColor = .systemBlue
        firstLabel.font = UIFont(name: "Helvetica", size: 20)
        return firstLabel
    }()
    
    lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = String()
        secondLabel.font = UIFont(name: "Helvetica", size: 17)
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
        
        iv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        iv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        
        firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: iv.trailingAnchor, constant: 10).isActive = true
        
        secondLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant:  -5).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
