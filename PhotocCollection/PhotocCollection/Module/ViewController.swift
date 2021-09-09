//
//  ViewController.swift
//  InterviewTask
//
//

import UIKit
import SDWebImage

class ViewController: UICollectionViewController {
    
    fileprivate let countOfImagesOnOnePage = 20
    
    private var countOfCells = 0
    
    private var itemSize: CGSize?
    
    private let identifier = "Cell"
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        nextPage()
    }
    
    private func configureTable(){
        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.backgroundColor = .white
    }
    
    private func nextPage() {
        collectionView.performBatchUpdates({
            countOfCells += countOfImagesOnOnePage
        }, completion: nil)
    }
}

// MARK: UICollectionViewDataSource
extension ViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countOfCells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCollectionCell
        collectionViewCell.activityIndecator.startAnimating()
        
        let url = API.photo(number: indexPath.row).url
        
        collectionViewCell.imageView.sd_setImage(with: url) { [weak self] (image, error, cache, url) in
            
            let copyOfIndexPathRow = indexPath.row
            if error != nil && image == nil {
            } else {
                collectionViewCell.activityIndecator.stopAnimating()
                guard let countOfCells = self?.countOfCells else { return }
                if countOfCells - copyOfIndexPathRow <= 5 {
                    self?.nextPage()
                }
            }
        }
        
        return collectionViewCell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if itemSize == nil {
            let count = 3
            let width = self.view.frame.width
            let itemS: CGFloat = CGFloat(Double (width - 120) / Double(count))
            itemSize = CGSize(width: itemS, height: itemS)
        }
        return itemSize!
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
