//
//  UserViewModel.swift
//  protocol-orientated-programming
//
//  Created by YUSUF ÖZATA on 6.02.2023.
//

import Foundation

protocol UserViewModelOutput: AnyObject {
    func updateView(imageURL: String, email: String)
}

class UserViewModel{
    private let userService: UserService
    weak var output: UserViewModelOutput?
    
    init(service: UserService) {
        self.userService = service
    }
    func fetchUser() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(imageURL: user.avatar, email: user.email)
            case .failure:
                let errorImageUrl = "https://cdn1.iconfinder.com/data/icons/user-fill-icons-set/144/User003_Error-1024.jpg"
                self?.output?.updateView(imageURL: errorImageUrl, email: "No User Found")
            }
        }
    }
    
}
