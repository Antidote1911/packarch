static struct Config config = {
	/* font, separate different fonts with comma */
	.font = "Noto Sans:size=11,DejaVuSansMono:size=10",

	/* colors */
	.background_color="#29353B",
	.foreground_color="#FFF2B1",
	.selbackground_color="#29353B",
	.selforeground_color="#23edda",
	.separator_color="#e92f2f",
	.border_color="#29353B",

	/* sizes in pixels */
	.width_pixels = 130,        /* minimum width of a menu */
	.height_pixels = 25,        /* height of a single menu item */
	.border_pixels = 1,         /* menu border */
	.separator_pixels = 3,      /* space around separator */
	.gap_pixels = 0,            /* gap between menus */

	/*
	 * The variables below cannot be set by X resources.
	 * Their values must be less than .height_pixels.
	 */

	/* geometry of the right-pointing isoceles triangle for submenus */
	.triangle_width = 3,
	.triangle_height = 7,

	/* the icon size is equal to .height_pixels - .iconpadding * 2 */
	.iconpadding = 2,

	/* area around the icon, the triangle and the separator */
	.horzpadding = 8,
};
