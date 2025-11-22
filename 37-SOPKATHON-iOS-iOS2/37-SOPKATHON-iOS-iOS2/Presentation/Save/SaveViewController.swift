//
//  SaveViewController.swift
//  37-SOPKATHON-iOS-iOS2
//
//  Created by 홍준범 on 11/23/25.
//

import UIKit

import SnapKit
import Then
import Moya

class SaveViewController: BaseViewController {
    private let provider = MoyaProvider<SaveAPI>()
    
    private var savedPlaces: [SaveModel] = []
    private let tableView = UITableView().then {
        $0.register(SaveViewCell.self, forCellReuseIdentifier: SaveViewCell.reuseIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMyPlace()
    }
    
    override func setStyle() {
        self.view.backgroundColor = .white
        tableView.separatorStyle = .none
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
    
    private func fetchMyPlace() {
        provider.request(.getMyPlace) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(SaveResponse.self, from: response.data)
                    self.savedPlaces = decoded.data

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } catch {
                    print("❌ 디코딩 실패:", error)
                    if let json = String(data: response.data, encoding: .utf8) {
                        print("서버 응답 바디:", json)
                    }
                }

            case .failure(let error):
                print("❌ 네트워크 실패:", error)
            }
        }
    }
    
    
    
    
    
    private func pushToDetail() {
        let detailVC = SaveDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = savedPlaces[indexPath.row]
        pushToDetail()
    }
}

#Preview {
    SaveViewController()
}
