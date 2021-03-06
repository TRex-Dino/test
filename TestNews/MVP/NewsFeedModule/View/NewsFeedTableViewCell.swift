//
//  NewsFeedCell.swift
//  MVP
//

import UIKit


protocol NewsFeedTableViewCellProtocol: AnyObject {
    func setImage(with imageData: Data)
    func setTitle(with title: String)
    func setDate(with date: String)
}

class NewsFeedTableViewCell: UITableViewCell {
    
    var presentor: NewsFeedTableViewCellPresentorProtocol!
    let identifier = "NewsFeedCell"
    
    private let titleLabel = UILabel(font: .AvenirNext(.regular, size: 16),
                                     lines: 4,
                                     sizeToFit: true)
    
    private let dateLabel = UILabel(font: .AvenirNext(.demiBold, size: 14),
                                    aligment: .center,
                                    color: .systemBlue)
    
    private lazy var newFeedImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup(with: newFeedImage, titleLabel, dateLabel)
        setupNewFeedImageConstraint()
        setupTitleLabelConstraint()
        setupDateLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func setupNewFeedImageConstraint() {
        NSLayoutConstraint.activate([
            newFeedImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            newFeedImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            newFeedImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            newFeedImage.widthAnchor.constraint(equalToConstant: bounds.width / 3),
        ])
    }
    
    func setupTitleLabelConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: newFeedImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    func setupDateLabelConstraint() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: newFeedImage.trailingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    
}

//MARK: - NewsFeedTableViewCellProtocol

extension NewsFeedTableViewCell: NewsFeedTableViewCellProtocol {
    func setImage(with imageData: Data) {
        newFeedImage.image = UIImage(data: imageData)
    }
    
    func setTitle(with title: String) {
        titleLabel.text = title
    }
    
    func setDate(with date: String) {
        dateLabel.text = date
    }
    
    
}
