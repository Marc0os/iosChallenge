//
//  MoreInfoViewController.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import UIKit
import Kingfisher

class MoreInfoViewController: UIViewController {
    
    private let moreInfoView = MoreInfoView()
    let vm = MoreInfoViewModel()
    var repo: Item? = nil
    var isSavedData: Bool = false
    private var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupScreen()
        loadData()
    }
    
    func setupScreen() {
        moreInfoView.activityIndicator.startAnimating()
        
        moreInfoView.tablePulls.delegate = self
        moreInfoView.tablePulls.dataSource = self
        
        moreInfoView.saveButton.addTarget(self, action: #selector(saveRepo), for: .touchUpInside)
        moreInfoView.deleteButton.addTarget(self, action: #selector(removeRepo), for: .touchUpInside)
        changeButton()
        
        moreInfoView.repoName.text = self.repo?.name
        moreInfoView.fullName.text = self.repo?.fullname
        moreInfoView.fork.text = "\(self.repo!.forksCount) forks"
        moreInfoView.watchers.text = "\(self.repo!.watchersCount) watchers"
        moreInfoView.descriptionText.text = self.repo?.description
        moreInfoView.topicsText.text = formatTopics(topicsArray: self.repo?.topics)
        moreInfoView.created.text = "Created at \(formatDateString(from: self.repo!.createdAt))"
        moreInfoView.updated.text = "Pushed at \(formatDateString(from: self.repo!.pushedAt))"
        moreInfoView.owner.text = self.repo?.owner.login
        moreInfoView.ownerImage.kf.indicatorType = .activity
        moreInfoView.ownerImage.kf.setImage(with: URL(string: self.repo!.owner.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
        
        view = moreInfoView
        
    }
    
    func loadData() {
        if isSavedData {
            vm.getPullsCoreData(repoID: repo!.id)
            DispatchQueue.main.async {
                self.moreInfoView.tablePulls.reloadData()
                self.moreInfoView.activityIndicator.stopAnimating()
            }
        } else {
            dataTask = vm.getPulls(owner: repo!.owner.login, repository: repo!.name) {
                DispatchQueue.main.async {
                    self.moreInfoView.tablePulls.reloadData()
                    self.moreInfoView.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    func formatDateString(from dateString: String) -> String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yy"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = ISO8601DateFormatter().date(from: dateString) {
            let formattedDateString = outputFormatter.string(from: date)
            return formattedDateString
        } else {
            return "Invalid date"
        }
    }
    
    func formatTopics(topicsArray: [String]?) -> String {
        if let topics = topicsArray, !topics.isEmpty {
            let topicsString = topics.joined(separator: ", ")
            return topicsString
        } else {
            return "No topics available"
        }
    }
    
    @objc
    func saveRepo() {
        vm.createRepo(item: self.repo!, pulls: vm.pulls)
        
        notifyChanges()
        changeButton()
    }
    
    @objc
    func removeRepo() {
        vm.deleteRepo(id: self.repo!.id)
        
        notifyChanges()
        changeButton()
    }
    
    func changeButton() {
        self.moreInfoView.deleteButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? false : true
        self.moreInfoView.saveButton.isHidden = self.vm.existRepo(id: self.repo!.id) ? true : false
    }
    
    func notifyChanges() {
        NotificationCenter.default.post(name: Notification.Name("DatabaseChanged"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataTask?.cancel()
    }
}

extension MoreInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if vm.pulls.count == 0 && vm.pullsCoreData.count == 0 {
            return 1
        } else {
            if isSavedData {
                return vm.pullsCoreData.count
            } else {
                return vm.pulls.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if vm.pulls.count == 0 && vm.pullsCoreData.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoPullCell", for: indexPath) as! NoPullTableViewCell
            cell.selectionStyle = .none
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PullCell", for: indexPath) as! PullTableViewCell
            let pullCell: Pull
            
            if isSavedData {
                pullCell = vm.pullsCoreData[indexPath.row]
            } else {
                pullCell = vm.pulls[indexPath.row]
            }
            
            cell.title.text = "\(pullCell.number): \(pullCell.title)"
            cell.profilePic.kf.indicatorType = .activity
            cell.profilePic.kf.setImage(with: URL(string: pullCell.user.avatarURL), placeholder: nil, options: [.transition(.fade(0.5))])
            cell.userName.text = pullCell.user.login
            cell.created.text = "Created at \(formatDateString(from: pullCell.createdAt))"
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
