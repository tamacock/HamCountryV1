cam = view_camera[0];
follow = object_Ham;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


//pixel perfect variables
camera = camera_create();
vm = matrix_build_lookat(0, 0, -10, 0, 0, 0, 0, 1, 0,);
pm = matrix_build_projection_ortho(global.gameWidth, global.gameHeight, 1, 3200);