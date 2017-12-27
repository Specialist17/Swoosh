//
//  LeagueVC.swift
//  app-swoosh
//
//  Created by Fernando on 12/23/17.
//  Copyright © 2017 Specialist. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {

    var player: Player!
    
    @IBOutlet weak var nextBtn: BorderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        player = Player()
        nextBtn.isEnabled = false
    }

    @IBAction func unwindFromSkillVC(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @IBAction func onNextTapped(_ sender: BorderButton) {
        
        performSegue(withIdentifier: "showSkillVCSegue", sender: self)
        
    }
    
    
    @IBAction func onMensTapped(_ sender: BorderButton) {
        selectLeague(leagueType: "mens")
        
    }
    
    @IBAction func onWomensTapped(_ sender: BorderButton) {
        selectLeague(leagueType: "womens")
    }
    
    @IBAction func onCoEdTapped(_ sender: BorderButton) {
        selectLeague(leagueType: "co-ed")
    }
    
    func selectLeague(leagueType: String) {
        player.desiredLeague = leagueType
        nextBtn.isEnabled = true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC {
            skillVC.player = self.player
        }
    }

}
