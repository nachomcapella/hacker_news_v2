//
//  TableViewCell.swift
//  hacker_news_v2
//
//  Created by Mariano Martinez on 3/4/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit

protocol pushButtonProtocol: class {
    func iPushedAButton()
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: pushButtonProtocol? //own delegate
    
    @IBAction func favorite(_ sender: Any) {
        delegate?.iPushedAButton()
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setHackerNewsData (hackerNews: HackerNews){
        self.authorLabel.text = hackerNews.author ?? "Anon"
        self.dateLabel.text = hackerNews.created_at
        self.titleLabel.text = hackerNews.story_title ?? hackerNews.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
