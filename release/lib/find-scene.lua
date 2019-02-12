M.scene_map_file = nil
M.save_scenes = function()
   local mapfile = io.open(M.scene_map_file, "w")
   mapfile:write("local map = {}\n")
   for k, v in spairs(scenes_map) do
      if k ~= "" then
         mapfile:write(("map['%s'] = '%s'\n"):format(k, v))
      end
   end
   mapfile:write("return map\n")
   mapfile:close()
end

M.load_scene_map = function()
   if not M.scene_map_file then
      local tmp_scene_map_file = M.configDirFile(("scenes-map-%dx%d@%s.lua"):format(M.real_width, M.real_height, android_serial))
      log("tmp scene_map_file is %s", tmp_scene_map_file)
      dofile_res, M.scenes_map = pcall(dofile, tmp_scene_map_file)
      if not dofile_res then
         M.scenes_map = {}
      end
      M.scene_map_file = tmp_scene_map_file
   end
end

M.forget_scene = function(scene)
   log("Forget scene: %s", scene)
   M.scenes_map[scene] = nil
end

M.refind_scene = function(scene, retry)
   if not retry or retry < 1 then
      retry = 1
   else
      retry = retry + 1
   end

   for i = 1, retry do
      if find_scene(scene) then
         return true
      end
      sleep(.1)
   end

   if retry == 1 then
      return false
   end

   forget_scene(scene)
   return find_scene(scene)
end

M.show_scene_for_dbg = function(scene)
   system(
      ("cd '%s' && convert failed-%s.png %s.png -append x.png && display x.png&"):format(
         M.resDir, scene, scene
   ))
end

M.update_scene = function(scene)
   system(("cd '%s'; mv failed-%s.png %s.png"):format(
         M.resDir, scene, scene
   ))
end

M.debug_scene_actions = {
   "XXX", "确认此现象是正常的（啥也不做）",
   "用 failed-XXX.png 进行替换",
   "我手动操作一下手机，然后你重新查找一遍",
}

M.get_debug_action = function(desc)
   M.debug_scene_actions[1] = desc
   local ans = select_args(M.debug_scene_actions)
   if ans == M.debug_scene_actions[2] then
      log("2: %s", M.debug_scene_actions[2])
   elseif ans == M.debug_scene_actions[3] then
      log("3: %s", M.debug_scene_actions[3])
   elseif ans == M.debug_scene_actions[1] then
      log("1: %s", ans)
   else
      log("!: %s", ans)
   end
   return ans
end

M.find_scene = function(scene, times)

   load_scene_map()
   if not times then
      times = 1
   end
   if M.g_find_scene_debug then
      system(("rm %s/failed-%s.png -f; killall display"):format(M.resDir, scene))
   end
   if not M.scenes_map[scene] then
      for i = 1, times do
         sleep(1)
         scene_xy = qx("find-scene.sh find-scene -s " .. scene .. " --scene-dir " .. M.resDir)
         if scene_xy ~= "" then
            break
         elseif i == times then
            if M.g_find_scene_debug then
               show_scene_for_dbg(scene)
               local action = M.get_debug_action(("无法找到新的场景：%s，要不要将 failed-%s.png 替换为 %s.png（如果选否，会重新查找，请确认）？"):format(scene, scene, scene))
               if action == M.debug_scene_actions[3] then
                  update_scene(scene);
               elseif action == M.debug_scene_actions[4] then
                  return find_scene(scene)
               end
            end
            return nil
         end
      end
      M.scenes_map[scene] = scene_xy
      save_scenes()
   end
   scene_xy = M.scenes_map[scene]

   s_x = scene_xy:gsub(" .*", "")
   s_y = scene_xy:gsub(".* ", "")

   if system(("find-scene.sh is-scene -x %s -y %s -s %s"):format(s_x, s_y, scene)) then
      log("found scene: %s at %s %s", scene, s_x, s_y)
      if M.g_find_scene_debug then
         show_scene_for_dbg(scene)
         local action = M.get_debug_action(("已找到场景：%s，要不要将 failed-%s.png 替换为 %s.png？"):format(scene, scene, scene))
         if M.action == M.debug_scene_actions[3] then
            update_scene(scene);
         elseif action == M.debug_scene_actions[4] then
            return find_scene(scene)
         end
      end
      return true
   else
      log("! found scene: %s at %s %s", scene, s_x, s_y)
      if M.g_find_scene_debug then
         show_scene_for_dbg(scene)
         local action = M.get_debug_action(("无法找到旧的场景：%s，要不要将 failed-%s.png 替换为 %s.png（如果选否，会忘掉它，当成新场景处理，请手动切换到此场景）？"):format(scene, scene, scene))
         if action == M.debug_scene_actions[3] then
            update_scene(scene);
         elseif action == M.debug_scene_actions[4] then
            forget_scene(scene);
            return find_scene(scene)
         end
      end
      return false
   end
end

M.click_scene = function (scene, settings)
   log("Click scene: %s", scene)
   settings = settings or {}

   x_plus = settings.x or 0
   y_plus = settings.y or 0
   click_times = settings.click_times or 1

   if not settings.skip_refind and not refind_scene(scene, settings.retry) then
      log("Can't find scene: %s for click (retry: %s)", scene, settings.retry)
      return
   end
   local xy = scenes_map[scene]
   xy = split(" ", xy)
   for n = 1, click_times do
      log("click %s @%d", scene, n)
      adb_tap_XY(xy[1] + x_plus, xy[2] + y_plus)
      if n < click_times then
         sleep(.1)
      end
   end
end

M.jump_from_to = function(from_scene, to_scene, settings)
   settings = settings or {}
   times = settings.times or 1
   sleep_time = settings.sleep_time or .2

   for t = 1, times do
      if find_scene(to_scene) then
         log("jumped from %s to %s", from_scene, to_scene)
         return
      end

      if find_scene(from_scene) then
         settings.skip_refind = 1
         click_scene(from_scene, settings)
         sleep(sleep_time)
         if t == times and find_scene(to_scene) then
            log("jumped from %s to %s", from_scene, to_scene)
            return
         end
      end
   end
   error("Can't jump from " .. from_scene .. " to " .. to_scene)
end
