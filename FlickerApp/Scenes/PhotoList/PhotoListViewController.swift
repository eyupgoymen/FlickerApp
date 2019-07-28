//
//  PhotoListViewController.swift
//  FlickerApp
//
//  Created by Eyup Kazım Göymen on 25.07.2019.
//  Copyright © 2019 Eyup Kazım Göymen. All rights reserved.
//


import Foundation
import UIKit

final class PhotoListViewController : UIViewController {
    
    //MARK: View Model and Router
    var viewModel: PhotoListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    var photos: Photos?
    var cellIdentifier = "PhotoListCell"
    
    //MARK: UI objects
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegisters()
        setLayout()
        viewModel.loadRecentPhotos()
    }
    
    private func setRegisters() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
}

//MARK: Actions
extension PhotoListViewController {
    
}

//MARK: View Model Delegate
extension PhotoListViewController : PhotoListViewModelDelegate {
    func handleViewModelOutput(_ output: PhotoListViewModelOutput) {
        switch output {
            case .failed(let error):
                self.alert(message: error.localizedDescription)
            
            case .recentPhotosFetched(let photos):
                self.photos = photos
                collectionView.reloadData()
            
            case .setLoading(let isShowing):
                self.showIndicator(isShowing: isShowing)
        }
    }
}

//MARK: Table view and collection view methods here
extension PhotoListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos == nil ? 0 : photos!.photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PhotoListCell
        
        if let photo = photos?.photo, indexPath.row == photo.count - 1 {
            viewModel.loadRecentPhotos() // get new photos for the last index
        }
        
        //attach the view model
        cell.viewModel = PhotoListCellViewModel(photoService: PostService(), photoId: photos!.photo[indexPath.row].id)
        
        cell.title = photos!.photo[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Height Calculation
        // 140 for image
        // 24 padding from top 24 padding from bottom for label
        // + height of label
        guard let photos = photos else { return CGSize(width: 0, height: 0) }
        
        let currentPhoto = photos.photo[indexPath.row].title
        let labelHeight = currentPhoto.height(constraintedWidth: collectionView.frame.width - 96, font: UIFont.systemFont(ofSize: 17))
        let width = 140 + 48 + labelHeight
        
        return CGSize(width: self.collectionView.frame.width - 48, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoListCell else { return }
        
        let detailVC = PhotoDetailBuilder.make(image: cell.cellImageView.image ?? UIImage(named: "flickr")!)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
