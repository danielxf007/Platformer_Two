extends Position2D

export(float) var PUSH_FORCE = 0.0
export(Vector2) var PUSH_DIRECTION  = Vector2()
export(int) var DAMAGE = 0



func _on_AttackArea_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE, PUSH_DIRECTION * PUSH_FORCE)