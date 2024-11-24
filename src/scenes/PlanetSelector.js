import { 
    canvasSizes,
    zoom245x135,
    switchScene
} from '../main'

class PlanetSelector extends Phaser.Scene {
    constructor() {
      super("PlanetSelector"),
      this.windowWidth,
      this.windowHeight
    }

    preload() {
      this.load.image("bg", "/assets/planetSelector/bg.png")
      this.load.image("arrowBack", "/assets/planetSelector/arrowBack.png")
      this.load.image("arrowLeft", "/assets/planetSelector/arrowLeft.png")
      this.load.image("arrowRight", "/assets/planetSelector/arrowRight.png")
      this.load.image("planetEarth", "/assets/planetSelector/planetEarth.png")
      this.load.image("planetVenus", "/assets/planetSelector/planetVenus.png")
      this.load.image("textEarth", "/assets/planetSelector/textEarth.png")
      this.load.image("textVenus", "/assets/planetSelector/textVenus.png")

      this.showCurrentPlanet = () => {
        this.planetNames.forEach((currentPlanetName, index) => {
          if (this.planetNames[this.currentPlanetIndex] == currentPlanetName)
          {
            this.planets[index].visible = true
            this.texts[index].visible = true
          }
          else {
            this.planets[index].visible = false;
            this.texts[index].visible = false;
          }
        })
      }

      this.showArrows = () => {
        if (this.planetNames[this.currentPlanetIndex] == this.planetNames[0])
        {
          this.arrowLeft.visible = false;
        }
        else {
          this.arrowLeft.visible = true;
        }
    
        if (this.planetNames[this.currentPlanetIndex] == this.planetNames[this.planetNames.length - 1])
        {
          this.arrowRight.visible = false;
        }
        else {
          this.arrowRight.visible = true;
        }
      }
    }

    create() {
      this.arrowOffsetX = 300
      this.textOffset = 175
      this.planetNames = ["Earth", "Venus"]
      this.currentPlanetIndex = 0
      this.currentPlanetName = this.planetNames[this.currentPlanetIndex]

      this.cameras.main.fadeIn(1000, 0, 0, 0)
      this.bg = this.add.image(0, 0, "bg").setOrigin(0,0).setScale(zoom245x135)
      this.arrowBack = this.add.image(50, 50, "arrowBack").setOrigin(0,0).setScale(zoom245x135)
      this.arrowLeft = this.add.image(this.arrowOffsetX, canvasSizes.height / 2, "arrowLeft").setScale(zoom245x135)
      this.arrowRight = this.add.image(canvasSizes.width - this.arrowOffsetX, canvasSizes.height / 2, "arrowRight").setScale(zoom245x135)

      this.planets = []
      this.texts = []

      this.planets[0] = this.add.image(canvasSizes.width / 2, canvasSizes.height / 2, "planetEarth").setScale(zoom245x135)
      this.planets[1] = this.add.image(canvasSizes.width / 2, canvasSizes.height / 2, "planetVenus").setScale(zoom245x135)
      this.texts[0] = this.add.image(canvasSizes.width / 2, canvasSizes.height - this.textOffset, "textEarth").setScale(zoom245x135)
      this.texts[1] = this.add.image(canvasSizes.width / 2, canvasSizes.height - this.textOffset, "textVenus").setScale(zoom245x135)

      
      this.arrowBack.setInteractive().on('pointerdown', () => {
        switchScene(this, "MenuScene")
      })

      this.arrowRight.setInteractive().on('pointerdown', () => {
        this.currentPlanetIndex++;
        this.currentPlanetName = this.planetNames[this.currentPlanetIndex]
      })

      this.arrowLeft.setInteractive().on('pointerdown', () => {
        this.currentPlanetIndex--;
        this.currentPlanetName = this.planetNames[this.currentPlanetIndex]
      })
    }

    update() {
      this.showCurrentPlanet()
      this.showArrows()
    }
}

export default PlanetSelector