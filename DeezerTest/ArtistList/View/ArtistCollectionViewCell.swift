//
//  ArtistCollectionViewCell.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-18.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit
import AlamofireImage

class ArtistCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artistImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forArtist artist: ArtistModel) {
        titleLabel?.text = artist.name
        let url = URL(string: artist.pictureUrl)!
        let placeholderImage = UIImage(named: "placeHolder")!
        artistImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
