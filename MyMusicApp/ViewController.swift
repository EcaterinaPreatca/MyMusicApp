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
        
        songs.append(Song(name: "Lovefool",
                          albumName: "album: Lovefool Collection - EP",
                          artistName: "Twocolors",
                          imageName: "track_Lovefool_Twocolors",
                          trackName: "Lovefool_Twocolors"))
        songs.append(Song(name: "Фонари",
                          albumName: "альбом: Часть 1",
                          artistName: "Баста и Тати",
                          imageName: "track_Баста_и_Тати_-_Фонари",
                          trackName: "Basta"))
        songs.append(Song(name: "I got Love",
                          albumName: "album: Hajime",
                          artistName: "MiyaGi & Andy Panda",
                          imageName: "track_MiyaGi_&_Andy_Panda-_I_got_love",
                          trackName: "MiyaGi_&_Andy_Panda-_I_got_love"))
        songs.append(Song(name: "Это любовь",
                          albumName: "альбом: Дом с нормальными явлениями",
                          artistName: "Скриптонит",
                          imageName: "track_Скриптонит_Это_любовь",
                          trackName: "Scriptonit"))
        songs.append(Song(name: "Astronaut In The Ocean",
                          albumName: "album: Astronaut In The Ocean",
                          artistName: "Masked Wolf",
                          imageName: "track_Masked-wolf_-_astronaut-in-the-ocean",
                          trackName: "Masked-wolf_-_astronaut-in-the-ocean"))
        songs.append(Song(name: "F..c That",
                          albumName: "album: F..c That",
                          artistName: "Bastard!",
                          imageName: "track_Bastard_F..c_That",
                          trackName: "Bastard_F..c_That"))
        songs.append(Song(name: "Жить в кайф",
                          albumName: "альбом: Жить в кайф",
                          artistName: "Макс Корж",
                          imageName: "track_Korz",
                          trackName: "Korz"))
        songs.append(Song(name: "Don't Be Shy",
                          albumName: "album: Don't Be Shy",
                          artistName: "Tiësto & Karol G",
                          imageName: "track10",
                          trackName: "Tiesto_-_don-t-be-shy"))
        songs.append(Song(name: "Красиво",
                          albumName: "альбом: Океан",
                          artistName: "Валерий Меладзе",
                          imageName: "track4",
                          trackName: "song4"))
        songs.append(Song(name: "На берегу неба",
                          albumName: "альбом: На берегу неба",
                          artistName: "Дима Билан",
                          imageName: "track5",
                          trackName: "song5"))
        songs.append(Song(name: "Read My Lips",
                          albumName: "album: Read My Lips",
                          artistName: "INNA x Farina",
                          imageName: "track9",
                          trackName: "song9"))
        songs.append(Song(name: "Плачут небеса",
                          albumName: "альбом: Новые люди",
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
        cell.detailTextLabel?.text = song.artistName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 18)
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


