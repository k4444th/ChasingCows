import './style.css'
import Phaser from 'phaser'

import MenuScene from './scenes/MenuScene'
import IntroSequence from './scenes/IntroSequence'
import PlanetSelector from './scenes/PlanetSelector'

export const canvasSizes = {
  height: 2160,
  width: 3920
}

export const transitionSpeed = 1000

export const zoom140x77 = 28
export const zoom245x135 = 16
export const fontSizeLarge = 100 

export const switchScene = (oldScene, newScene) => {
  oldScene.cameras.main.fadeOut(transitionSpeed, 0, 0, 0)

  oldScene.cameras.main.once(Phaser.Cameras.Scene2D.Events.FADE_OUT_COMPLETE, () => {
    oldScene.scene.start(newScene);
  })
};

export const resetLocalStorage = () => {
  localStorage.setItem('introSequenz', 'false')
}

const config = {
  type: Phaser.WEBGL,
  canvas: gameCanvas,
  height: canvasSizes.height,
  width: canvasSizes.width,
  pixelArt: true,
  scene:[
    MenuScene,
    PlanetSelector,
    IntroSequence
  ]
}

const game = new Phaser.Game(config)