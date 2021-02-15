extends KinematicBody2D


onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

const MOTION_SPEED = 160 # Pixels/second.


func _physics_process(_delta: float) -> void:
	var motion = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	motion.y *= 0.5
	motion = motion.normalized() * MOTION_SPEED
	#warning-ignore:return_value_discarded
	move_and_slide(motion)
	
	if motion.x == 0 and motion.y == 0:
		play_anim("idle")
	
	if motion.x > 0 and motion.y == 0:
		play_anim("walk-right")
	
	if motion.x < 0 and motion.y == 0:
		play_anim("walk-left")
	
	if motion.x == 0 and motion.y > 0:
		play_anim("walk-down")
	
	if motion.x == 0 and motion.y < 0:
		play_anim("walk-up")
	
	if motion.x > 0 and motion.y > 0:
		play_anim("walk-down-right")
	
	if motion.x < 0 and motion.y > 0:
		play_anim("walk-down-left")
	
	if motion.x > 0 and motion.y < 0:
		play_anim("walk-up-right")
	
	if motion.x < 0 and motion.y < 0:
		play_anim("walk-up-left")


func play_anim(anim_name):
	if anim_player.is_playing() and anim_player.current_animation == anim_name:
		return
	anim_player.play(anim_name)
