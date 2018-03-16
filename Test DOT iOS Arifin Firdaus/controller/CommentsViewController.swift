//
//  CommentsViewController.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    
    var postId: Int? {
        didSet {
            // fetch
            guard let postId = postId else { return }
            print("postId: \(postId)")
        }
    }
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: - Private function
    private func setupCell() {
        let nib = UINib(nibName: "CommentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "comment_cell")
    }
}

// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment_cell", for: indexPath) as! CommentCell
        return cell
    }
}

extension CommentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
