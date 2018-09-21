//
//  ArtistListView.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import UIKit

class ArtistListView: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter: ArtistListPresenterProtocol?
    var artistList: [ArtistModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.searchArtistsByName(name: "all")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.searchBar.delegate = self
    }
}

extension ArtistListView: ArtistListViewProtocol {

    func showArtists(with artists: [ArtistModel]) {
        artistList = artists
        collectionView.reloadData()
    }

    func showError() {
        print("Internet not connected")
    }
}

extension ArtistListView: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath) as! ArtistCollectionViewCell
        
        let artist = artistList[indexPath.row]
        cell.set(forArtist: artist)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.showAlbumDetail(forArtistId: artistList[indexPath.row].id)
    }
}

extension ArtistListView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.presenter?.searchArtistsByName(name: searchText)
        self.collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.searchBar.resignFirstResponder()
    }
}
