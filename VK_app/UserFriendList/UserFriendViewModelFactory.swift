//
//  UserFriendViewModelFactory.swift
//  VK_app
//
//  Created by Nikolay Trofimov on 24.09.2020.
//  Copyright © 2020 Nikolay.Trofimov. All rights reserved.
//

import Foundation

final class UserFriendViewModelFactory {
    
    func constructViewModels(from friends: [Friend]) -> [UserFriendViewModel] {
        return friends.compactMap(self.viewModel)
    }
    
    private func viewModel(from friendList: Friend) -> UserFriendViewModel  {
        let friendName = friendList.first_name
        let friendSurname = friendList.last_name
        let friendListPhoto = friendList.photo
        
        return UserFriendViewModel(friendName: friendName,
                                   friendSurname: friendSurname,
                                   friendImageAvatar: friendListPhoto)
    
    }

}
