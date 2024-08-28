//
//  DAOService.swift
//  iosChallenge
//
//  Created by Marcos Costa on 26/08/24.
//

import Foundation
import CoreData

class DAOService {
    
    private let manager = CoreDataManager.shared
    
    private func getRepoEntities() -> [RepoEntity]? {
        let request: NSFetchRequest<RepoEntity> = RepoEntity.fetchRequest()
        
        do {
            return try manager.context.fetch(request)
        } catch {
#if DEBUG
            print("Error while retrieving projects: \(error.localizedDescription)")
#endif
            return nil
        }
    }
    
    func getRepoById(id: Int32) -> RepoEntity? {
        guard let projects = getRepoEntities() else { return nil }
        return projects.first(where: { $0.id == id })
    }
    
    func existRepoById(id: Int32) -> Bool {
        guard let projects = getRepoEntities() else { return false }
        if projects.first(where: { $0.id == id }) != nil {
            return true
        } else {
            return false
        }
    }
    
    func getItems() -> [Item] {
        guard let entities = getRepoEntities() else { return [] }
        
        return entities.map { entity in
                        
            let topics = (entity.topics ?? "[]").data(using: .utf8)
            let topicsArray = (try? JSONSerialization.jsonObject(with: topics!, options: [])) as? [String] ?? []
            
            return Item(id: entity.id,
                        name: entity.name!,
                        fullname: entity.fullname!,
                        owner: Owner(login: entity.owner!, avatarURL: entity.avatarURL!),
                        htmlURL: entity.htmlURL ?? "",
                        description: entity.descriptionText!,
                        createdAt: entity.createdAt!,
                        pushedAt: entity.pushedAt!,
                        watchersCount: entity.watchersCount,
                        forksCount: entity.forksCount,
                        topics: topicsArray
            )
        }
    }
    
    func createRepo(item: Item, pulls: [Pull]) {
        let repo = RepoEntity(context: manager.context)
        repo.id = item.id
        repo.name = item.name
        repo.fullname = item.fullname
        repo.owner = item.owner.login
        repo.avatarURL = item.owner.avatarURL
        repo.htmlURL = repo.htmlURL
        repo.descriptionText = item.description
        repo.createdAt = item.createdAt
        repo.pushedAt = item.pushedAt
        repo.watchersCount = item.watchersCount
        repo.forksCount = item.forksCount
        let topicsData = try? JSONSerialization.data(withJSONObject: item.topics, options: [])
        repo.topics = String(data: topicsData!, encoding: .utf8) ?? "[]"
        
        let pullEntities = pulls.map { pull in
            let pullEntity = PullEntity(context: manager.context)
            pullEntity.id = pull.id
            pullEntity.title = pull.title
            pullEntity.number = pull.number
            pullEntity.htmlURL = pull.htmlURL
            pullEntity.user = pull.user.login
            pullEntity.avatarURL = pull.user.avatarURL
            pullEntity.createdAt = pull.createdAt
            
            pullEntity.repo = repo
            return pullEntity
        }
        repo.addToPulls(NSSet(array: pullEntities))
        manager.save()
    }
    
    func getPullsByRepoID(repoID: Int32) -> [Pull]? {
        guard let repo = getRepoById(id: repoID) else { return nil }
        
        let pullEntities = repo.pulls?.allObjects as? [PullEntity] ?? []
        
        let pulls = pullEntities.map { pullEntity in
            Pull(id: pullEntity.id,
                 htmlURL: pullEntity.htmlURL!,
                 number: pullEntity.number,
                 title: pullEntity.title!,
                 user: User(login: pullEntity.user!, avatarURL: pullEntity.avatarURL!),
                 createdAt: pullEntity.createdAt!)
        }
        return pulls
    }
    
    func deleteRepoByID(id: Int32) {
        guard let repo = getRepoById(id: id) else { return }
        
        manager.context.delete(repo)
        manager.save()
    }
}
