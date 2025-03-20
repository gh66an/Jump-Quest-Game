extends CharacterBody2D

# ثوابت
const SPEED = 400.0
const JUMP_VELOCITY = -900.0

# المتغيرات
@onready var sprite_2d = $Sprite2D
@export var particle: PackedScene
@onready var jump_sound: AudioStreamPlayer2D = $jumpSound

var jump_count = 0

# الدوال الرئيسية
func _physics_process(delta):   
	handle_gravity(delta)   
	handle_movement(delta)   
	update_animation()
	move_and_slide()

# التعامل مع الجاذبية
func handle_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

# التعامل مع الحركة
func handle_movement(_delta):
	# القفز
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		jump()
		if jump_count == 2:
			spawn_particle()

	# الحركة الجانبية
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	# عكس الشخصية بناءً على الاتجاه
	sprite_2d.flip_h = velocity.x < 0

# تحديث الرسوم المتحركة
func update_animation():
	if is_on_floor():
		sprite_2d.animation = "running" if abs(velocity.x) > 1 else "default"
	else:
		sprite_2d.animation = "double_jump" if jump_count == 2 else "jumping"

# تنفيذ القفز
func jump():
	velocity.y = JUMP_VELOCITY
	jump_count += 1
	jump_sound.play()

# تنفيذ القفز مع حركة جانبية
func jump_side(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x
	spawn_particle()

# إنشاء تأثير الجسيمات
func spawn_particle():
	if not particle:
		print("Error: particle is null.")
		return

	var particle_node = particle.instantiate()
	if not get_parent():  # تحقق من أن الكائن لديه والد (parent)
		print("Error: Node has no parent.")
		return

	particle_node.position = position
	get_parent().add_child(particle_node)
	await get_tree().create_timer(0.3).timeout
	particle_node.queue_free()

		
