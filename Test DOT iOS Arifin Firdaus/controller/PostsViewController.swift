//
//  PostsViewController.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    internal var posts = [WelcomeElement]()
    private var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        activityIndicatorView.startAnimating()
        fetchPosts()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
        setupActivityIndicatorView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    private func setupCell() {
        let nib = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "post_cell")
    }
    
    private func setupActivityIndicatorView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .blue
        activityIndicatorView.center = CGPoint(x: view.frame.width / 2, y: (view.frame.width / 2) + (view.frame.width / 3))
        view.addSubview(activityIndicatorView)
    }

    private func updateUI(withStatus success: Bool) {
        if success {
            activityIndicatorView.stopAnimating()
            tableView.reloadData()
        } else {
            activityIndicatorView.stopAnimating()
            showAlertController(with: "Error", message: "Terjadi kesalahan")
        }
    }
    
    private func fetchPosts() {
        Alamofire.request(NetworkManager.PostsUrl).responseWelcome { response in
            if response.result.isSuccess {
                if let welcome = response.result.value {
                    self.posts = welcome
                    DispatchQueue.main.async {
                        self.updateUI(withStatus: true)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.updateUI(withStatus: false)
                }
            }
        }
    }
    
}


// MARK: - UITableViewDataSource
extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "post_cell", for: indexPath) as! PostCell
        let dataSource = posts[indexPath.row]
        cell.dataSource = dataSource
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
