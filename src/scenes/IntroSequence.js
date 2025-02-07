import { 
    canvasSizes,
    zoom245x135,
    switchScene,
    transitionSpeed,
    fontSizeLarge
} from '../main'

class IntroSequence extends Phaser.Scene {
    constructor() {
      super("IntroSequence"),
      this.windowWidth,
      this.windowHeight
    }

    preload() {
      this.load.image("bg", "/assets/planetSelector/bg.png")
    }

    create() {
      this.cameras.main.fadeIn(transitionSpeed, 0, 0, 0)
      this.bg = this.add.image(0, 0, "bg").setOrigin(0,0).setScale(zoom245x135)
      this.text1 = this.add.text(0, 0, "Hello World!", {fontSize: fontSizeLarge})

      this.bg.setInteractive().on('pointerdown', () => {
        switchScene(this, 'PlanetSelector')
      })
    }

    update() {

    }
}

export default IntroSequence