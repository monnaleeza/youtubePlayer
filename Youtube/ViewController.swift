//
//  ViewController.swift
//  Youtube
//
//  Created by MAC on 09/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import YouTubePlayer
import SDWebImage
class ViewController: UIViewController, YouTubePlayerDelegate {
    @IBOutlet var youtube_player: YouTubePlayerView!
    @IBOutlet var image_view: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        if data["media_type"] == "youtube" {
            youtube_player.isHidden = false
            image_view.isHidden = true
            let myVideoURL = URL(string: data["url"]!)
            youtube_player.delegate = self
            youtube_player.playerVars = [
                "playsinline": "1"
//                "origin":"https://www.youtube.com"
            ] as YouTubePlayerView.YouTubePlayerParameters
            youtube_player.loadVideoURL(myVideoURL!)
            
        }else{
            youtube_player.isHidden = true
            image_view.isHidden = false
            image_view.sd_setImage(with: URL(string: data["url"]!), placeholderImage: nil, options: .refreshCached) { (image, error, type, url) in
                self.indicator.stopAnimating()
            }
        }
    }
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        indicator.stopAnimating()
//        videoPlayer.play()
    }
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
//        if playerState == .Playing || playerState == .Unstarted {
////            indicator.stopAnimating()
//        }
    }
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
        
    }
}

