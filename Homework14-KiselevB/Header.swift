//
//  Header.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 08.06.2022.
//

import UIKit

let header = "headerId"

class Header: UICollectionReusableView {
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Мои альбомы"
        title.font = UIFont(name: "Helvetica", size: 20)
        title.textColor = .black
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderLayout()
        
        addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeaderLayout() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo:  topAnchor, constant: 3).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
}
