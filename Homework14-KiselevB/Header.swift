//
//  Header.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 08.06.2022.
//

import UIKit

final class Header: UICollectionReusableView {
    static let sectionHeader = "Header"

    // MARK: - Subview's
    let title = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        elementSettings()
        setupHeaderLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Elements
    func elementSettings() {
        title.textColor = .black
        title.font = UIFont(name: "Helvetica-Bold", size: 20)
    }
    
    func setupHeaderLayout() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo:  topAnchor, constant: 3).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3).isActive = true
    }
}
