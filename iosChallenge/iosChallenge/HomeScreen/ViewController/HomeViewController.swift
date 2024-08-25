//
//  HomeViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    let vm = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupScreen()
        
    }
    
    func setupScreen(){
        homeView.tableGit.dataSource = self
        homeView.tableGit.delegate = self
        
        homeView.segmentedControl.addTarget(self, action: #selector(updateTableView), for: .valueChanged)
        
        homeView.activityIndicator.startAnimating()
        
        title = "Repositórios iOS"
        view = homeView
    }
    
    func loadData(){
        vm.getRepos {
            DispatchQueue.main.async {
                self.updateTableView()
                self.homeView.activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc
    func updateTableView(){
        homeView.tableGit.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            rows = vm.items.count
        case 1:
            rows = 0
        default:
            break
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitCell", for: indexPath) as! GitTableViewCell
        
        let itemCell: Item = vm.items[indexPath.row]

        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            cell.repoName.text = itemCell.name
            cell.userName.text = itemCell.owner.login
            cell.profilePic.kf.indicatorType = .activity
            cell.profilePic.kf.setImage(with: URL(string: itemCell.owner.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        case 1:
            cell.repoName.text = ""
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let second = MoreInfoViewController()
        second.repo = vm.items[indexPath.row]
        navigationController?.pushViewController(second, animated: true)
    }
}

