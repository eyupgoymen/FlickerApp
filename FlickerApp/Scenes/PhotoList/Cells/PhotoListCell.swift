//
//  PhotoListCell.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

class PhotoListCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var viewModel: PhotoListCellViewModelProtocol! {
        didSet {
            viewModel.delegate = self
            viewModel.loadPhoto()
        }
    }
    
    var title: String = "" {
        didSet {
            cellLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
    
    override func prepareForReuse() {
        cellImageView.image = nil
        cellLabel.text = ""
    }
    
    private func setLayout() {
        layer.addShadow(radius: 6)
        layer.roundCorners(radius: 8)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cellImageView.layer.cornerRadius = 8
        cellImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //Enable hero
        cellImageView.hero.isEnabled = true
        cellImageView.hero.id = "image"
    }
}

extension PhotoListCell: PhotoListCellViewModelDelegate {
    func handleViewModelOutput(_ output: PhotoListCellViewModelOutput) {
        switch output {
            case .photoFetched(let photoResponse):
                cellImageView.kf.setImage(with: URL(string: photoResponse.sizes.size[5].source))
                cellImageView.contentMode = .scaleAspectFill
        }
    }
}
