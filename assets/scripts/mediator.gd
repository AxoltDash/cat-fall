extends Node

class_name Mediator

var enemies = []

func register_enemy(enemy):
    enemies.append(enemy)

func notify(sender, event, data = null):
    for enemy in enemies:
        if enemy != sender:
            enemy.receive_notification(event, data)