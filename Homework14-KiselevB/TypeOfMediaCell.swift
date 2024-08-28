//
//  TableCell.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 14.06.2022.
//

import UIKit

final class TypeOfMediaCell: UICollectionViewListCell {
    static let reuseIdentifier = "TypeOfMediaCell"
    // MARK: - Outlets
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

   private lazy var firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = String()
        firstLabel.textColor = .systemBlue
        firstLabel.font = UIFont(name: "Helvetica", size: 20)
        return firstLabel
    }()

    private lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = String()
        secondLabel.font = UIFont(name: "Helvetica", size: 17)
        secondLabel.textColor = .gray
        return secondLabel
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Cell
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
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true

        firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true

        secondLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant:  -15).isActive = true
    }

    // MARK: - Public configure cell method
    func configurateCell(by image: UIImage, text: String, secondText: String) {
        imageView.image = image
        firstLabel.text = text
        secondLabel.text = secondText
    }
}
