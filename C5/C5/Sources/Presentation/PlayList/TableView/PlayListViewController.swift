//
//  PlayListViewController.swift
//  C5
//
//  Created by Soop on 8/17/25.
//

import UIKit

class PlayListViewController: UIViewController {
    
    private let tableView = UITableView()
    private let dataSource = Music.sample

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAutoLayout()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        view.addSubview(tableView)
        tableView.delegate = self
            tableView.dataSource = self
            tableView.register(PlaylistTableViewCell.self, forCellReuseIdentifier: String(describing: PlaylistTableViewCell.self))
    }
    
    func setAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension PlayListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlaylistTableViewCell.self), for: indexPath) as? PlaylistTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(music: dataSource[indexPath.row])
        
        return cell
    }
}
