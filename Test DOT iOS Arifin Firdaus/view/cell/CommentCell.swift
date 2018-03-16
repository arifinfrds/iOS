//
//  CommentCell.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    // MARKL - Properties
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var dataSource: CommentElement? {
        didSet {
            updateUI()
        }
    }
    
    
    // MARK: - view life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bodyLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private function
    private func updateUI() {
        guard let dataSource = dataSource else { return }
        postIdLabel.text = "PostID : \(dataSource.postID)"
        idLabel.text = "ID: \(dataSource.id)"
        nameLabel.text = dataSource.name
        emailLabel.text = dataSource.email
        bodyLabel.text = dataSource.body
    }
    
}
