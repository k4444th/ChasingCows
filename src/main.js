import './style.css'
import Phaser from 'phaser'

class GameScene extends Phaser.Scene {
  constructor() {
    super("scene-game"),
    this.windowWidth,
    this.windowHeight
  }

  preload() {
    this.load.image("pleaseTurnYourDevice", "/assets/pleaseTurnYourDevice.png")
  }

  create() {
    this.pleaseTurnYourDevice = this.add.image(0, 0, "pleaseTurnYourDevice").setOrigin(0,0)
  }

  update() {
    this.windowWidth = window.innerWidth;
    this.windowHeight = window.innerHeight;

    if (this.windowWidth <= this.windowHeight) {
      this.pleaseTurnYourDevice.setScale(zoom);
      this.pleaseTurnYourDevice.visible = true;
    }
    else {
      this.pleaseTurnYourDevice.visible = false;
    }
  }
}

const canvasSizes = {
  height: 1080,
  width: 1960
}

const zoom = 14;

const config = {
  type: Phaser.WEBGL,
  canvas: gameCanvas,
  height: canvasSizes.height,
  width: canvasSizes.width,
  pixelArt: true,
  scene:[GameScene]
}

const game = new Phaser.Game(config);