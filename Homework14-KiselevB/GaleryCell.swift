//
//  CustomCell.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 08.06.2022.
//

import UIKit

final class GaleryCell: UICollectionViewCell {
    static let reuseIdentifier = "GaleryCell"

    // MARK: - Subview's
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage()
        iv.contentMode = .scaleAspectFill
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

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Common Init
    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
    }
    // MARK: - Setup Layout
    private func setupLayout() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true

        firstLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true

        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 3).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
    }

    // MARK: - Public setup cell method
    func configurateCell(by image: UIImage, text: String, secondText: String) {
        imageView.image = image
        firstLabel.text = text
        secondLabel.text = secondText
    }
}
