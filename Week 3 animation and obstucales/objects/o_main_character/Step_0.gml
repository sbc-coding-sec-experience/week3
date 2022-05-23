/// @description Insert description here
// You can write your code in this editor

// Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);


// Movement
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;


//Single Jump
/*
if((place_meeting(x,y+1,o_wall)) && (key_jump) ){
	vsp = -16;
}*/

//Double jump

//show_debug_message(string(jumps_current) +"   "+ string(jumps_max)) // Debug message
if((key_jump) && jumps_current > 0){
	jumps_current-=1;
	vsp = -16;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,o_wall)){
	while !(place_meeting(x+sign(hsp),y,o_wall)){
		x = x + sign(hsp)
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,o_wall)){
	while !(place_meeting(x,y+sign(vsp),o_wall)){
		y = y + sign(vsp)
	}
	//Only needed when using double jumps for double jumps
	if(vsp > 0){
        jumps_current = jumps_max;
    }
	vsp = 0;
}

y = y + vsp;

//Animation
if !(place_meeting(x,y+1,o_wall)){
	sprite_index = s_main_character_idle;
	image_speed = 0;
	if (sign(vsp)>0){	
		image_index = 6; 
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (hsp = 0){
		sprite_index = s_main_character_idle	
	} else {
		sprite_index = s_main_character_run
	}
}

if ( hsp != 0 ) {
	image_xscale = sign(hsp);
}


