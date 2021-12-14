//
//  CustomCollectionViewCell.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 14/12/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    let urlString = ""
    var urlImage: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg")!
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "No name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.sizeToFit()
        imageView.backgroundColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let publisherLabel: UILabel = {
        let label = UILabel()
        label.text = "No publisher"
        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        contentView.addSubview(heroImage)
        contentView.addSubview(publisherLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 5, y: 10, width: contentView.frame.size.width-10, height: 50)
        heroImage.frame = CGRect(x: 5, y: nameLabel.frame.size.height+5, width: contentView.frame.size.width-10, height: 250)
        publisherLabel.frame = CGRect(x: 5, y: heroImage.frame.size.height+60, width: contentView.frame.size.width-10, height: 50)
    }
}
