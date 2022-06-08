//
//  ViewController.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 06.06.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    
    //MARK: - Subview's
    
    private lazy var albumsCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let albumsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        albumsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return albumsCollectionView
    }()
    


    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(albumsCollectionView)
        albumsCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        albumsCollectionView.delegate  = self
        albumsCollectionView.dataSource = self
        
        setupLayout()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Cell's cettings
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.height  / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        return cell
    }
    
    func addData() {
        dataForCell.append(womanFirst)
        dataForCell.append(womanTwo)
        dataForCell.append(tulen)
        dataForCell.append(dogs)
        dataForCell.append(kinder)
    }
    
    // MARK: - Layouts
    
    func setupLayout() {
        albumsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        albumsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        albumsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        albumsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        albumsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

