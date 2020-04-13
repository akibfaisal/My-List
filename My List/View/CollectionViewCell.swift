//
//  CollectionViewCell.swift
//  My List
//
//  Created by S. M. Akib Al Faisal on 13/4/20.
//  Copyright © 2020 S. M. Akib Al Faisal. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listcellview: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var listContentView: CollectionViewCell!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // listContentView.layer.cornerRadius = 10.0
        
    }
    
}
