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
    private var isLoading = false
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupScreen()
    }
    
    func setupScreen(){
        homeView.tableGit.dataSource = self
        homeView.tableGit.delegate = self
        
        homeView.segmentedControl.addTarget(self, action: #selector(updateTableView), for: .valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: Notification.Name("DatabaseChanged"), object: nil)
        
        homeView.activityIndicator.startAnimating()
        
        title = "Repositórios iOS"
        view = homeView
    }
    
    @objc
    func loadData(){
        vm.getReposCoreData()
        isLoading = true
        dataTask = vm.getRepos(page: vm.currentPage) {
            DispatchQueue.main.async {
                self.updateTableView()
                self.homeView.activityIndicator.stopAnimating()
                self.isLoading = false
            }
        }
    }
    
    @objc
    func updateTableView(){
        homeView.tableGit.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataTask?.cancel()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("DatabaseChanged"), object: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            rows = vm.items.count
        case 1:
            rows = vm.itemsCoreData.count
        default:
            break
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitCell", for: indexPath) as! GitTableViewCell
        
        let itemCell: Item
        
        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            itemCell = vm.items[indexPath.row]
            
            cell.repoName.text = itemCell.name
            cell.userName.text = itemCell.owner.login
            cell.profilePic.kf.indicatorType = .activity
            cell.profilePic.kf.setImage(with: URL(string: itemCell.owner.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        case 1:
            itemCell = vm.itemsCoreData[indexPath.row]
            
            cell.repoName.text = itemCell.name
            cell.userName.text = itemCell.owner.login
            cell.profilePic.kf.indicatorType = .activity
            cell.profilePic.kf.setImage(with: URL(string: itemCell.owner.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
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
        
        switch homeView.segmentedControl.selectedSegmentIndex {
        case 0:
            second.repo = vm.items[indexPath.row]
        case 1:
            second.repo = vm.itemsCoreData[indexPath.row]
        default:
            break
        }
        
        navigationController?.pushViewController(second, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height * 1.5 {
            if !isLoading {
                vm.currentPage += 1
                loadData()
            }
        }
    }
    
}

