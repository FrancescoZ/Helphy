//
//  TableViewController.swift
//  Helphy
//
//  Created by Francesco Zanoli on 15/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift

public class SearchViewController: UITableViewController{
    ///Get the viewModel from the app delegate
    let users: [UserViewModel] = (UIApplication.shared.delegate as! AppDelegate).users
    var showUsers: [UserViewModel] = (UIApplication.shared.delegate as! AppDelegate).users

    
    internal var currentCell: UserCell?
    @IBOutlet weak var searchBar: UISearchBar!
    let disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        searchBar!
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                self.showUsers = self.users.filter  { $0.nickname.hasPrefix(query.lowercased()) ||
                      $0.name.hasPrefix(query.lowercased()) ||
                      $0.surname.hasPrefix(query.lowercased())
                    }
                self.tableView.reloadData()
            })
            .addDisposableTo(disposeBag)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        currentCell=nil
    }
    
    //Table view' row counter
    public override func tableView(_ tableView: UITableView,
                                   numberOfRowsInSection section: Int) -> Int {
        return showUsers.count
    }
    
    //Display cell
    public override func tableView(_ tableView: UITableView,
                                   willDisplay cell: UITableViewCell,
                                   forRowAt indexPath: IndexPath) {
        //Cell to create
        guard let cell = cell as? UserCell else { return }
        //Index in the data
        let index = indexPath.row % showUsers.count
        
        //user's data
        let userName = showUsers[index].nickname
        let profileImage = ImageHelper.RetriveImage(
                atPath:showUsers[index].profileImage,
                orDefault: .Profile)
        let backgroundImage = ImageHelper.RetriveImage(
                atPath:showUsers[index].backgroundProfileImage,
                orDefault: .Background)
        
        //Set cell from data
        cell.setCell(of: userName, withBackground: backgroundImage,
                     withImageProfile: profileImage)
        
    }
    
    public override func tableView(_ tableView: UITableView,
                                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "UserCell",
                                             for: indexPath)
    }
    
    public override func tableView(_ tableView: UITableView,
                                   willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
        
        guard let currentCell = tableView.cellForRow(at: indexPath)
            as? UserCell else {
            return indexPath
        }
        
        self.currentCell = currentCell
        return indexPath
    }
    
    
    public override func tableView(_ tableView: UITableView,
                                   didSelectRowAt indexPath: IndexPath) {
        
        guard let currentCell = currentCell else {
                fatalError("current cell is empty or add navigationController")
        }
        if let currentIndex = tableView.indexPath(for: currentCell) {
            let nextIndex = IndexPath(row: (currentIndex as NSIndexPath).row + 1,
                                      section: (currentIndex as NSIndexPath)
                                                                    .section)
            if case let nextCell as UserCell = tableView.cellForRow(
                                                                at: nextIndex) {
                nextCell.superview?.bringSubview(toFront: nextCell)
            }
        }

        //Index in the data
        let index = indexPath.row % showUsers.count
        
        //Use navigator for the detail 
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let photoDetailViewController = storyBoard.instantiateViewController(
            withIdentifier: "PhotoDetailViewController")
                as! PhotoDetailViewController
        
        photoDetailViewController.setupView(
            forUsername: showUsers[index].nickname,
            withPhotos: showUsers[index]
                .getPhotosFromLiked(from: 0,
                                    to: showUsers[index].getGalleryCount()),
            atIndex: 0,
            inMode: .UICell)
        self.present(photoDetailViewController, animated:true, completion:nil)
        
        
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}


