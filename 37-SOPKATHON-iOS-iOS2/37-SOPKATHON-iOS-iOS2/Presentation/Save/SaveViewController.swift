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
    private var savedPlaces: [SaveModel] = SaveModel.mockData
    
    private let tableView = UITableView().then {
        $0.register(SaveViewCell.self, forCellReuseIdentifier: SaveViewCell.reuseIdentifier)
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
}

extension SaveViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SaveViewCell.reuseIdentifier, for: indexPath) as? SaveViewCell else { return UITableViewCell() }
        
        let model = savedPlaces[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension SaveViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            savedPlaces.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // TODO: 뭐 삭제할지
            
            tableView.endUpdates()
        }
    }
}

#Preview {
    SaveViewController()
}
