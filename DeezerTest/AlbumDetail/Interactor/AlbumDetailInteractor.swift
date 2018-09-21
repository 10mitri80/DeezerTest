//
//  AlbumDetailInteractor.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

class AlbumDetailInteractor: AlbumDetailInteractorInputProtocol {
    weak var presenter: AlbumDetailInteractorOutputProtocol?
    var remoteDatamanager: AlbumDetailRemoteDataManagerInputProtocol?
    
    func getAlbumWithArtistId(artistId: Int) {
        remoteDatamanager?.getAlbumWithArtistId(artistId: artistId)
    }
}

extension AlbumDetailInteractor: AlbumDetailRemoteDataManagerOutputProtocol {
    
    func onAlbumsRetrieved(_ album: AlbumModel, tracks: [TrackModel]) {
        presenter?.didRetrieveAlbums(album, tracks: tracks)
    }
    
    func onError() {
        presenter?.onError()
    }
}
