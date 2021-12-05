var key_canceljump, key_jump, key_left, key_right, key_right, key_roll, key_slamDown, key_slamRelease, key_taunt, key_up, key_canceljumpReleased;

key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(ord("Z"));
key_canceljump = keyboard_check_pressed(vk_down);
key_canceljumpReleased = keyboard_check_released(vk_down);
key_roll = keyboard_check_pressed(ord("X"));
key_slamDown = keyboard_check_pressed(vk_shift);
key_slamRelease = keyboard_check_released(vk_shift);
key_taunt = keyboard_check_pressed(ord("C"));
key_up = keyboard_check_pressed(vk_up);

//Anims
//roll anims

//slap anims

//Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//Roll Movement
if (key_roll) && (!roll)
{
	alarm[0] = rollDuration;
	roll = true;
	rollspX1 = sign(hsp) * rollSpd;
}
if (roll)
{
	hsp = rollspX1;
	if (key_jump) && (place_meeting(x,y+1,object_collider))
	{
		rollSpd += 1;
		rollDuration += 12;
	}
	if (key_jump) && (place_meeting(x,y,object_Parryblock))
	{
		rollSpd += 4;
		rollDuration += 14;
	}
	if (place_meeting(x+hsp,y,object_collider))
	{
		roll = false;
		rollSpd = 12;
		rollDuration = 37;
	}
}

//Jump
if (key_jump) && (place_meeting(x,y+1,object_collider))
{
	vsp = -10.5;
}
if (key_canceljump)
{
	grv = 2.5;
	roll = false;
}
if (place_meeting(x,y+1,object_collider))
{
	grv = 0.4;	
}
//Slap move
if (place_meeting(x,y+1,object_collider)) && (key_slamDown)
{
	walksp = 0;
	grv = 0;
}
if (key_slamRelease)
{	
	walksp = 6;
	grv = 0.4;
}

//Parry
if (place_meeting(x,y,object_Parryblock)) && (key_jump)
{
	vsp = -10.5;	
}

//Collision x and y
if (place_meeting(x+hsp,y,object_collider))
{
	while (!place_meeting(x+sign(hsp),y,object_collider))	
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;


if (place_meeting(x,y+vsp,object_collider))
{
	while (!place_meeting(x,y+sign(vsp),object_collider))	
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;



