//
//  ViewController.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 09/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var heroListVM: HeroListViewModel!
    
    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .orange
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainCollectionView.frame = view.bounds
    }
    
    private func setupView() {
        view.addSubview(mainCollectionView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    func setup() {
        if let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json") {
            WebService().getHeroes(url: url) { heroes in
                if let heroes = heroes {
                    self.heroListVM = HeroListViewModel(heroes: heroes)
                    DispatchQueue.main.async {
                        self.mainCollectionView.reloadData()
                    }
                }
                
            }
        }
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.heroListVM == nil ? 0 : self.heroListVM.numberOfSections
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.heroListVM.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("CustomCollectionViewCell not found")
        }
        let heroVM = self.heroListVM.heroAtIndex(indexPath.row)
        cell.nameLabel.text = heroVM.name
        cell.publisherLabel.text = heroVM.publisher
        if let url = URL(string: heroVM.imageURL) {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.heroImage.image = UIImage(data: data)
                }
            }
        }
        cell.backgroundColor = .systemGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2-10, height: 370)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
    }
}

