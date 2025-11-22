//
//  SaveViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import SnapKit
import Then

class SaveViewController: BaseViewController {
    private let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func setStyle() {
        self.view.backgroundColor = .white
    }
    
    override func setUI() {
        self.view.addSubviews(tableView)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func setAction() {
        
    }
    
    private func register() {
        tableView.register(SaveViewCell.self, forCellReuseIdentifier: SaveViewCell.reuseIdentifier)
    }
}

extension SaveViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SaveViewCell.reuseIdentifier, for: indexPath) as? SaveViewCell else { return UITableViewCell() }
        
        cell.configure()
        return cell
    }
}

extension SaveViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // TODO: 뭐 삭제할지
            
            tableView.endUpdates()
        }
    }
}
