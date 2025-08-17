//
//  PlaylistTableViewCell.swift
//  C5
//
//  Created by Soop on 8/17/25.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    private let albumCoverImageView = UIImageView()
    private let titleLabel = UILabel()
    private let artistLabel = UILabel()
    private let karaokeNumberLabel = UILabel()
    private let labelVericalStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setAutoLayout()
    }
    
    func setUI() {
        
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(labelVericalStackView)
        contentView.addSubview(karaokeNumberLabel)
        
        albumCoverImageView.clipsToBounds = true
        albumCoverImageView.layer.cornerRadius = 8
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        
        artistLabel.textColor = .black
        artistLabel.numberOfLines = 0
        artistLabel.textAlignment = .left
        
        karaokeNumberLabel.textColor = .black
        karaokeNumberLabel.numberOfLines = 0
        karaokeNumberLabel.textAlignment = .left
        
        labelVericalStackView.spacing = 8
        labelVericalStackView.axis = .vertical
        labelVericalStackView.alignment = .leading
        labelVericalStackView.addArrangedSubview(titleLabel)
        labelVericalStackView.addArrangedSubview(artistLabel)
    }
    
    func setAutoLayout() {
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        labelVericalStackView.translatesAutoresizingMaskIntoConstraints = false
        karaokeNumberLabel.translatesAutoresizingMaskIntoConstraints = false   
        
        NSLayoutConstraint.activate([
            albumCoverImageView.widthAnchor.constraint(equalToConstant: 48),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 48),
            albumCoverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            
            labelVericalStackView.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 20),
            labelVericalStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            karaokeNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            karaokeNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
        ])
    }
    
    func configure(music: Music) {
        self.titleLabel.text = music.title
        self.artistLabel.text = music.artist
        self.karaokeNumberLabel.text = music.number
    }
}
