//
//  GameViewController.swift
//  MAPD-724-GAME
//
//  Created by Poojan on 1/22/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    
    var currentScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Initialize the Lives and Score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        CollisionManager.gameViewController = self
        
        SetScene(sceneName: "GameScene")
        
        //ScoreManager.Score = 0
        //ScoreManager.Lives = 5
        //updateLivesLabel()
        //updateScoreLabel()
            
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
        {
            ScoreLabel.text = "Score: \(ScoreManager.Score)"
        }
        
    func updateLivesLabel() -> Void
        {
            LivesLabel.text = "Lives: \(ScoreManager.Lives)"
        }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView? {
            
            // Load the SKScene
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
            
        }
        
    }
    
    func PresentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
        
    }
    
}
