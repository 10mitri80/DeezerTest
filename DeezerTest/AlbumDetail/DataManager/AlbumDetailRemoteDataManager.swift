//
//  AlbumDetailRemoteDataManager.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AlbumDetailRemoteDataManager:AlbumDetailRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: AlbumDetailRemoteDataManagerOutputProtocol?
    fileprivate var tracksList = [TrackModel]()
    
    func getAlbumWithArtistId(artistId: Int){
        Alamofire
            .request(Endpoints.Albums.fetch.url + "\(artistId)/albums", method: .get)
            .validate()
            .responseArray(keyPath: "data", completionHandler: { (response: DataResponse<[AlbumModel]>) in
                switch response.result {
                case .success(let albums):
                    if albums.count != 0 {
                        self.getTracksFromAlbum(album: albums[0])
                    }
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
    private func getTracksFromAlbum(album: AlbumModel){
        Alamofire
            .request(Endpoints.Tracks.fetch.url + "\(album.id)/tracks")
            .validate()
            .responseArray(keyPath: "data", completionHandler: { (response: DataResponse<[TrackModel]>) in
                switch response.result {
                case .success(let tracks):
                    self.tracksList = tracks
                    self.remoteRequestHandler?.onAlbumsRetrieved(album, tracks: tracks)
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
}
