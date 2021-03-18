//
//  ArticleTableViewCell.swift
//  Articles
//
//  Created by Idan Moshe on 18/03/2021.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let placeholderImage = UIImage(systemName: "photo")
        static let authorPlaceholderImage = UIImage(systemName: "person")
        static let saveImage = UIImage(named: "save")
        static let savedImage = UIImage(named: "saved")
        static let likeImage = UIImage(named: "like")
        static let likedImage = UIImage(named: "liked")
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var saveImageView: UIImageView!
    @IBOutlet private weak var likeImageView: UIImageView!
    @IBOutlet private weak var likeCountLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var writerLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var writerImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.backgroundImageView.image = nil
        self.saveImageView.image = nil
        self.likeImageView.image = nil
        self.likeCountLabel.text = nil
        self.categoryLabel.text = nil
        self.titleLabel.text = nil
        self.writerLabel.text = nil
        self.dateLabel.text = nil
        self.writerImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.hideSystemSeparator()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - General Methods
    
    func configure(_ article: Datum) {
        self.backgroundImageView.sd_setImage(
            with: URL(string: article.imageURL),
            placeholderImage: Constants.placeholderImage)
        
        self.saveImageView.image = article.isSaved ? Constants.savedImage : Constants.saveImage
        self.likeImageView.image = article.isLiked ? Constants.likedImage : Constants.likeImage
        
        self.likeCountLabel.text = "\(article.likesCount)"
        self.categoryLabel.text = article.category
        self.titleLabel.text = article.title
        
        self.writerImageView.sd_setImage(
            with: URL(string: article.author.authorAvatar.imageURL),
            placeholderImage: Constants.authorPlaceholderImage)
        
        self.writerLabel.text = article.author.authorName
        
        if let creationDate: Date = DateFormatter.creationFormatter.date(from: article.metaData.creationTime) {
            let creationDateDisplayed = DateFormatter.creationFormatterDisplayed.string(from: creationDate)
            self.dateLabel.text = creationDateDisplayed
        }
    }
    
}
