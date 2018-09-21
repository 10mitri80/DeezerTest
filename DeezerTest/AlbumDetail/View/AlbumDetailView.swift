//
//  AlbumDetailView.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit
import AVFoundation

class AlbumDetailView: UIViewController {
    
    
    @IBOutlet weak var trackTableView: UITableView!
    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var albumNameLabel: UILabel!
    var artistId: Int!
    var album: AlbumModel!
    var tracks: [TrackModel] = []
    
    var presenter: AlbumDetailPresenterProtocol?
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.showAlbumDetail()
        self.trackTableView.dataSource = self
        self.trackTableView.delegate = self
    }
    
    func playSound(soundUrl: String) {
        let url = URL(string: soundUrl)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        player!.play()
    }
}

extension AlbumDetailView: AlbumDetailViewProtocol {
    func showAlbumDetail(with album: AlbumModel, tracks: [TrackModel]) {
        albumNameLabel?.text = album.name
        let url = URL(string: album.pictureUrl)!
        let placeholderImage = UIImage(named: "placeHolder")!
        albumImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        self.tracks = tracks
        self.trackTableView.reloadData()
    }
}

extension AlbumDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trackTableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackTableViewCell
        
        let track = tracks[indexPath.row]
        cell.set(forTrack: track, position: String(indexPath.row + 1))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSound(soundUrl: tracks[indexPath.row].preview)
    }
}

