//
//  NewsTableViewCell.swift
//  NewsApp-VIPER
//
//  Created by max on 23.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsCell"
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 25, weight: .medium)
        return title
    }()

    lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.numberOfLines = 0
        subtitle.font = .systemFont(ofSize: 15, weight: .ultraLight)
        return subtitle
    }()

    lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemBackground
        image.layer.cornerRadius = 7
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    lazy var counterImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "eye"))
        return image
    }()

    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = label.font.withSize(10)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsImage)
        contentView.addSubview(subtitle)
        contentView.addSubview(title)
        contentView.addSubview(counterImage)
        contentView.addSubview(counterLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = CGRect(x: 10,
                             y: 0,
                             width: contentView.frame.size.width - 170,
                             height: 70)

        subtitle.frame = CGRect(x: 10,
                                y: 70,
                                width: contentView.frame.size.width - 170,
                                height: contentView.frame.size.height / 2)

        newsImage.frame = CGRect(x: contentView.frame.size.width - 150,
                                 y: 5,
                                 width: 130,
                                 height: contentView.frame.size.height - 50)
        counterImage.frame = CGRect(x: contentView.frame.size.width - 150,
                                    y: 180,
                                    width: 16,
                                    height: 10)
        counterLabel.frame = CGRect(x: contentView.frame.size.width - 120,
                                    y: 180,
                                    width: 16,
                                    height: 10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subtitle.text = nil
        newsImage.image = nil
        counterLabel.text = nil
    }
}
