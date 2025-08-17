//
//  PlaylistCollectionViewCell.swift
//  C5
//
//  Created by Soop on 8/12/25.
//

import UIKit

class PlaylistCollectionViewCell: UICollectionViewCell {
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let karaokeNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // lazy 왜 씀
    private lazy var contentVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, artistLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var contentHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentVerticalStackView, karaokeNumberLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually   // TODO: 화면 크기가 커져도 공백이 늘어나야 함
        return stackView
    }()
    
    private lazy var divideLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var bodyVerticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [contentHorizontalStackView, divideLineView])
        view.axis = .vertical
        view.alignment = .fill
        return view
    }()
    
    private lazy var totalHorizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [albumCoverImageView, bodyVerticalStackView])
        view.axis = .horizontal
        view.alignment = .fill
        view.spacing = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func configure(title: String, artist: String, karaokeNumber: String) {
        self.titleLabel.text = title
        self.artistLabel.text = artist
        self.karaokeNumberLabel.text = karaokeNumber
    }

    private func setupUI() {
        // 뷰 계층 설정
        contentView.addSubview(totalHorizontalStackView)
        
        // 제약조건 설정 (이것 없으면 아무것도 안 보임)
        totalHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            totalHorizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            totalHorizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalHorizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            totalHorizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // 앨범 이미지 크기
            albumCoverImageView.widthAnchor.constraint(equalToConstant: 30),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 30),
            
            // 구분선 높이
            divideLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
