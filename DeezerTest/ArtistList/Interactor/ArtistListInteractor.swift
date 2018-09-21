//
//  ArtistListInteractor.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

class ArtistListInteractor: ArtistListInteractorInputProtocol {
    weak var presenter: ArtistListInteractorOutputProtocol?
    var remoteDatamanager: ArtistListRemoteDataManagerInputProtocol?
    
    func searchArtistsByName(name:String) {
        remoteDatamanager?.searchArtistsByName(name: name)
    }
}

extension ArtistListInteractor: ArtistListRemoteDataManagerOutputProtocol {

    func onArtistsRetrieved(_ artists: [ArtistModel]) {
        presenter?.didRetrieveArtists(artists)
    }

    func onError() {
        presenter?.onError()
    }
}
