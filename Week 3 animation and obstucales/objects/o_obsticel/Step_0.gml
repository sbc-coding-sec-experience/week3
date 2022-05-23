
// Movement
hsp = hspmove * hspwalksp;
vsp = vspmove * vspwalksp;

//Horizontal Collision
if (place_meeting(x+hsp,y,o_parent_wall)){
	while !(place_meeting(x+sign(hsp),y,o_parent_wall)){
		x = x + sign(hsp)
	}
	hspmove = hspmove*-1;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,o_parent_wall)){
	while !(place_meeting(x,y+sign(vsp),o_parent_wall)){
		y = y + sign(vsp)
	}
	vspmove = vspmove*-1;
}
y = y + vsp;

