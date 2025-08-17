//
//  PlaylistTestViewController.swift
//  C5
//
//  Created by Soop on 8/13/25.
//

import UIKit

// MARK: - 테스트용 ViewController
class PlaylistTestViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout(section: createSection())
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PlaylistCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PlaylistCollectionViewCell.self))
        return collectionView
    }()
    
    private func createSection() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(90)
        )
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(120)
        )
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    // 테스트 데이터
    private let testSongs = [
        ("Ditto", "NewJeans", "TJ 12345"),
        ("Shut Down", "BLACKPINK", "TJ 67890"),
        ("After LIKE", "IVE", "KY 11111"),
        ("ANTIFRAGILE", "LE SSERAFIM", "TJ 22222"),
        ("Nxde", "(G)I-DLE", "KY 33333"),
        ("LOVE DIVE", "IVE", "TJ 44444"),
        ("Pink Venom", "BLACKPINK", "KY 55555"),
        ("Attention", "NewJeans", "TJ 66666")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        createCollectionView()
    }
    
    private func setupUI() {
        title = "Playlist Test"
        view.backgroundColor = .black
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView DataSource
extension PlaylistTestViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlaylistCollectionViewCell.self), for: indexPath) as? PlaylistCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let song = testSongs[indexPath.item]
        cell.configure(title: song.0, artist: song.1, karaokeNumber: song.2)
        // 👆 configure 메서드가 없으니 일단 이렇게 두고 나중에 추가
        
        
        return cell
    }
}

// MARK: - CollectionView Delegate
extension PlaylistTestViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let song = testSongs[indexPath.item]
        print("선택된 노래: \(song.0) - \(song.1)")
    }
}

#Preview {
    PlaylistTestViewController()
}
