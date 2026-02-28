-- Modern Transparent Image Loader for Conky 1.19.8
-- Cairo only (no imlib2)
-- Usage:
-- ${lua conky_image /path/image.png x y width height alpha(0-100)}

require 'cairo'

-- Draw Image
local function draw_image(cr, path, x, y, w, h, alpha_percent)

    local img = cairo_image_surface_create_from_png(path)
    if img == nil then return end

    local img_w = cairo_image_surface_get_width(img)
    local img_h = cairo_image_surface_get_height(img)

    local alpha = tonumber(alpha_percent) or 100
    if alpha < 0 then alpha = 0 end
    if alpha > 100 then alpha = 100 end
    alpha = alpha / 100

    cairo_save(cr)

    -- Move to position
    cairo_translate(cr, x, y)

    -- Scale to requested size
    cairo_scale(cr, w / img_w, h / img_h)

    -- Draw image at 0,0 because we've already translated
    cairo_set_source_surface(cr, img, 0, 0)
    cairo_paint_with_alpha(cr, alpha)

    cairo_restore(cr)
    cairo_surface_destroy(img)
end


function conky_image(path, x, y, w, h, alpha)

    if conky_window == nil then return '' end

    -- Prevent drawing on first update
    local updates = tonumber(conky_parse('${updates}')) or 0
    if updates < 2 then return '' end

    local cs = cairo_xlib_surface_create(
        conky_window.display,
        conky_window.drawable,
        conky_window.visual,
        conky_window.width,
        conky_window.height)

    local cr = cairo_create(cs)

    draw_image(cr,
        path,
        tonumber(x),
        tonumber(y),
        tonumber(w),
        tonumber(h),
        tonumber(alpha))

    cairo_destroy(cr)
    cairo_surface_destroy(cs)

    return ''
end
