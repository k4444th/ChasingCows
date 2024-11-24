import { 
    canvasSizes,
    zoom245x135,
    switchScene
} from './../main'

class MenuScene extends Phaser.Scene {
    constructor() {
        super("MenuScene"),
        this.windowWidth,
        this.windowHeight
    }

    preload() {
        this.load.image("bg", "/assets/menu/bg.png")
        this.load.image("planetOrange", "/assets/menu/planetOrange.png")
        this.load.image("planetRed", "/assets/menu/planetRed.png")
        this.load.image("planetEarth", "/assets/menu/planetEarth.png")
        this.load.image("logo", "/assets/menu/logo.png")
        this.load.image("playBtn", "/assets/menu/playBtn.png")
        this.load.image("settingsBtn", "/assets/menu/settingsBtn.png")
        this.load.image("shopBtn", "/assets/menu/shopBtn.png")

        this.planetOrangeCoords = [canvasSizes.width * 0.65, canvasSizes.height * 0.7]
        this.planetRedCoords = [canvasSizes.width * 0.9, canvasSizes.height * 0.2]
        this.planetEarthCoords = [canvasSizes.width * 0.1, canvasSizes.height * 0.8]

        this.planetOrangeSpeed = 0.2
        this.planetRedSpeed = 0.35
        this.planetEarthSpeed = 0.6

        this.movePlanets = () => {
        this.planetOrange.x += this.planetOrangeSpeed
        this.planetRed.x += this.planetRedSpeed
        this.planetEarth.x += this.planetEarthSpeed

        if (this.planetOrange.x > canvasSizes.width * 1.25)
        {
            this.planetOrange.x = -(canvasSizes.width * 0.25)
        }
        if (this.planetRed.x > canvasSizes.width * 1.25)
        {
            this.planetRed.x = -(canvasSizes.width * 0.25)
        }
        if (this.planetEarth.x > canvasSizes.width * 1.25)
        {
            this.planetEarth.x = -(canvasSizes.width * 0.25)
        }
        }

        this.scaleButtons = buttonName => {
        buttonName.setInteractive().on('pointerover', () => {
            buttonName.setScale(zoom245x135 * 1.05);
        })

        buttonName.setInteractive().on('pointerout', () => {
            buttonName.setScale(zoom245x135);
        })
        }
    }

    create() {
        this.cameras.main.fadeIn(1000, 0, 0, 0)

        this.bg = this.add.image(0, 0, "bg").setOrigin(0,0).setScale(zoom245x135)
        this.planetOrange = this.add.image(this.planetOrangeCoords[0], this.planetOrangeCoords[1], "planetOrange").setScale(zoom245x135)
        this.planetRed = this.add.image(this.planetRedCoords[0], this.planetRedCoords[1], "planetRed").setScale(zoom245x135)
        this.planetEarth = this.add.image(this.planetEarthCoords[0], this.planetEarthCoords[1], "planetEarth").setScale(zoom245x135)
        this.logo = this.add.image(canvasSizes.width / 2, canvasSizes.height * 0.275, "logo").setScale(zoom245x135)
        this.playBtn = this.add.image(canvasSizes.width / 2, canvasSizes.height * 0.575, "playBtn").setScale(zoom245x135)
        this.settingsBtn = this.add.image(canvasSizes.width / 2, canvasSizes.height * 0.725, "settingsBtn").setScale(zoom245x135)
        this.shopBtn = this.add.image(canvasSizes.width / 2, canvasSizes.height * 0.875, "shopBtn").setScale(zoom245x135)

        this.playBtn.setInteractive().on('pointerdown', () => {
        switchScene(this, "PlanetSelector")
        })
    }

    update() {
        this.movePlanets()

        this.scaleButtons(this.playBtn)
        this.scaleButtons(this.settingsBtn)
        this.scaleButtons(this.shopBtn)
    }
}

export default MenuScene