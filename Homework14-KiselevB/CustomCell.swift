//
//  CustomCell.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 08.06.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    private lazy var iv: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Wooman1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
       let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "Недавние"
        firstLabel.font = UIFont(name: "Helvetica", size: 12)
        
        return firstLabel
    }()
    
    private lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "57"
        secondLabel.font = UIFont(name: "Helvetica", size: 9)
        secondLabel.textColor = .systemGray
        
        return secondLabel
    }()
    
    
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
