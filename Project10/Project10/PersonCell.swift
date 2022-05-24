//
//  CollectionViewCell.swift
//  Project10
//
//  Created by Matteo Spada on 24/05/22.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let name = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 1
        backgroundColor = .white
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(imageView)
        addSubview(name)
        
        NSLayoutConstraint.activate([

            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            name.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 140, height: 180)
    }
    
}

