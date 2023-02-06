//
//  UserViewModel.swift
//  protocol-orientated-programming
//
//  Created by YUSUF ÖZATA on 6.02.2023.
//

import UIKit

class UserViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchUsers()
    }
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 56),
            emailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4)
        ])
    }
    
    private func fetchUsers() {
        viewModel.fetchUser()
    }
}

//MARK: - UserViewModelOutput
extension UserViewController: UserViewModelOutput {
    func updateView(imageURL: String, email: String) {
        let imageData = try! NSData(contentsOf: .init(string: imageURL)!) as Data
        self.imageView.image = UIImage(data: imageData)
        self.emailLabel.text = email
    }
}
