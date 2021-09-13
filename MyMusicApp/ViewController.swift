//
//  ViewController.swift
//  MyMusicApp
//
//  Created by Ecaterina Preatca on 12.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs() {
        songs.append(Song(name: "Фонари",
                          albumName: "Часть 1",
                          artistName: "Баста и Тати",
                          imageName: "track1",
                          trackName: "song1"))
        songs.append(Song(name: "Это любовь",
                          albumName: "Дом с нормальными явлениями",
                          artistName: "Скриптонит",
                          imageName: "track2",
                          trackName: "song2"))
        songs.append(Song(name: "Жить в кайф",
                          albumName: "Жить в кайф",
                          artistName: "Макс Корж",
                          imageName: "track3",
                          trackName: "song3"))
        songs.append(Song(name: "Красиво",
                          albumName: "Все так и было",
                          artistName: "Валерий Меладзе",
                          imageName: "track4",
                          trackName: "song4"))
        songs.append(Song(name: "На берегу неба",
                          albumName: "На берегу неба",
                          artistName: "Дима Билан",
                          imageName: "track5",
                          trackName: "song5"))
        songs.append(Song(name: "Плачут небеса",
                          albumName: "Новые люди",
                          artistName: "Тимати",
                          imageName: "track6",
                          trackName: "song6"))
    }
    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player")  as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}


