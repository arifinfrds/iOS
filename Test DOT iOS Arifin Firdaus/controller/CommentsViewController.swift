//
//  CommentsViewController.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import Alamofire

class CommentsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    internal var comments = [CommentElement]()
    private var activityIndicatorView: UIActivityIndicatorView!
    
    
    var postId: Int? {
        didSet {
            print("postId: \(String(describing: postId))")
        }
    }
    
    // MARK: - view life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.startAnimating()
        guard let postId = postId else { return }
        fetchComment(withPostId: postId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActivityIndicatorView()
        setupCell()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: - Private function
    private func setupCell() {
        let nib = UINib(nibName: "CommentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "comment_cell")
    }
    
    private func setupActivityIndicatorView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .blue
        activityIndicatorView.center = CGPoint(x: view.frame.width / 2, y: (view.frame.width / 2) + (view.frame.width / 3))
        view.addSubview(activityIndicatorView)
    }
    
    private func fetchComment(withPostId postId: Int) {
        Alamofire.request(NetworkManager.getCommentsUrl(withId: postId)).responseComment { (response) in
            if response.result.isSuccess {
                if let comments = response.result.value {
                    self.comments = comments
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
    
    
    private func updateUI(withStatus success: Bool) {
        if success {
            activityIndicatorView.stopAnimating()
            tableView.reloadData()
        } else {
            activityIndicatorView.stopAnimating()
            showAlertController(with: "Error", message: "Terjadi kesalahan")
        }
    }
    
}




// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment_cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.dataSource = comment
        return cell
    }
}

extension CommentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
