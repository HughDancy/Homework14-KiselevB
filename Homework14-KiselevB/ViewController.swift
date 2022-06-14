//
//  ViewController.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 06.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Subview's
    
    var dataSource: UICollectionViewDiffableDataSource<SectionData, Data>?
    
    private lazy var albumsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let albumsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        albumsCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        albumsCollectionView.register(TableCell.self, forCellWithReuseIdentifier: "TableCell")
        albumsCollectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.sectionHeader)
        
        return albumsCollectionView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(albumsCollectionView)
        setupLayout()
        
        addedData()
        createDataSource()
        reloadData()
        
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .white
    }
    
    //MARK: - Add data
    //
    func addedData() {
        sectionData.append(firstSecionType)
        sectionData.append(secondSecionType)
        sectionData.append(thirthSecionType)
        sectionData.append(fourSecionType)
    }
    
    
    //    MARK: - Data source and cell's settings
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionData, Data>(collectionView: albumsCollectionView, cellProvider: { (collectionView, indexPath, Data) -> UICollectionViewCell in
            
            switch sectionData[indexPath.section].type {
            case "Мои альбомы":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
                let images = sectionData[0].data[indexPath.row].image
                let text = sectionData[0].data[indexPath.row].title
                let secondText = sectionData[0].data[indexPath.row].secondTitle
                
                cell.configurateCell(by: images, text: text, secondText: secondText)
                return cell
                
            case "Общие альбомы":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
                let images = sectionData[1].data[indexPath.row].image
                let text = sectionData[1].data[indexPath.row].title
                let secondText = sectionData[1].data[indexPath.row].secondTitle
                
                cell.configurateCell(by: images, text: text, secondText: secondText)
                return cell
                
            case "Типы медиафайлов":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCell", for: indexPath) as! TableCell
                let images = sectionData[2].data[indexPath.row].image
                let text = sectionData[2].data[indexPath.row].title
                let secondText = sectionData[2].data[indexPath.row].secondTitle
                
                cell.separatorLayoutGuide.widthAnchor.constraint(equalToConstant: 1).isActive = true
                cell.accessories = [.disclosureIndicator()]
                cell.configurateCell(by: images, text: text, secondText: secondText)
                
                return cell
                
            case "Другое":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableCell", for: indexPath) as! TableCell
                let images = sectionData[3].data[indexPath.row].image
                let text = sectionData[3].data[indexPath.row].title
                let secondText = sectionData[3].data[indexPath.row].secondTitle
                
                cell.accessories = [.disclosureIndicator()]
                cell.configurateCell(by: images, text: text, secondText: secondText)
                return cell
                
                
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
                let images = sectionData[1].data[indexPath.section].image
                let text = sectionData[1].data[indexPath.section].title
                let secondText = sectionData[1].data[indexPath.section].secondTitle
                
                cell.configurateCell(by: images, text: text, secondText: secondText)
                return cell
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.sectionHeader, for: indexPath) as? Header else { return nil }
            
            guard let first = self.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self.dataSource?.snapshot().sectionIdentifier(containingItem: first) else { return nil }
            if section.type.isEmpty {return nil }
            
            sectionHeader.title.text = section.type
            
            return sectionHeader
        }
    }
    
    func reloadData() {
        var snapShot = NSDiffableDataSourceSnapshot<SectionData, Data>()
        snapShot.appendSections(sectionData)
        
        for section in sectionData {
            snapShot.appendItems(section.data, toSection: section)
        }
        dataSource?.apply(snapShot)
    }
    
    //MARK: - Compositional Layout
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            let section = sectionData[sectionIndex]
            
            switch section.type {
            case "Мои альбомы" :
                return self.firstCellSection()
            case "Общие альбомы" :
                return self.secondCellSection()
            case "Типы медиафайлов" :
                return self.createTypeOfMediaSection()
            case "Другое" :
                return self.createTypeOfMediaSection()
            default:  return self.createTypeOfMediaSection()
            }
        }
        return layout
    }
    
    // MARK: - Layout for Sections
    
    func firstCellSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .fractionalHeight(3.2))
        let layoutItam = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItam.contentInsets = NSDirectionalEdgeInsets.init(top: 15, leading: 8, bottom: 0, trailing: 8)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(102), heightDimension: .estimated(520))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitem: layoutItam, count: 2)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 12, bottom: 20, trailing: 12)
        
        let header = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [header]
        
        return layoutSection
    }
    
    func secondCellSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2), heightDimension: .fractionalHeight(3.2))
        let layoutItam = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItam.contentInsets = NSDirectionalEdgeInsets.init(top: 15, leading: 8, bottom: 15, trailing: 8)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(104), heightDimension: .estimated(88))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItam])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 12, bottom: 17, trailing: 8)
        
        let header = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [header]
        
        return layoutSection
        
    }
    
    func createTypeOfMediaSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 30, leading: 10, bottom: 15, trailing: 200)
        
        let header = createSectionHeader()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Header layout
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        return layoutSectionHeader
    }
    
    // MARK: - CollectionView Layout
    
    func setupLayout() {
        albumsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        albumsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        albumsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        albumsCollectionView.widthAnchor.constraint(equalToConstant: 434).isActive = true
    }
}




