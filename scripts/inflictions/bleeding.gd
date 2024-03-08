extends Infliction_Base
class_name Infliction_Bleeding

@export var bleed_amount : int

func start_effects():
	BattleManager.output_to_battlelog("[color=red]" + actor_link.actor_name + " bleeds from their wounds! -" + str(bleed_amount) + "HP[/color]")
	
	actor_link.current_health -= bleed_amount
	BattleManager.check_actor_downed(actor_link)


func perform_effects():
	BattleManager.output_to_battlelog("[color=red]" + actor_link.actor_name + " bleeds from their wounds! -" + str(bleed_amount) + "HP[/color]")
	
	actor_link.current_health -= bleed_amount
	BattleManager.check_actor_downed(actor_link)
	
	turns_left -= 1
	if turns_left <= 0 and !actor_link.defeated:
		BattleManager.output_to_battlelog("[color=yellow]" + actor_link.actor_name + " manages to shrug off their bleeding injury.[/color]")
		remove_effect_from_link()