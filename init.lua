local mod_name = "bamboo"
local average_height = 4

minetest.register_node("bamboo:bamboo_top", {
  tile_images = {"bamboo_top.png"},
  inventory_image = "bamboo_top.png",
  description = "bamboo",
  drawtype = "plantlike",
  sunlight_propagates = true,
  visual_scale = 1.4,
  paramtype = "light",
  walkable = false,
  groups = { snappy = 3,flammable=2, floored=1},
  sounds = default.node_sound_leaves_defaults(),
  selection_box = {
    type = "fixed",
    fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 },
  },
  drop = {
  max_items = 2,
  items = {
    {
      items = {'bamboo:bamboo_sapling'},
      rarity = 5,
      },
      {
      items = {"bamboo:bamboo"},
      }
    }
  },
})

minetest.register_node("bamboo:bamboo", {
  tile_images = {"bamboo.png"},
  inventory_image = "bamboo.png",
  description = "bamboo",
  drawtype = "plantlike",
  sunlight_propagates = true,
  visual_scale = 1.0,
  paramtype = "light",
  walkable = false,
  groups = { snappy = 3,flammable=2, floored=1},
  sounds = default.node_sound_leaves_defaults(),
  drop = {
  max_items = 2,
  items = {
    {
      items = {'bamboo:bamboo_sapling'},
      rarity = 5,
      },
      {
      items = {"bamboo:bamboo"},
      }
    }
  },
  selection_box = {
    type = "fixed",
    fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 },
  },
})

minetest.register_node("bamboo:bamboo_sapling", {
  tile_images = {"bamboo_top.png"},
  inventory_image = "bamboo_top.png",
  description = "bamboo",
  drawtype = "plantlike",
  sunlight_propagates = true,
  visual_scale = 0.9,
  paramtype = "light",
  walkable = false,
  groups = { snappy = 3,flammable=2, floored=1},
  sounds = default.node_sound_leaves_defaults(),
  selection_box = {
    type = "fixed",
    fixed = { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 },
  },
})

minetest.register_abm({
  nodenames = {"bamboo:bamboo_top"},
  interval = 30,
  chance = 5,
  action = function(pos)
  
    minetest.env:add_node(pos, {name="bamboo:bamboo"})
    if math.random(0, (average_height)) > 1.0 then
      local p_top = {x=pos.x, y=pos.y+1, z=pos.z}
      local n_top = minetest.env:get_node(p_top)
      if n_top.name =="air" then
        minetest.env:add_node(p_top, {name="bamboo:bamboo_top"})
      end
    end
  end,
})

minetest.register_abm({
  nodenames = {"bamboo:bamboo_sapling"},
  interval = 30,
  chance = 10,
  action = function(pos)
    minetest.env:add_node(pos, {name="bamboo:bamboo"})
    local p_top = {x=pos.x, y=pos.y+1, z=pos.z}
    local n_top = minetest.env:get_node(p_top)
    if n_top.name =="air" then
      minetest.env:add_node(p_top, {name="bamboo:bamboo_top"})
    end
    
  end,
})

print("[Bamboo] Loaded!")
