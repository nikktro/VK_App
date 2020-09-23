//
//  UserGroupViewModelFactory.swift
//  VK_app
//
//  Created by Nikolay Trofimov on 24.09.2020.
//  Copyright © 2020 Nikolay.Trofimov. All rights reserved.
//

import Foundation

final class UserGroupViewModelFactory {
    
    func constructViewModels(from groups: [Group]) -> [UserGroupViewModel] {
        return groups.compactMap(self.viewModel)
    }
    
    private func viewModel(from groupList: Group) -> UserGroupViewModel {
        let userGroup = groupList.name
        let userGroupImage = groupList.photo
        
        return UserGroupViewModel(userGroup: userGroup, userGroupImage: userGroupImage)
        
    }
    
    
    
    
}
