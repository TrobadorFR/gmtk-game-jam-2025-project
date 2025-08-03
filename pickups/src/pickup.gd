class_name Pickup
extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("idle")

func activate():
	SignalBus.emit_signal("instrument_picked_up", self.name)
	$PickupSound.play()
	$AnimationPlayer.play("pickup")
	await $AnimationPlayer.animation_finished
	queue_free()
