//
//  AlbumDetailPresenter.swift
//  DeezerTest
//
//  Created by Dimitri Cadars on 18-09-19.
//  Copyright © 2018 Dimitri Cadars. All rights reserved.
//

import Foundation

class AlbumDetailPresenter: AlbumDetailPresenterProtocol {
    
    weak var view: AlbumDetailViewProtocol?
    var interactor: AlbumDetailInteractorInputProtocol?
    var wireFrame: AlbumDetailWireFrameProtocol?
    var artistId: Int?
    
    func showAlbumDetail() {
        interactor?.getAlbumWithArtistId(artistId: artistId!)
    }
}

extension AlbumDetailPresenter: AlbumDetailInteractorOutputProtocol {
    
    func didRetrieveAlbums(_ album: AlbumModel, tracks: [TrackModel]) {
        view?.showAlbumDetail(with: album, tracks: tracks)
    }
    
    func onError() {
        print("error")
    }
}
