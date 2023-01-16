
-- scene settings
scene_transition = SceneManager.crossfade
scene_transition_duration = 0.25

-- fonts


-- define scenes
sceneManager = SceneManager.new({
	Juego = Juego,
})
-- add manager to stage
stage:addChild(sceneManager)

-- start start scene
sceneManager:changeScene('Juego', scene_transition_duration, scene_transition)