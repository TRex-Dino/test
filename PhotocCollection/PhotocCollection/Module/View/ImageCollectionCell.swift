//
//  ImageCollectionCell.swift
//  InterviewTask
//
//

import UIKit
import SnapKit

class ImageCollectionCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var activityIndecator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.cancelImage
        imageView.image = nil
    }
}
private extension ImageCollectionCell{
    func configure(){
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        activityIndecator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        activityIndecator.center = self.center
        activityIndecator.hidesWhenStopped = true
        activityIndecator.color = .red
        self.addSubview(activityIndecator)
        activityIndecator.startAnimating()
    }
    
    
}
