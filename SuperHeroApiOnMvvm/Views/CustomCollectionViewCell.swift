//
//  CustomCollectionViewCell.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 14/12/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    let nameLabel = UILabel()
    let publisherLabel = UILabel()
    let heroImage = UIImageView()
    
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
        publisherLabel.frame = CGRect(x: 5, y: heroImage.frame.size.height+50, width: contentView.frame.size.width-10, height: 50)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .yellow
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroImage.contentMode = .scaleAspectFit
        heroImage.backgroundColor = .systemBlue
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        publisherLabel.textAlignment = .center
        publisherLabel.backgroundColor = .yellow
        publisherLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
