import './style.css'
import Phaser from 'phaser'

import MenuScene from './scenes/MenuScene'
import PlanetSelector from './scenes/PlanetSelector'

export const canvasSizes = {
  height: 2160,
  width: 3920
}

const config = {
  type: Phaser.WEBGL,
  canvas: gameCanvas,
  height: canvasSizes.height,
  width: canvasSizes.width,
  pixelArt: true,
  scene:[
    MenuScene,
    PlanetSelector
  ]
}

const game = new Phaser.Game(config)

export const transitionSpeed = 1000

export const zoom140x77 = 28
export const zoom245x135 = 16
export const fontSizeLarge = 100 

export const switchScene = (oldScene, newScene) => {
  oldScene.cameras.main.fadeOut(1000, 0, 0, 0)

  oldScene.cameras.main.once(Phaser.Cameras.Scene2D.Events.FADE_OUT_COMPLETE, () => {
    oldScene.scene.start(newScene);
	})
};