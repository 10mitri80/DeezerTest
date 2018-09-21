//
//  ArtistListPresenter.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-17.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

class ArtistListPresenter: ArtistListPresenterProtocol {
    weak var view: ArtistListViewProtocol?
    var interactor: ArtistListInteractorInputProtocol?
    var wireFrame: ArtistListWireFrameProtocol?
    
    func searchArtistsByName(name: String) {
        interactor?.searchArtistsByName(name: name)
    }
    
    func showAlbumDetail(forArtistId artistId: Int) {
        wireFrame?.presentAlbumDetailScreen(from: view!, forArtistId: artistId)
    }
}

extension ArtistListPresenter: ArtistListInteractorOutputProtocol {
    
    func didRetrieveArtists(_ artists: [ArtistModel]) {
        view?.showArtists(with: artists)
    }
    
    func onError() {
        view?.showError()
    }
}


