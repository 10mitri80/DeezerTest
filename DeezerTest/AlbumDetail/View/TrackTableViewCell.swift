//
//  TrackTableViewCell.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-20.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trackNumberLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    func set(forTrack track: TrackModel, position: String) {
        trackNameLabel?.text = track.name
        trackNumberLabel.text = position
    }
}
