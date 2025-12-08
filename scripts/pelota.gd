extends RigidBody2D

@export var speed = 250
var velocity = Vector2(0.5,-1) * speed

func _ready() -> void:
	gravity_scale = 0
	linear_velocity = velocity
	pass # Replace with function body.


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	linear_velocity = linear_velocity.normalized() * speed
	if state.get_contact_count() > 0:
		for i in range(state.get_contact_count()):
			var collider = state.get_contact_collider_object(i)
			if collider.is_in_group("brick"):
				collider.queue_free()
				get_parent().addScore()
			if collider.is_in_group("kill"):
				get_parent().removeLive()
				queue_free()
	pass
