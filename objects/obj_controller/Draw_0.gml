drawSorted(par_depthsort)

// draw tooltips
while(ds_queue_size(global.ds_tooltip) > 0) {
	var o = ds_queue_dequeue(global.ds_tooltip);
	draw_sprite(o.sprite, 0, o.x, o.y);
}